global const TITAN_REBALANCE_VERSION = "1.0.0"
// Data structure: "titan","id","name","summary","details"
global array <array <string> > titanData = [

//     [
//         "", "", "", "", ""
//     ],

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
        "ion", "tripwire", "Laser Tripwire", "Tripwire costs less than half energy."
        "- Energy cost 35 > 15"
    ],[
        "ion", "zeropoint", "Zero-Point Tripwire", "Zero-Point costs a tiny amount of energy, deploys a smol version of the tripwire."
        "- Now costs energy (7.5)" + "\n" +
        "- Faster cooldown 10s > 6s" + "\n" +
        "- Only two pylons" + "\n" +
        "- Damage 1500 > 800"
    ],[
        "ion", "refraction", "Refraction Lens", "Refraction Lens kit no longer costs extra energy."
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
        "tone", "particlewall","Particle Wall", "Summary.",
        "- Health reduced 2000 > 1400" + "\n" +
        "- Duration reduced 6s > 5s"
    ],[
        "tone", "reinforced","Reinforced Particel Wall", "Summary.",
        "- Duration reduced 9s > 8s" + "\n" +
        "- Health reduced 3000 > 2000" + "\n" +
        "- Cooldown reduced 14s > 10s"
    ],[
        "tone", "burst","Burst Loader", "The Burst Loader no longer nerfs fire-rate.",
        "- Burst rate 5 > 9" + "\n" +
        "- Normal fire rate is no longer reduced"
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
    ],

    // Northstar
    [
        "northstar", "railgun", "Railgun", "Railgun reloads faster, charge damage is reduced.",
        "- Base damage increased 250 > 300" + "\n" +
        "- Charge damage decreased 300 > 200" + "\n" +
        "- Reload time decreased 2s > 1.8s"
    ],[
        "northstar", "flightcore","Flight Core", "Flight Core is faster.",
        "- Duration reduced 6s > 4s" + "\n" +
        "- Fire rate increased 12 > 15" + "\n" +
        "- Landing/Take-off time decreased 1s > 0.6s" + "\n" +
        "- Rocket speed increased 2000 > 2750"
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
        "legion", "bulwark","Bulwark", "Bulwark makes the Gun Shield last an additional 2 seconds.",
        "- Increased duration 8s > 10s"
    ],[
        "legion", "ammokit","Ammo", "The Ammo kit gives even more ammo.",
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
        "- ADS spread removed"
    ],

    // Monarch
    [
        "monarch", "xo16", "XO-16", "The XO-16 now fires projectiles.",
        "- Converted to projectile"
    ],[
        "monarch", "energysiphon", "Energy Siphon", "Energy Siphon provides only 500 shields.",
        "- Shields gained 750 > 500"
    ],[
        "monarch", "rocketsalvo","Rocket Salvo", "Rocket Salvo damage is increased.",
        "- Damage increased 250 > 300"
    ],[
        "monarch", "energythief","Energy Thief", "Energy Thief only provides shields, not a battery.",
        "- No longer provides a battery, instead gives 1000 shield"
    ],[
        "monarch", "amplifier","Shield Amplifier", "Shield Amplifier now gives double shields.",
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
        "- Also grants the user 300 shields"
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












