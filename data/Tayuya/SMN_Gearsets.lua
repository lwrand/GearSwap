-- Setup your Key Bindings here:  
    windower.send_command('bind f7 gs c toggle mb')
    windower.send_command('bind f9 gs c avatar mode')
    windower.send_command('bind f10 gs c toggle auto')
    windower.send_command('bind f12 gs c toggle melee')
     
     
-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.avatar = {}    -- leave this empty
      
    -- Your idle set when you DON'T have an avatar out
    sets.me.idle = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Moonshade Earring",
        rear="Andoaa Earring",
        body="Shomonjijoe +1",
        hands={ name="Merlinic Dastanas", augments={'CHR+12','Attack+14','"Refresh"+2',}},
        lring="Evoker's Ring",
        rring="Speaker's Ring",
        back="Mecisto. Mantle",
        waist="Fucho-no-Obi",
        legs="Assid. Pants +1",
        feet={ name="Merlinic Crackows", augments={'"Waltz" potency +6%','DEX+2','"Refresh"+2','Accuracy+6 Attack+6','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
    }
      
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 
        main="Bolelabunga",
        sub="Genbu's Shield",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Twilight Torque",
        lear="Moonshade Earring",
        rear="Andoaa Earring",
        body="Shomonjijoe +1",
        hands="Asteria Mitts +1",
        lring="Evoker's Ring",
        rring="Defending Ring",
        back="Umbra Cape",
        waist="Fucho-no-Obi",
        legs="Assid. Pants +1",
        feet="Apogee Pumps"
    }
      
    -----------------------
    -- Perpetuation Related
    -----------------------
      
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
    sets.avatar.perp = {
        main="Gridarvor",
        sub="Oneiros Grip",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Moonshade Earring",
        rear="Evans Earring",
        body="Shomonjijoe +1",
        hands="Merlinic Dastanas",
        lring="Varar Ring",
        rring="Thurandaut Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Incarnation Sash",
        legs="Assid. Pants +1",
        feet="Apogee Pumps"
    }
  
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
    sets.avatar["Carbuncle"] = {hands="Asteria Mitts +1"}
    sets.avatar["Cait Sith"] = {hands="Lamassu Mitts +1"}
    -- When we want our avatar to stay alive
    sets.avatar.tank = set_combine(sets.avatar.perp,{
        main="Gridarvor",
        sub="Oneiros Grip",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Moonshade Earring",
        rear="Andoaa Earring",
        body="Shomonjijoe +1",
        hands="Glyphic Bracers",
        lring="Evoker's Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Lucidity Sash",
        legs="Assid. Pants +1",
        feet="Apogee Pumps"
    })
      
    -- When we want our avatar to shred
    sets.avatar.melee = set_combine(sets.avatar.perp,{
        main="Gridarvor",
        sub="Oneiros Grip",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Moonshade Earring",
        rear="Andoaa Earring",
        body="Shomonjijoe +1",
        hands="Glyphic Bracers",
        lring="Evoker's Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Lucidity Sash",
        legs="Assid. Pants +1",
        feet="Apogee Pumps"
    })
      
    -- When we want our avatar to hit
    sets.avatar.acc = set_combine(sets.avatar.perp,{
        main="Gridarvor",
        sub="Oneiros Grip",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Moonshade Earring",
        rear="Andoaa Earring",
        body="Shomonjijoe +1",
        hands="Glyphic Bracers",
        lring="Evoker's Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Lucidity Sash",
        legs="Assid. Pants +1",
        feet="Apogee Pumps"
    })
      
    -- When Avatar's Favori s active
    sets.avatar.favor = set_combine(sets.avatar.perp,{
        main="Gridarvor",
        sub="Oneiros Grip",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Moonshade Earring",
        rear="Andoaa Earring",
        body="Shomonjijoe +1",
        hands="Glyphic Bracers",
        lring="Evoker's Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Lucidity Sash",
        legs="Assid. Pants +1",
        feet="Apogee Pumps"
    })
      
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
      
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = {
        main="Espiritus",
        sub="Vox Grip",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Melic Torque",
        lear="Moonshade Earring",
        rear="Andoaa Earring",
        body="Beckoner's Doublet",
        hands="Lamassu Mitts +1",
        lring="Evoker's Ring",
        rring="Varar Ring",
        back="Conveyance Cape",
        waist="Incarnation Sash",
        legs="Beckoner's Spats",
        feet="Apogee Pumps"
    }
      
    -------------------------
    -- Individual Blood Pacts
    -------------------------
      
    -- Physical damage
    sets.avatar.atk = set_combine(sets.avatar.skill,{
        main="Gridarvor",
        sub="Elan Strap",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Helios Band",
        neck="Empath Necklace",
        lear="Gelos Earring",
        rear="Esper Earring",
        body="Con. Doublet +2",
        hands={ name="Merlinic Dastanas", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Blood Pact Dmg.+6','Pet: DEX+8',}},
        lring="Varar Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Incarnation Sash",
		legs="Apogee Slacks",
        feet="Helios Boots"
    })
    sets.avatar.pacc = set_combine(sets.avatar.atk,{
        main="Gridarvor",
        sub="Elan Strap",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Helios Band",
        neck="Empath Necklace",
        lear="Gelos Earring",
        rear="Esper Earring",
        body="Con. Doublet +2",
        hands={ name="Merlinic Dastanas", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Blood Pact Dmg.+6','Pet: DEX+8',}},
        lring="Varar Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Incarnation Sash",
		legs={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}},
        feet="Helios Boots"
    })
      
    -- Magic Attack
    sets.avatar.mab = set_combine(sets.avatar.skill,{
        main="Espiritus",
        sub="Elan Strap",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Apogee Crown",
        neck="Caller's Pendant",
        lear="Gelos Earring",
        rear="Esper Earring",
        body="Con. Doublet +2",
        hands={ name="Merlinic Dastanas", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Blood Pact Dmg.+6','Pet: DEX+8',}},
        lring="Varar Ring",
        rring="Speaker's Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','"Fast Cast"+10',}},
        waist="Incarnation Sash",
        legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
        feet="Apogee Pumps"
    })
    sets.avatar.mb = set_combine(sets.avatar.mab,{hands="Glyphic Bracers"})
    -- Hybrid
    sets.avatar.hybrid = set_combine(sets.avatar.skill,{
        main="Keraunos",
        sub="Elan Strap",
        ranged="",
        ammo="Sancus Sachet +1",
        head="Apogee Crown",
        neck="Empath Necklace",
        lear="Gelos Earring",
        rear="Esper Earring",
        body="Con. Doublet +2",
        hands={ name="Merlinic Dastanas", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Blood Pact Dmg.+6','Pet: DEX+8',}},
        lring="Varar Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10',}},
        waist="Incarnation Sash",
		legs={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}},
        feet="Helios Boots"
    })
      
    -- Magic Accuracy
    sets.avatar.macc = set_combine(sets.avatar.skill,{
        main="Keraunos",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        lear="Gelos Earring",
        hands="Apogee Mitts",
        lring="Evoker's Ring",
        rring="Varar Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','"Fast Cast"+10',}},
        waist="Incarnation Sash",
    })
      
    -- Buffs
    sets.avatar.buff = set_combine(sets.avatar.skill,{

    })
      
    -- Other
    sets.avatar.other = set_combine(sets.avatar.skill,{

    })
      
    -- Combat Related Sets
      
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = set_combine(sets.avatar.perp,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
      
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
    sets.me["Garland of Bliss"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though
  
    ---------------
    -- Casting Sets
    ---------------
      
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
      
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {
        head="Nahtirah Hat",
        lear="Loquac. Earring",
        body="Anhur Robe",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','"Fast Cast"+10',}},
        waist="Witful Belt",
        legs="Psycloth Lappas",
		ring1="Kishar Ring"
    }   
      
    -- Summoning Magic Cast time - gear
    sets.precast.summoning = set_combine(sets.precast.casting,{

    })
      
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{

        waist="Siegel Sash",

    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{

    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
        main="Serenity",
        back="Pahtli Cape",

    })
      
    ---------------------
    -- Ability Precasting
    ---------------------
      
    -- Blood Pact Ability Delay
    sets.precast.bp =  set_combine(sets.avatar.skill,{

		main="Espiritus",
        head="Smn. Horn +2",
        rear="Evans Earring",
		body="Con. Doublet +2",
        hands="Smn. Bracers +2",
        back="Conveyance Cape",
		legs="Summoner's Spats",
		feet="Summoner's Pigaches"
    })
      
    -- Mana Cede
    sets.precast["Mana Cede"] =  set_combine(sets.avatar.skill,{
        hands="Call. Bracers +2",
    })
      
    -- Astral Flow  
    sets.precast["Astral Flow"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    ----------
    -- Midcast
    ----------
      
    -- We handle the damage and etc. in Pet Midcast later
      
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
      
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.midcast.siphon = set_combine(sets.avatar.skill,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="Conveyance Cape",
        waist="",
        legs="",
        feet="Caller's Pgch. +2"
    })
        
    -- Cure Potency
    sets.midcast.cure = set_combine(sets.midcast.casting,{
        main="Serenity",
        sub="",
        ranged="",
        ammo="",
        head="Vanya Hood",
        neck="Henic Torque",
        lear="",
        rear="",
        body="",
        hands="Bokwus Gloves",
        lring="Ephedra Ring",
        rring="Ephedra Ring",
        back="Tempered Cape +1",
        waist="",
        legs="",
        feet="Vanya Clogs"
    })
      
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
  
end
