global const TITAN_REBALANCE_VERSION = "1.0.1"
// Data structure: "titan","id","name","summary","details"
global array <array <string> > titanData = [

//     [
//         "", "", "", "", ""
//     ],

    // General
    [
        "general", "dash", "Legion/Scorch Dash", "Legion and Scorch now dash slightly more often.",
        "- Cooldown 10s > 8"
    ],[
        "general", "assault", "Assault Chip", "Assault Chip builds core faster the more damaged your titan is.",
        "- Additional effect: build core faster the more damaged your titan is"
    ],[
        "general", "counter", "Counter Ready", "Counter Ready makes electric smoke reusable."
        "- Turns electric smoke into a reusable ability" + "\n" +
        "- Cooldown 20s"
    ],

    // Ion
    [
        "ion", "splitter", "Splitter Rifle", "Split fire cost is reduced by a third.",
        "- Energy cost of split fire reduced 30 > 20"
    ],[
        "ion", "vortex", "Vortex shield", "Raising the vortex shield costs some energy, but keeping it up costs less.",
        "- Activation costs 50 energy" + "\n" +
        "- Activation requires minimum 150 energy" + "\n" +
        "- Usage cost reduced 2 > 1.2"
    ],[
        "ion", "tripwire", "Laser Tripwire", "Tripwire cost reduced to less than half."
        "- Now has damage falloff" + "\n" +
        "- Energy cost 35 > 15"
    ],[
        "ionkit", "zeropoint", "Zero-Point Tripwire", "Zero-Point costs a tiny amount of energy, and is able to deploy two wires."
        "- Now costs energy (7.5)" + "\n" +
        "- Slower cooldown 10s > 16s" + "\n" +
        "- Two charges, each deploying two pylons" + "\n" +
        "- Damage 1500 > 800"
    ],[
        "ionkit", "vortex", "Vortex Amplifier", "Amplified Vortex shield costs more to activate, but can absorb more."
        "- Activation cost increased 50 > 75" + "\n" +
        "- Vortex shield drains slower" + "\n" +
        "- Impact drain is lower"
    ],[
        "ionkit", "refraction", "Refraction Lens", "Refraction Lens kit no longer costs extra energy."
        "- No longer costs extra energy" + "\n" +
        "- Also benefits from the cost reduction"
    ],

    // Tone
    [
        "tone", "40mmcannon", "40mm Cannon", "40mm magazine is reduced. It does more damage, but with a smaller splash radius. Locks expire sooner.",
        "- Splash radius reduced 150 > 80" + "\n" +
        "- Spread increased" + "\n" +
        "- Damage increased 330 > 420 / 200 > 250" + "\n" +
        "- Magazine size reduced 12 > 9" + "\n" +
        "- Lock lifetime 15s > 10s"
    ],[
        "tone", "particlewall","Particle Wall", "Particle wall health and duration is reduced.",
        "- Health reduced 2000 > 1400" + "\n" +
        "- Duration reduced 6s > 5s"
    ],[
        "tonekit", "reinforced","Reinforced Particel Wall", "Reinforced Particle wall health and duration is reduced. Cooldown is faster.",
        "- Duration reduced 9s > 8s" + "\n" +
        "- Health reduced 3000 > 2000" + "\n" +
        "- Cooldown reduced 14s > 10s"
    ],[
        "tonekit", "burst","Burst Loader", "The Burst Loader no longer nerfs fire-rate.",
        "- Burst rate 5 > 9" + "\n" +
        "- Normal fire rate is no longer reduced"
    ],[
        "tonekit", "tracker","Enhanced Tracker", "Enhanced Tracker applies a debuff, causing the next hit to provide two locks.",
        "- A hit applies a debuff, causing next hit to provide two locks" + "\n" +
        "- Lasts 1 second"
    ],

    // Ronin
    [
        "ronin", "leadwall", "Leadwall", "The Leadwall has 20% more range.",
        "- Projectile speed increased 4400 > 5280 (also increases range)"
    ],[
        "ronin", "swordblock","Sword Block", "Sword Block loses effectiveness as more damage is taken. Sword regenerates while sheathed.",
        "- Damage reduction range 80-20%" + "\n" +
        "- Damage reduction fades the more damage is taken" + "\n" +
        "- At 6500 damage, only 20% is blocked"
    ],[
        "ronin", "swordcore","Sword Core", "Sword Core damage reduced, dash regen reduced.",
        "- Damage reduced 2200 > 2000" + "\n" +
        "- Dash regen reduced 6.5x > 4.5x" + "\n" +
        "- Duration 12s > 10s"
    ],[
        "roninkit", "ricochet","Ricochet Rounds", "Ricochet Rounds bounce towards enemies.",
        "- Removed projectile speed reduction" + "\n" +
        "- Projectiles now bounce more, and towards nearby enemies" + "\n" +
        "- Bounced projectiles have 20% damage reduction"
    ],[
        "roninkit", "highlander","Highlander", "The Highlander kit provides an arc/phase cooldown boost on sword hit.",
        "- No longer extends core duration" + "\n" +
        "- Successful sword hits provide 20% cooldown bonus for arc wave and phase dash" + "\n" +
        "- Additional 20%, for a total of 40%, during sword core"
    ],

    // Northstar
    [
        "northstar", "railgun", "Railgun", "Railgun reloads faster, charge damage is reduced.",
        "- Fire rate increased 0.9 > 1.2" + "\n" +
        "- Base damage increased 250 > 400" + "\n" +
        "- Charge damage decreased 300 > 200" + "\n" +
        "- Reload time decreased 2s > 1.8s"
    ],[
        "northstar", "flightcore","Flight Core", "Flight Core is faster.",
        "- Duration reduced 6s > 4s" + "\n" +
        "- Fire rate increased 12 > 15" + "\n" +
        "- Landing/Take-off time decreased 1s > 0.6s" + "\n" +
        "- Rocket speed increased 2000 > 2750"
    ],[
        "northstar", "tether","Tether Trap", "Tether trap now activates quicker after deployment and applies stun.",
        "- Activation delay 1.5s > 0.6s" + "\n" +
        "- Trigger range 350 > 420" + "\n" +
        "- Applies stun for 1s"

    ],

    // Legion
    [
        "legion", "predator", "Predator Cannon", "The Predator Cannon comes with a lot more ammo.",
        "- Magazine size 100 > 140"
    ],[
        "legion", "gunshield","Gun Shield", "Gun shield is bigger, has more health, and lasts longer.",
        "- ADS lock is removed on break" + "\n" +
        "- Size increased 105 > 120" + "\n" +
        "- Health increased 2500 > 3500" + "\n" +
        "- Duration 6s > 8s"
    ],[
        "legionkit", "bulwark","Bulwark", "Bulwark makes the Gun Shield last an additional 2 seconds.",
        "- Increased duration 8s > 10s"
    ],[
        "legionkit", "lightweight","Lightweight Alloys kit", "Lightweight Alloys allows even faster movement.",
        "- ADS movement speed increased 0.75 > 1.0"
    ],[
        "legionkit", "ammokit","Ammo", "The Ammo kit gives even more ammo.",
        "- Ammo increased 140 > 200"
    ],

    // Scorch
    [
        "scorch", "thermite", "Thermite Launcher", "The Thermite Launcher now holds two rounds, and fires faster projectiles more accurately.",
        "- Fire rate 1.7 > 1.2" + "\n" +
        "- Magazine size increased 1 > 2" + "\n" +
        "- Reload is segmented (like mastiff)" + "\n" +
        "- Projectile speed: 2200 > 2750" + "\n" +
        "- Projectile gravity: 0.625 > 0.977 (preserves arc)" + "\n" +
        "- ADS spread removed" + "\n" +
        "- Thermite lifetime 2.0-2.5s > 1.0-1.15s"
    ],[
        "scorch", "heatshield","Thermal Shield", "The heat shield can be used more often.",
        "- DPS reduced 2000 > 1800" + "\n" +
        "- Reduce cooldown 8s > 7s" + "\n" +
        "- Size increased 120 > 140"
    ],[
        "scorch", "firewall","Firewall", "The firewall goes out a second sooner.",
        "- Fire duration 5.2s > 4s"
    ],[
        "scorch", "gascanister","Gas Canister", "The Gas Canister duration is reduced, but it has a faster cooldown.",
        "- Gas duration 12 > 10" + "\n" +
        "- Fire duration 5.2s > 5s" + "\n" +
        "- Cooldown 15s > 13s"
    ],[
        "scorchkit", "inferno","Inferno Shield", "The inferno kit cooldown penalty is reduced.",
        "- Reduce cooldown penalty 50% > 20%"
    ],[
        "scorchkit", "fuelforthefire","Fuel for the Fire", "Fuel for the Fire allows deploying three smaller gas canisters.",
        "- Gas Canister gets an additional charge" + "\n" +
        "- Cooldown per canister 6s > 5s"
    ],[
        "scorchkit", "scorchedearth","Scorched Earth", "Scorched Earth now extends the fire duration of all abilities.",
        "- Extend fire duration of all abilities 4s > 5.2s" + "\n" +
        "- Essentially restores the vanilla fire duration"
    ],

    // Monarch
    [
        "monarch", "xo16", "XO-16", "The XO-16 now fires projectiles.",
        "- Pilot damage reduced 3 hit > 4 hit / 45 > 33 / 40 > 19" + "\n" +
        "- Falloff 1200 > 1000 / 1800 > 1800"
    ],[
        "monarch", "energysiphon", "Energy Siphon", "Energy Siphon provides only 500 shields.",
        "- Shields gained 750 > 500"
    ],[
        "monarch", "rocketsalvo","Rocket Salvo", "Rocket Salvo damage is increased.",
        "- Damage increased 250 > 300" + "\n" +
        "- Rocket speed increased 1000 > 2500"
    ],[
        "monarchkit", "energythief","Energy Thief", "Energy Thief only provides shields, not a battery.",
        "- No longer provides a battery, instead only restores shield"
    ],[
        "monarchkit", "amplifier","Shield Amplifier", "Shield Amplifier now gives double shields.",
        "- Bonus shields provided 25% > 100% (1000)"
    ],

    // Upgrade core
    [
        "upgradecore", "missileracks","Missile Racks", "Missile Rack provides fewer extra rockets, and has a longer cooldown.",
        "- Missile count: 12 > 9" + "\n" +
        "- Cooldown time: 6s > 8s"
    ],[
        "upgradecore", "arcrounds","Arc Rounds", "Arc rounds do not provide a magazine bonus. Effect against vortex reduced.",
        "- Magazine size bonus: 10 > 0" + "\n" +
        "- Vortex drain: 3.3% > 2.0%"
    ],[
        "upgradecore", "energytransfer","Energy Transfer", "Energy transfer now gives the user shields, too.",
        "- Hitting a teammate grants them 750 shields" + "\n" +
        "- Also grants the user 500 shields"
    ],[
        "upgradecore", "maelstrom","Maelstrom", "Maelstrom damage bonus is only double, not triple.",
        "- Titan damage bonus reduced: 3x > 2x"
    ],[
        "upgradecore", "mtms","MTMS", "MTMS rockets are faster, locks are easier.",
        "- Lock retention time: 0.2s > 0.8s" + "\n" +
        "- Inner explosion radius: 0 > 60" + "\n" +
        "- Projectile speed: 2200 > 2500" + "\n" +
        "- Minimum ammo to use: 20% > 1 missile cost"
    ],[
        "upgradecore", "accelerator","Accelerator", "Accelerator fires faster, but does less damage.",
        "- Fire rate min: 8 > 9" + "\n" +
        "- Fire rate acceleration time: 3s > 2s" + "\n" +
        "- Fire rate cooldown time: 2.15s > 1.4s" + "\n" +
        "- Damage bonus: 25% > 10%"
    ],[
        "upgradecore", "superiorchassis","Superior Chassis", "Superior Chassis only provides one extra bar.",
        "- Health increase decreased: 5000 > 2500"
    ]
]












