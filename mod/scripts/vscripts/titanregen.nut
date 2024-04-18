global function TRBRegenInit

float titanRegenStartDelay = 4.0
int titanRegenRate = 25

void function TRBRegenInit(){
    if( GetConVarBool("titan_regen")){
        AddSoulInitFunc( RegenThreadStarter )
        if( GetConVarBool("titan_spillover")){
            AddDamageCallback( "player", TRBDamage )
            AddDamageCallback( "npc_titan", TRBDamage )
        }
    }
}

void function RegenThreadStarter( entity soul){
    thread RegenThread( soul )
}

void function RegenThread( entity soul){

	soul.EndSignal( "OnTitanDeath" )
    soul.EndSignal( "OnDestroy" )

	entity titan = soul.GetTitan()
	if ( !IsValid( titan ) )
		return

    int lastTitanHealth = titan.GetHealth()
	int maxHealth = titan.GetMaxHealth()
	float lastTime = Time()
	float lastDamaged = lastTime
	bool regenerating = false

    float thisTitanStartDelay = titanRegenStartDelay
	int thisTitanRegenRate = titanRegenRate

	if( GetSoulTitanSubClass( soul ) == "ogre" ){
        thisTitanStartDelay -= 1.25
        titanRegenRate += 5
	}else if( GetSoulTitanSubClass( soul ) == "stryder" ){
        thisTitanStartDelay += 1.25
        titanRegenRate -= 5
    }

	while( 1 ){
        wait 0.1
        titan = soul.GetTitan()
        if( soul.IsDoomed() || titan.GetHealth() == titan.GetMaxHealth() )
            continue

        int titanHealth = titan.GetHealth()
        int segmentMax = (ceil( titanHealth / 2500.0) * 2500).tointeger()

        // Stop regen due to damage or full health
        if( titanHealth < lastTitanHealth || titanHealth == maxHealth || titanHealth == segmentMax ){
            lastDamaged = Time()
            regenerating = false
        }

        // Start regen if conditions met
        if( titanHealth < segmentMax && Time() - lastDamaged > thisTitanStartDelay || titanHealth < segmentMax && titanHealth > lastTitanHealth ){
            if( !regenerating && titan.IsPlayer() ){
                EmitSoundOnEntityOnlyToPlayer( titan, titan, "titan_energyshield_up_1P" )
                EmitSoundOnEntityOnlyToPlayer( titan, titan, "coop_generator_shieldrecharge_start" )
            }
            regenerating = true
        }

        // Apply regen
        if( regenerating ){
            int newHealth = min( segmentMax, titanHealth + thisTitanRegenRate ).tointeger()
            if( newHealth > titanHealth )
                titan.SetHealth( newHealth )
        }

        lastTitanHealth = titanHealth
		lastTime = Time()
	}
}

// Detect incoming damage on ogre
void function TRBDamage( entity titan, var damageInfo ){
    if ( !titan.IsTitan() )
		return
	entity soul = titan.GetTitanSoul()
	if ( !IsValid( soul ) )
		return
    if( GetSoulTitanSubClass( soul ) != "ogre" )
        return

    thread TRBDamageThread( titan, damageInfo )
}

// Set ogre to invulnerable for 0.25s when health segment lost
void function TRBDamageThread( entity titan, var damageInfo ){
	int segmentMax = (floor( titan.GetHealth() / 2500.0) * 2500).tointeger()
	if( segmentMax == 0 || titan.GetHealth() == segmentMax )
        return

    WaitFrame()

    if( IsValid(titan) && IsAlive(titan) && titan.IsTitan() && titan.GetHealth() < segmentMax ){
        titan.SetInvulnerable()
        titan.SetHealth( segmentMax )
        wait 0.25
        if( IsValid(titan) && IsAlive(titan) ){
            titan.ClearInvulnerable()
        }
    }
}
