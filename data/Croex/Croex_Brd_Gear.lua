function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('Aeneas','None','DualWeapons','Swords','NukeWeapons')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
	set_lockstyle_custom(4)
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = {main="Carnwenhan",sub="Ternion Dagger +1"}
	sets.weapons.DualWeapons = {main="Carnwenhan",sub="Ternion Dagger +1"}
	sets.weapons.Swords = {main="Naegling",sub="Ternion Dagger +1"}
	sets.weapons.NukeWeapons = {
		--main = "Malevolence",
		--sub = "Malevolence"
	}
	
	-- Precast Sets

	sets.precast.FC.Trust =  {
		body="Yoran Unity shirt"
	}
	
	-- Fast cast sets for spells
	
	sets.precast.FC = {
		--main = gear.grioavolr_fc_staff,
		--sub = "Clerisy Strap +1",
		--ammo = "Impatiens",
		head = "Nahtirah Hat",
		--neck = "Voltsurge Torque",
		ear1 = "Enchntr. Earring +1",
		ear2 = "Loquacious Earring",
		body = "Inyanga Jubbah +2",
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
		ring2 = "Lebeche Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
		waist = "Witful Belt",
		legs = "Aya. Cosciales +2",
		--feet = "Gende. Galosh. +1"
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
			--waist = "Siegel Sash"
	})
	
	sets.precast.FC.BardSong = {
		head="Fili Calot +1",
		body="Inyanga Jubbah +2",
		hands="Gendewitha Gages +1",
		legs="Aya. Cosciales +2",
		neck="Loricate Torque +1",
		ear1="Ethereal Earring",
		ear2="Loquacious Earring",
		ring1="Kishar Ring",
		ring2="Defending Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
		waist="Witful Belt",
		feet="Telchine Pigaches"
	}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		waist="Luminary Sash",
		neck="Moonbow Whistle +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		ear2="Digni. Earring",
		ear1="Regal Earring"
	})
	
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		waist="Luminary Sash",
		neck="Moonbow Whistle +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		ear2="Digni. Earring",
		ear1="Regal Earring"
	})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		waist="Luminary Sash",
		neck="Moonbow Whistle +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		ear2="Digni. Earring",
		ear1="Regal Earring"
	})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		waist="Luminary Sash",
		neck="Moonbow Whistle +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		ear2="Digni. Earring",
		ear1="Regal Earring"
	})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		waist="Luminary Sash",
		neck="Moonbow Whistle +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		ear2="Digni. Earring",
		ear1="Regal Earring"
	})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {
			range = "Marsyas",
			sub = "Kali"
		})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}
		
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {
		range=gear.linos_wsd,
		head="Lustratio Cap +1",
		hands="Lustratio Mittens +1",
		legs="Lustratio Subligar +1",
		feet="Lustratio Leggings +1",
		body="Bihu Justaucorps +3",
		neck="Bard's Charm +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ring1="Karieyh Ring +1",
		ring2="Ilabrat Ring",
		back={name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Prosilio Belt +1"
	})
	
	sets.precast.WS["Mordant Rime"] = set_combine(sets.precast.WS, {
		range=gear.linos_wsd,
		head="Bihu Roundlet +3",
		hands="Bihu Cuffs +3",
		legs="Bihu Cannions +3",
		feet="Bihu Slippers +3",
		body="Bihu Justaucorps +3",
		neck="Bard's Charm +2",
		ear1="Regal Earring",
		ear2="Ishvara Earring",
		ring1="Karieyh Ring +1",
		ring2="Metamorph Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%',}},
		waist="Grunfeld Rope"
	})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {
		--ear1 = "Zennaroi Earring",
		--ear2 = "Telos Earring"
	}
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {
		--main = gear.grioavolr_fc_staff,
		--sub = "Clerisy Strap +1",
		--ammo = "Hasty Pinion +1",
		head = "Nahtirah Hat",
		--neck = "Voltsurge Torque",
		ear1 = "Enchntr. Earring +1",
		ear2 = "Loquacious Earring",
		body = "Inyanga Jubbah +2",
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
		ring2 = "Lebeche Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
		waist = "Witful Belt",
		legs = "Aya. Cosciales +2",
		--feet = "Gende. Galosh. +1"
	}
	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Lullaby = {}
	sets.midcast['Horde Lullaby'] = {
		range="Marsyas",
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		waist="Luminary Sash",
		neck="Moonbow Whistle +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		ear2="Digni. Earring",
		ear1="Regal Earring"
	}
	sets.midcast['Horde Lullaby'].Resistant = set_combine(sets.midcast['Horde Lullaby'], {range="Gjallarhorn"})
	sets.midcast['Horde Lullaby'].AoE = set_combine(sets.midcast['Horde Lullaby'], {range=info.ExtraSongInstrument})
	sets.midcast['Horde Lullaby II'] = set_combine(sets.midcast['Horde Lullaby'], {})
	sets.midcast['Horde Lullaby II'].Resistant = set_combine(sets.midcast['Horde Lullaby'], {range="Gjallarhorn"})
	sets.midcast['Horde Lullaby II'].AoE = {range=info.ExtraSongInstrument}
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Madrigal = {head="Fili Calot +1", ear1="Kuwunga Earring"}
	sets.midcast.Paeon = {head="Brioso Roundlet +3"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {
		legs = "Mousai Seraweels"
	}
	sets.midcast.Carol = {
		hands = "Mousai Gages"
	}
	sets.midcast.Etude = {
		head = "Mousai Turban"
	}
	sets.midcast.Threnody = {
		body = "Mousai Manteel"
	}
	sets.midcast.Mambo = {
		feet = "Mousai Crackows"
	}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast["Adventurer's Dirge"] = {hands="Bihu Cuffs +3"}
	sets.midcast["Foe Sirvente"] = {head="Bihu Roundlet +3"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range=info.ExtraSongInstrument}
	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
		range="Gjallarhorn",
		head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		waist="Flume Belt +1",
		neck="Moonbow Whistle +1",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
		ring1="Defending Ring",
		ring2="Dark Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
		range="Gjallarhorn", --more duration with "Marsyas"
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +3",
		feet="Brioso Slippers +3",
		neck="Moonbow Whistle +1",
		ear2="Digni. Earring",
		ear1="Regal Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		waist="Luminary Sash",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {
		range = "Gjallarhorn",
		ammo = empty,
		head = "Aya. Zucchetto +2",
		neck = "Moonbow Whistle +1",
		ear1 = "Gwati Earring",
		ear2 = "Digni. Earring",
		body = "Inyanga Jubbah +2",
		hands = "Inyan. Dastanas +2",
		ring1 = "Stikini Ring",
		ring2 = "Stikini Ring",
		back = "Intarabus's Cape",
		waist = "Luminary Sash",
		legs = "Inyanga Shalwar +2",
		feet = "Aya. Gambieras +2"
	}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		--main = gear.grioavolr_fc_staff,
		--sub = "Clerisy Strap +1",
		range = info.ExtraSongInstrument,
		ammo = empty,
		head = "Nahtirah Hat",
		--neck = "Voltsurge Torque",
		ear1 = "Enchntr. Earring +1",
		ear2 = "Loquacious Earring",
		body = "Inyanga Jubbah +2",
		hands = "Gendewitha Gages +1",
		ring1 = "Kishar Ring",
		--ring2 = "Prolix Ring",
		back = "Intarabus's Cape",
		waist = "Witful Belt",
		legs = "Fili Rhingrave +1",
		feet = "Aya. Gambieras +2"
	}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck="Incanter's Torque",
		ear1="Beatific Earring",
		ear2="Mendi. Earring",
        body="Kaykaus Bliaut",
		hands="Inyanga Dastanas +2",
		--ring1="Janniston Ring",
		ring2="Sirona's Ring",
        back="Tempered Cape +1",
		waist="Bishop's Sash",
		legs="Kaykaus Tights",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	}
		
	sets.Self_Healing = {
		--neck = "Phalaina Locket",
		--hands = "Buremte Gloves",
		--ring2 = "Kunaji Ring",
		waist = "Gishdubar Sash"
	}
	sets.Cure_Received = {
		--neck = "Phalaina Locket",
		--hands = "Buremte Gloves",
		--ring2 = "Kunaji Ring",
		waist = "Gishdubar Sash"
	}
	sets.Self_Refresh = {
		back = "Grapevine Cape",
		waist = "Gishdubar Sash"
	}
		
	sets.midcast['Enhancing Magic'] = {
		--ammo = "Hasty Pinion +1",
		--head = "Telchine Cap",
		--neck = "Voltsurge Torque",
		ear1 = "Andoaa Earring",
		--ear2 = "Gifted Earring",
		--body = "Telchine Chas.",
		--hands = "Telchine Gloves",
		ring1 = "Stikini Ring",
		ring2 = "Stikini Ring",
		back = "Intarabus's Cape",
		waist = "Witful Belt",
		--legs = "Telchine Braconi",
		feet = "Telchine Pigaches"
	}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
			--neck = "Nodens Gorget",
			--ear2 = "Earthcry Earring",
			--waist = "Siegel Sash",
			--legs = "Shedir Seraweels"
		})

	sets.midcast['Elemental Magic'] = {
		--ammo = "Dosis Tathlum",
		--head = "Buremte Hat",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi Earring",
		--ear2 = "Crematio Earring",
		--body = "Chironic Doublet",
		--hands = "Volte Gloves",
		--ring1 = "Shiva Ring +1",
		--ring2 = "Shiva Ring +1",
		--back = "Toro Cape",
		--waist = "Sekhmet Corset",
		legs = "Gyve Trousers",
		--feet = gear.chironic_nuke_feet
	}

	sets.midcast['Elemental Magic'].Resistant = {
		--ammo = "Dosis Tathlum",
		--head = "Buremte Hat",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi Earring",
		--ear2 = "Crematio Earring",
		--body = "Chironic Doublet",
		--hands = "Volte Gloves",
		--ring1 = "Shiva Ring +1",
		--ring2 = "Shiva Ring +1",
		--back = "Toro Cape",
		waist = "Yamabuki-no-Obi",
		legs = "Gyve Trousers",
		--feet = gear.chironic_nuke_feet
	}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
			--neck = "Debilis Medallion",
			--hands = "Hieros Mittens",
			--ring1 = "Haoma's Ring",
			--ring2 = "Haoma's Ring",
			waist = "Witful Belt",
			feet = "Vanya Clogs"
	})

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
			--main = gear.grioavolr_fc_staff,
			--sub = "Clemency Grip"
	})

	-- Resting sets
	sets.resting = {
		ammo = "Staunch Tathlum",
		head = "Fili Calot +1",
		neck = "Loricate Torque +1",
		--ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Fili Hongreline +1",
		hands = gear.chironic_refresh_hands,
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Umbra Cape",
		waist = "Flume Belt +1",
		legs = "Assid. Pants +1",
		--feet = gear.chironic_refresh_feet
	}
	
	sets.idle = {
		ammo = "Staunch Tathlum",
		head = "Fili Calot +1",
		neck = "Loricate Torque +1",
		--ear1 = "Etiolation Earring",
		--ear2 = "E eal Earring",
		body = "Fili Hongreline +1",
		hands = gear.chironic_refresh_hands,
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Umbra Cape",
		waist = "Flume Belt +1",
		legs = "Assid. Pants +1",
		--feet = gear.chironic_refresh_feet
	}

	sets.idle.PDT = {
		ammo = "Staunch Tathlum",
		head = "Fili Calot +1",
		neck = "Loricate Torque +1",
		--ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Fili Hongreline +1",
		hands = gear.chironic_refresh_hands,
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Umbra Cape",
		waist = "Flume Belt +1",
		legs = "Assid. Pants +1",
		--feet = gear.chironic_refresh_feet
	}
	
	-- Defense sets

	sets.defense.PDT = {
		--main = "Terra's Staff",
		--sub = "Umbra Strap",
		ammo = "Staunch Tathlum",
		head = "Fili Calot +1",
		neck = "Loricate Torque +1",
		--ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Fili Hongreline +1",
		hands = gear.chironic_refresh_hands,
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Umbra Cape",
		waist = "Flume Belt +1",
		legs = "Assid. Pants +1",
		feet = gear.chironic_refresh_feet
	}

	sets.defense.MDT = {
		--main = "Terra's Staff",
		--sub = "Umbra Strap",
		ammo = "Staunch Tathlum",
		head = "Fili Calot +1",
		neck = "Loricate Torque +1",
		--ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Fili Hongreline +1",
		hands = gear.chironic_refresh_hands,
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Umbra Cape",
		waist = "Flume Belt +1",
		legs = "Assid. Pants +1",
		feet = gear.chironic_refresh_feet
	}

	sets.Kiting = {
		feet = "Fili Cothurnes +1"
	}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {
		--main = "Marin Staff +1"
	}
	sets.IceNuke = {
		--main = "Ngqoqwanb"
	}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
		--ammo = "Ginsen",
		range=gear.linos_tp,
		head = "Blistering Sallet +1",
		body = "Ayanmo Corazza +2",
		hands = "Ayanmo Manopolas +2",
		legs = "Ayanmo Cosciales +2",
		feet = "Ayanmo Gambieras +2",
		neck = "Bard's Charm +2",
		ear1 = "Brutal Earring",
		ear2 = "Eabani Earring",
		ring1 = "Petrov Ring",
		ring2 = "Hetairoi Ring",
		back = {name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
		waist = "Sailfi Belt +1"
		--waist = "Windbuffet Belt +1"
	}
	sets.engaged.Acc = set_combine(sets.engaged, {})
	sets.engaged.DW = set_combine(sets.engaged, {})
	sets.engaged.DW.Acc = set_combine(sets.engaged, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 11)
end