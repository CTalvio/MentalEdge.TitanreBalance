untyped

global function OnWeaponPrimaryAttack_titanweapon_leadwall
global function OnProjectileCollision_titanweapon_leadwall

#if SERVER
global function OnWeaponNpcPrimaryAttack_titanweapon_leadwall
#endif // #if SERVER

const LEADWALL_MAX_BOLTS = 8 // this is the code limit for bolts per frame... do not increase.

const float REBALANCE_SPREAD_FRAC = 0.043
const float LEADWALL_LIFETIME_MAX = 0.35
const float REBALANCE_LEADWALL_VELOCITY = 4400
const float REBALANCE_RICOCHET_SEEK_DOT_MIN = 0.87
const float REBALANCE_RICOCHET_SEEK_DOT_MAX = 1
const float REBALANCE_RICOCHET_SEEK_RANGE_MAX = LEADWALL_LIFETIME_MAX * REBALANCE_LEADWALL_VELOCITY // max lifetime * velocity * scalar
const float REBALANCE_RICOCHET_SEEK_RANGE_MIN = LEADWALL_LIFETIME_MAX * REBALANCE_LEADWALL_VELOCITY * 0.25 // max lifetime * velocity * scalar
const float REBALANCE_RICOCHET_SPREAD_MOD = 4 // Increase spread of ricochet'd shots to better match normal spread fired at the target
const float REBALANCE_RICOCHET_MAX_COMPENSATE = 10
global const int REBALANCE_PHASE_REFLEX_AMMO = 4

struct
{
	float[2][LEADWALL_MAX_BOLTS] boltOffsets = [
		[0.2, 0.8], // right
		[0.2, -0.8], // left
		[-0.2, 0.65],
		[-0.2, -0.65],
		[0.2, 0.2],
		[0.2, -0.2],
		[-0.2, 0.2],
		[-0.2, -0.2],

	]

	int maxAmmo
	float ammoRegenTime
} file

var function OnWeaponPrimaryAttack_titanweapon_leadwall( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	return FireWeaponPlayerAndNPC( attackParams, true, weapon )
}

#if SERVER
var function OnWeaponNpcPrimaryAttack_titanweapon_leadwall( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	return FireWeaponPlayerAndNPC( attackParams, false, weapon )
}
#endif // #if SERVER

function FireWeaponPlayerAndNPC( WeaponPrimaryAttackParams attackParams, bool playerFired, entity weapon )
{
	entity owner = weapon.GetWeaponOwner()
	bool shouldCreateProjectile = false
	if ( IsServer() || weapon.ShouldPredictProjectiles() )
		shouldCreateProjectile = true
	#if CLIENT
		if ( !playerFired )
			shouldCreateProjectile = false
	#endif

	vector attackAngles = VectorToAngles( attackParams.dir )
	vector baseUpVec = AnglesToUp( attackAngles )
	vector baseRightVec = AnglesToRight( attackAngles )

	if ( shouldCreateProjectile )
	{
		weapon.EmitWeaponNpcSound( LOUD_WEAPON_AI_SOUND_RADIUS_MP, 0.2 )
		int numProjectiles = weapon.GetProjectilesPerShot()
		float adsMultiplier
		if ( owner.IsPlayer() )
			adsMultiplier = GraphCapped( owner.GetZoomFrac(), 0, 1, 1.0, 0.5 )
		else
			adsMultiplier = 1.0

		for ( int index = 0; index < numProjectiles; index++ )
		{
			vector upVec = baseUpVec * file.boltOffsets[index][0] * 0.05 * RandomFloatRange( 1.2, 1.7 ) * adsMultiplier
			vector rightVec = baseRightVec * file.boltOffsets[index][1] * 0.05 * RandomFloatRange( 1.2, 1.7 ) * adsMultiplier

			vector attackDir = attackParams.dir + upVec + rightVec
			float projectileSpeed = 5280 // TITANREBALANCE was 4400

			if ( weapon.GetWeaponClassName() == "mp_weapon_shotgun_doublebarrel" )
				{
					attackDir = attackParams.dir
					projectileSpeed = 3800
				}

			entity bolt = weapon.FireWeaponBolt( attackParams.pos, attackDir, projectileSpeed, damageTypes.largeCaliber | DF_SHOTGUN, damageTypes.largeCaliber | DF_SHOTGUN, playerFired, index )
			if ( bolt )
			{
				bolt.kv.gravity = 0.4 // 0.09
				bolt.s.index <- index
				bolt.s.adsMultiplier <- adsMultiplier

				if ( weapon.GetWeaponClassName() == "mp_weapon_shotgun_doublebarrel" )
					bolt.SetProjectileLifetime( RandomFloatRange( 1.0, 1.3 ) )
				else
				bolt.SetProjectileLifetime( RandomFloatRange( 0.30, 0.35 ) )

				EmitSoundOnEntity( bolt, "wpn_leadwall_projectile_crackle" )
			}
		}
	}

	return 1
}

