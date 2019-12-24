-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
    state.HybridMode:options('Pet','DT','Normal')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.PhysicalDefenseMode:options('PDT')
	state.IdleMode:options('Normal','PDT','Refresh')
	state.Weapons:options('None','Godhands','PetWeapons')

    -- Default/Automatic maneuvers for each pet mode.  Define at least 3.
	defaultManeuvers = {
		Melee = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
		},
		--[[ (MELEE)
		Melee = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
		},
		]]--
		Ranged = {
			{Name='Wind Maneuver', 	  Amount=3},
			{Name='Fire Maneuver',	  Amount=0},
			{Name='Light Maneuver',	  Amount=0},
			{Name='Thunder Maneuver', Amount=0},
		},
		--[[ (RANGER)
		Ranged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=2},
			{Name='Light Maneuver',	  Amount=0},
			{Name='Thunder Maneuver', Amount=0},
		},
		]]--
		HybridRanged = {
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Thunder Maneuver', Amount=0},
		},
		Tank = {
			{Name='Fire Maneuver', 	  Amount=1},
			{Name='Water Maneuver',   Amount=0},
			{Name='Wind Maneuver', 	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
		},
		--[[ (TURTLE)
		VS MAGIC
		Tank = {
			{Name='Water Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		}
		FOR DISPEL
		Tank = {
			{Name='Water Maneuver',	  Amount=0},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=1},
		}
		]]--
		--[[ (BRUISER)
		FOR DISPEL
		Tank = {
			{Name='Wind Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		}
		]]--
		--[[ (HARLE)
		Tank = {
			{Name='Water Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		}
		]]--
		LightTank = {
			{Name='Earth Maneuver',	  Amount=1},
			{Name='Fire Maneuver',	  Amount=1},
			{Name='Light Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=0},
		},
		Magic = {
			{Name='Light Maneuver',	  Amount=1},
			{Name='Ice Maneuver',	  Amount=1},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Heal = {
			{Name='Light Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
		Nuke = {
			{Name='Ice Maneuver',	  Amount=2},
			{Name='Dark Maneuver',	  Amount=1},
			{Name='Water Maneuver',	  Amount=0},
			{Name='Earth Maneuver',	  Amount=0},
		},
	}

	deactivatehpp = 85
	
    select_default_macro_book()
	
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f8 gs c toggle AutoPuppetMode')
	send_command('bind @f7 gs c toggle AutoRepairMode')
end

-- Define sets used by this job file.
function init_gear_sets()
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {
		feet="Karagoz Scarpe"
	}
    sets.precast.JA['Repair'] = {
		--main="Nibiru Santi",
		ammo="Automat. Oil +3",
		left_ear="Guignol Earring",
		right_ear="Pratik Earring",
		head={ name="Herculean Helm", augments={'Pet: Mag. Acc.+15','"Repair" potency +7%',}},
		hands={ name="Herculean Gloves", augments={'"Repair" potency +7%','Pet: CHR+9','Pet: "Mag.Atk.Bns."+6',}},
		legs={ name="Desultor Tassets", augments={'"Repair" potency +10%','"Elemental Siphon"+20',}},
		feet="Foire Bab. +1"
	} 
	sets.precast.JA['Maintenance'] = {
		ammo="Automat. Oil +3"
	}

    sets.precast.JA.Maneuver = {
		--main="Midnights",
		back="Visucius's Mantle",
		--neck="Buffoon's Collar +1",
		hands="Foire Dastanas +1",
		body="Karagoz Farsetto"
	} 

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
	}
        
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		body="Pitre Tobe +1",
		neck="Rancor Collar",
		legs="Hizamaru Hizayoroi +2",
		ear1="Brutal Earring",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		waist="Windbuffet Belt +1"
	}
	sets.precast.WS.Acc = {
	}
	sets.precast.WS.FullAcc = {
	}
	sets.precast.WS.Fodder = {
	}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
	})
    sets.precast.WS['Victory Smite'].Acc = set_combine(sets.precast.WS.Acc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Victory Smite'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Victory Smite'].Fodder = set_combine(sets.precast.WS.Fodder, {body="Abnoba Kaftan"})
	
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {
	})
    sets.precast.WS['Stringing Pummel'].Acc = set_combine(sets.precast.WS.FullAcc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Stringing Pummel'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Sayadio's Kaftan"})
	sets.precast.WS['Stringing Pummel'].Fodder = set_combine(sets.precast.WS.Fodder, {body="Abnoba Kaftan"})

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Shijin Spiral'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Shijin Spiral'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {
	})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dragon Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Dragon Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Dragon Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tornado Kick'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Tornado Kick'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Tornado Kick'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Asuran Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Asuran Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Raging Fists'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Raging Fists'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Raging Fists'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Howling Fist'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Howling Fist'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Howling Fist'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Backhand Blow'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Backhand Blow'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Backhand Blow'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Spinning Attack'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Spinning Attack'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Spinning Attack'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Shoulder Tackle'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Shoulder Tackle'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Shoulder Tackle'].Fodder = set_combine(sets.precast.WS.Fodder, {})
    -- Midcast Sets

    sets.midcast.FastRecast = {
	}
        
	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
		
    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {}
	sets.midcast.Pet['Enfeebling Magic'] = {}
    sets.midcast.Pet['Elemental Magic'] = {}
	sets.midcast.Pet.PetWSGear = {
		neck="Shulmanu Collar",
		ear1="Enmerkar Earring",
		ear2="Handler's Earring +1",
		body={name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands="Regimen Mittens",
		ring1="Varar Ring +1",
		ring2="Varar Ring +1",
		back="Dispersal Mantle",
		waist="Incarnation Sash",
		legs="Tali'ah Sera. +2"
	}
    sets.midcast.Pet.PetWSGear.Ranged = set_combine(sets.midcast.Pet.PetWSGear, {
		head="Karagoz Capello +1",
		hands="Karagoz Guanti +1",
		legs="Karagoz Pantaloni +1",
		feet="Naga Kyahan",
		ring2="Overbearing Ring",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Domes. Earring"
	})
	sets.midcast.Pet.PetWSGear.HybridRanged = set_combine(sets.midcast.Pet.PetWSGear, {
		head=gear.herculean_pet_melee_ws_head,
		hands=gear.herculean_pet_melee_ws_hand,
		legs=gear.herculean_pet_melee_ws_legs,
		feet=gear.herculean_pet_melee_ws_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Domes. Earring"
	})
	sets.midcast.Pet.PetWSGear.Melee = set_combine(sets.midcast.Pet.PetWSGear, {
		head=gear.herculean_pet_melee_ws_head,
		hands=gear.herculean_pet_melee_ws_hand,
		legs=gear.herculean_pet_melee_ws_legs,
		feet=gear.herculean_pet_melee_ws_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Domes. Earring"
	})
	sets.midcast.Pet.PetWSGear.Tank = set_combine(sets.midcast.Pet.PetWSGear.Melee, {
		head=gear.herculean_pet_melee_ws_head,
		hands=gear.herculean_pet_melee_ws_hand,
		legs=gear.herculean_pet_melee_ws_legs,
		feet=gear.herculean_pet_melee_ws_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Domes. Earring"
	})
	sets.midcast.Pet.PetWSGear.LightTank = set_combine(sets.midcast.Pet.PetWSGear.Melee, {
		head=gear.herculean_pet_melee_ws_head,
		hands=gear.herculean_pet_melee_ws_hand,
		legs=gear.herculean_pet_melee_ws_legs,
		feet=gear.herculean_pet_melee_ws_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Domes. Earring"
	})
    sets.midcast.Pet.PetWSGear.Magic = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Heal = set_combine(sets.midcast.Pet.PetWSGear, {})
	sets.midcast.Pet.PetWSGear.Nuke = set_combine(sets.midcast.Pet.PetWSGear, {})
    
	-- Currently broken, preserved in case of future functionality.
	sets.midcast.Pet.WeaponSkill = {}
	

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets

    sets.idle = {
	}
		
	sets.idle.Refresh = {
    }
		
    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = {
        
	}

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
		neck="Shulmanu Collar",
		--main="Karambit",
		main="Ohtas",
		range="Divinator",
		head=gear.herculean_pet_stp_head,
		body={name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands=gear.herculean_pet_stp_hands,
		legs=gear.herculean_pet_stp_legs,
		feet=gear.herculean_pet_stp_feet,
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},
	}

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {
		neck="Shulmanu Collar",
		--main="Karambit",
		main="Ohtas",
		range="Divinator",
		head=gear.herculean_pet_stp_head,
		body={name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands=gear.herculean_pet_stp_hands,
		legs=gear.herculean_pet_stp_legs,
		feet=gear.herculean_pet_stp_feet,
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},
	})
	sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {
		--main="Karambit",
		main="Ohtas",
		waist="Isa Belt",
		head="Anwig Salade",
		neck="Shepherd's Chain",
		body=gear.taeon_pet_tank_body,
		hands=gear.taeon_pet_tank_hands,
		legs=gear.taeon_pet_tank_legs,
		feet=gear.taeon_pet_tank_feet,
		--legs="Heyoka Subligar",
		--hands="Heyoka Mittens",
		--feet="Heyoka Leggings",
		--head="Heyoka Cap",
		--body="Heyoka Harness",
		ring1="Overbearing Ring",
		ear1="Rimeice Earring",
		ear2="Handler's Earring +1",
		back={name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}}
		--neck="Shulmanu Collar",
		--main="Karambit",
		--main="Ohtas",
		--range="Divinator",
		--head=gear.herculean_pet_stp_head,
		--body={ name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		--hands=gear.herculean_pet_stp_hands,
		--legs=gear.herculean_pet_stp_legs,
		--feet=gear.herculean_pet_stp_feet,
		--waist="Incarnation Sash",
		--left_ear="Rimeice Earring",
		--right_ear="Domes. Earring",
		--left_ring="Varar Ring",
		--right_ring="Varar Ring",
		--back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},
	})
	sets.idle.Pet.Engaged.HybridRanged = set_combine(sets.idle.Pet.Engaged, {
		neck="Shulmanu Collar",
		--main="Karambit",
		main="Ohtas",
		range="Divinator",
		head=gear.herculean_pet_stp_head,
		body={ name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands=gear.herculean_pet_stp_hands,
		legs=gear.herculean_pet_stp_legs,
		feet=gear.herculean_pet_stp_feet,
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},
	})
	sets.idle.Pet.Engaged.Tank = set_combine(sets.idle.Pet.Engaged, {
		--main="Karambit",
		main="Ohtas",
		waist="Isa Belt",
		head="Anwig Salade",
		neck="Shepherd's Chain",
		body=gear.taeon_pet_tank_body,
		hands=gear.taeon_pet_tank_hands,
		legs=gear.taeon_pet_tank_legs,
		feet=gear.taeon_pet_tank_feet,
		--legs="Heyoka Subligar",
		--hands="Heyoka Mittens",
		--feet="Heyoka Leggings",
		--head="Heyoka Cap",
		--body="Heyoka Harness",
		ring1="Overbearing Ring",
		ear1="Rimeice Earring",
		ear2="Handler's Earring +1",
		back={name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}}
	})
	sets.idle.Pet.Engaged.LightTank = set_combine(sets.idle.Pet.Engaged, {
		--main="Karambit",
		main="Ohtas",
		waist="Isa Belt",
		head="Anwig Salade",
		neck="Shepherd's Chain",
		body=gear.taeon_pet_tank_body,
		hands=gear.taeon_pet_tank_hands,
		legs=gear.taeon_pet_tank_legs,
		feet=gear.taeon_pet_tank_feet,
		ring1="Overbearing Ring",
		ear1="Rimeice Earring",
		ear2="Handler's Earring +1",
		back={name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}}
	})
    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})
	sets.idle.Pet.Engaged.Heal = sets.idle.Pet.Engaged.Magic
	sets.idle.Pet.Engaged.Nuke = sets.idle.Pet.Engaged.Magic


    -- Defense sets

    sets.defense.PDT = {
	}

    sets.defense.MDT = {
    }
		
    sets.defense.MEVA = {
    }

    sets.Kiting = {feet="Hermes' Sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		--main="Karambit",
		main="Ohtas",
		head=gear.herculean_pet_stp_head,
		body={name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands=gear.herculean_pet_stp_hands,
		legs=gear.herculean_pet_stp_legs,
		feet=gear.herculean_pet_stp_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},	
	}
    sets.engaged.Acc = {
        --main="Karambit",
		main="Ohtas",
		head=gear.herculean_pet_stp_head,
		body={name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands=gear.herculean_pet_stp_hands,
		legs=gear.herculean_pet_stp_legs,
		feet=gear.herculean_pet_stp_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},			
	}
    sets.engaged.FullAcc = {
		--main="Karambit",
		main="Ohtas",
		head=gear.herculean_pet_stp_head,
		body={name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands=gear.herculean_pet_stp_hands,
		legs=gear.herculean_pet_stp_legs,
		feet=gear.herculean_pet_stp_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},	
	}
	sets.engaged.Fodder = {
		--main="Karambit",
		main="Ohtas",
		head=gear.herculean_pet_stp_head,
		body={name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
		hands=gear.herculean_pet_stp_hands,
		legs=gear.herculean_pet_stp_legs,
		feet=gear.herculean_pet_stp_feet,
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Rimeice Earring",
		right_ear="Domes. Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10','System: 1 ID: 1247 Val: 4',}},	
    }
    sets.engaged.DT = {
    }
    sets.engaged.Acc.DT = {
    }
    sets.engaged.FullAcc.DT = {
    }
    sets.engaged.Fodder.DT = {
    }
    sets.engaged.Pet = {
    }
    sets.engaged.Acc.Pet = {
    }
    sets.engaged.FullAcc.Pet = {
    }
    sets.engaged.Fodder.Pet = {
    }
		
	-- Weapons sets
	sets.weapons.PetWeapons = {main="Ohtas",range="Animator P +1",}
	sets.weapons.Godhands = {main="Godhands",range="Animator P +1",}
	
	-- NEW!!! (Croex)
	--Equipped automatically
    sets.engaged.Enmity = {
		ear1="Rimeice Earring",
		ear2="Domesticator's Earring",
		legs="Heyoka Subligar",
		hands="Heyoka Mittens",
		hands="Heyoka Mittens",
		head="Heyoka Cap",
		body="Heyoka Harness"
    }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 12)
    else
        set_macro_page(1, 12)
    end
end