# MENTAL TitanreBalance

This is an attempt to generally balance the titans using server-side only changes. Intended to be a rough drop-in improvement for server hosts running any mode with titans. If you are looking for something more comprehensive, and do not mind client-side changes, look into Dinorush's excellent LTS specific rebalance of the titans.

Thanks to Dinorush, some of my changes, numbers and small parts of some scripts are lifted straight from the LTS rebalance.

If you'd like to contribute your complaints, suggestions or praises, you can join the relevant channel on my discord at https://discord.gg/CYgSUecryp

### !titans command

The mod also includes a script that will allow players to use the !titans chat command to access the changelog for any titan, as well as get summaries of changes to their current titan. This requires FSU to work.

Get FSU here: [Fifty's Server Utilities](https://northstar.thunderstore.io/package/Fifty/Server_Utilities/)

You CAN run the rebalance without FSU. You will not be able to use the !titans command, but contextual titan change info can still be enabled in mod.json.

## Full Changelist

### Titan kits

    Overcore
    - Now provides electric smoke at 40%, instead of instantly

### Ion

    Splitter rifle
    - Energy cost of split fire reduced 30 > 20

    Vortex shield
    - Activation costs 50 energy
    - Activation requires minimum 150 energy
    - Usage cost reduced 2 > 1.2

    Laser Tripwire
    - Energy cost 35 > 15

    Zero-point tripwire kit
    - Now costs energy (7.5)
    - Faster cooldown 10s > 6s
    - Only two pylons
    - Damage 1500 > 800

    Refraction lens kit
    - No longer costs extra energy
    - Also benefits from the cost reduction 30 > 20

### Tone

    40mm Cannon
    - Splash radius reduced 150 > 80
    - Spread increased
    - Damage increased 330 > 420 / 200 > 250
    - Magazine size reduced 12 > 9
    - Lock lifetime 15s > 10s

    Particle Wall
    - Health reduced 2000 > 1400
    - Duration reduced 6s > 5s

    Reinforced Particel Wall kit
    - Duration reduced 9s > 8s
    - Health reduced 3000 > 2000
    - Cooldown reduced 14s > 10s

    Burst Loader kit
    - Burst rate 5 > 9
    - Normal fire rate is no longer reduced

### Ronin

    Leadwall
    - Projectile speed increased 4400 > 5280 (also increases range)

    Sword Block
    - Damage reduction range 80-20%
    - Damage reduction fades the more damage is taken
    - At 5000 damage blocked, only 20% is blocked
    - Only blocked damage counts towards loss in damage reduction

    Sword Core
    - Damage reduced 2200 > 2000
    - Dash regen reduced 6.5x > 4.5x
    - Duration 12s > 10s

### Northstar

    Railgun
    - Base damage increased 250 > 300
    - Charge damage decreased 300 > 200
    - Reload time decreased 2s > 1.8s

    Flight Core
    - Duration reduced 6s > 4s
    - Fire rate increased 12 > 15
    - Landing/Take-off time decreased 1s > 0.6s
    - Rocket speed increased 2000 > 2750

### Legion

    Predator Cannon
    - Magazine size 100 > 140

    Gun Shield
    - ADS lock is removed on break
    - Size increased 105 > 120
    - Health increased 2500 > 3500
    - Duration 6s > 8s

    Powershot
    - Causes immense block cost on vortex shield

    Bulwark kit
    - Increased duration 8s > 10s

    Ammo kit
    - Ammo increased 140 > 200

### Scorch

    Thermite Launcher
    - Fire rate 1.7 > 1.2
    - Magazine size increased 1 > 2
    - Reload is segmented (like mastiff)
    - Projectile speed: 2200 > 2750
    - Projectile gravity: 0.625 > 0.977 (preserves arc)
    - ADS spread removed

### Monarch

    XO-16
    - Converted to projectile

    Energy Siphon
    - Shields gained 750 > 500

    Rocket Salvo
    - Damage increased 250 > 300

    Energy Thief kit
    - No longer provides a battery, instead gives 1000 shield

    Shield Amplifier kit
    - Bonus shields provided 25% > 100% (1000)

    Core
        Missile Racks
        - Missile count: 12 > 9
        - Cooldown time: 6s > 8s

        Arc Rounds
        - Magazine size bonus: 10 > 0
        - Vortex drain: 3.3% > 2.0%

        Energy Transfer
        - Hitting a teammate grants them 750 shields
        - Also grants the user 300 shields

        Maelstrom
        - Titan damage bonus reduced: 3x > 2x

        MTMS
        - Lock retention time: 0.2s > 0.8s
        - Inner explosion radius: 0 > 60
        - Projectile speed: 2200 > 2500
        - Minimum ammo to use: 20% > 1 missile cost

        Accelerator
        - Fire rate min: 8 > 9
        - Fire rate acceleration time: 3s > 2s
        - Fire rate cooldown time: 2.15s > 1.4s
        - Damage bonus: 25% > 10%

        Superior Chassis
        - Health increase: 5000 > 2500