void function OnProjectileCollision_titanweapon_leadwall( entity projectile, vector pos, vector normal, entity hitEnt, int hitbox, bool isCritical )
{
	#if SERVER
		int bounceCount = projectile.GetProjectileWeaponSettingInt( eWeaponVar.projectile_ricochet_max_count )

		if ( projectile.proj.projectileBounceCount >= bounceCount )
			return

		projectile.proj.projectileBounceCount++

		if ( hitEnt != svGlobal.worldspawn )
			return

		EmitSoundAtPosition( TEAM_UNASSIGNED, pos, "Bullets.DefaultNearmiss" )

		// We only want to run the following stuff on first bounce
		if ( projectile.proj.projectileBounceCount > 2 )
		{
			// HACK - using bounce count to check whether we are in the middle of homing delay
			if ( projectile.proj.projectileBounceCount < 100 )
				projectile.Destroy()
			return
		}

		projectile.SetProjectileLifetime( LEADWALL_LIFETIME_MAX )
		Rebalance_RicochetSeek( projectile, normal )
	#endif
}

#if SERVER
void function Rebalance_RicochetSeek( entity projectile, vector normal )
{
	vector projectilePos = projectile.GetOrigin()
	vector ricochetDir = Normalize( projectile.GetVelocity() - 2 * ( projectile.GetVelocity().Dot( normal ) ) * normal )

	array<entity> enemyTitans = GetNPCArrayEx( "npc_titan", TEAM_ANY, projectile.GetTeam(), projectilePos, REBALANCE_RICOCHET_SEEK_RANGE_MAX )
	array<entity> enemyPlayers = GetPlayerArrayOfEnemies_Alive( projectile.GetTeam() )

	float minDistSqr = REBALANCE_RICOCHET_SEEK_RANGE_MAX * REBALANCE_RICOCHET_SEEK_RANGE_MAX
	entity minEnt = null

	foreach ( player in enemyPlayers )
		if ( player.IsTitan() )
			enemyTitans.append( player )

	foreach ( titan in enemyTitans )
	{
		float distSqr = DistanceSqr( titan.GetWorldSpaceCenter(), projectilePos )
		if ( distSqr >= minDistSqr )
			continue

		float dist = sqrt( distSqr )
		float minDot = GraphCapped( dist, REBALANCE_RICOCHET_SEEK_RANGE_MIN, REBALANCE_RICOCHET_SEEK_RANGE_MAX, REBALANCE_RICOCHET_SEEK_DOT_MIN, REBALANCE_RICOCHET_SEEK_DOT_MAX )
		float dot = ricochetDir.Dot( Normalize( titan.GetWorldSpaceCenter() - projectilePos ) )

		if ( dot < minDot )
			continue

		TraceResults hitResult = TraceLine( projectilePos, titan.GetWorldSpaceCenter(), [ projectile ], TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_BLOCK_WEAPONS )
		if ( hitResult.hitEnt == null )
		{
			minDistSqr = distSqr
			minEnt = titan
		}
	}

	if ( minEnt != null )
	{
		projectile.SetProjectileLifetime( 0.3 ) // Some duration of time so it doesn't die before tracking the target
		thread Rebalance_SetRicochetVelocity( projectile, minEnt )
	}
}

void function Rebalance_SetRicochetVelocity( entity projectile, entity ent )
{
	try{
		float bounceTime = Time()
		float oldDist = Distance( projectile.GetOrigin(), ent.GetWorldSpaceCenter() )
		projectile.proj.projectileBounceCount = 100
		WaitEndFrame()

		if ( !IsValid( projectile ) )
			return

		projectile.proj.projectileBounceCount = 3
		if ( !IsValid( ent ) )
		{
			return
		}

		float dist = Distance( projectile.GetOrigin(), ent.GetWorldSpaceCenter() )
		vector dir = Normalize( ent.GetWorldSpaceCenter() - projectile.GetOrigin() )

		vector angle = VectorToAngles( dir )
		vector baseUpVec = AnglesToUp( angle )
		vector baseRightVec = AnglesToRight( angle )
		int index = expect int( projectile.s.index )
		float adsMult = expect float( projectile.s.adsMultiplier )

		// Additional thingy to make the spread bigger or smaller to compensate for delay between hitting the environment and seeking the target
		float distMod = min( REBALANCE_RICOCHET_MAX_COMPENSATE, oldDist / dist )

		vector upVec = baseUpVec * file.boltOffsets[index][0] * REBALANCE_SPREAD_FRAC * RandomFloatRange( 1.2, 1.7 ) * adsMult
		vector rightVec = baseRightVec * file.boltOffsets[index][1] * REBALANCE_SPREAD_FRAC * RandomFloatRange( 1.2, 1.7 ) * adsMult

		dir += ( upVec + rightVec ) * REBALANCE_RICOCHET_SPREAD_MOD * distMod
		projectile.SetVelocity( dir * REBALANCE_LEADWALL_VELOCITY )
	}catch(exception){
		print("[TITANREBALANCE] Ronins leadwall did an oopsie")
	}
}
#endif
