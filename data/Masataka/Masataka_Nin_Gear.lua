-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder','Crit')
    state.HybridMode:options('Normal','Evasion','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
    state.CastingMode:options('Normal','Proc','Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Heishi','LowBuff','MagicWeapons','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff')
	
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}
	
	gear.wsd_jse_back = {name="Andartia's Mantle", augments={'DEX+30','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.da_jse_back = {name="Andartia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Evasion+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	
	send_command('bind ^` input /ja "Innin" <me>')
    send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !c gs c set WeaponskillMode Proc;gs c set CastingMode Proc;gs c update')
	send_command('bind ^c gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
	send_command('bind !@^` gs c cycle Stance')
	
	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {
		head="Hiza. Somen　+2",
		body="Hachiya Chain. +2",
		hands="Hizamaru Kote +2",
		legs="Hiza. Hizayoroi +2",
		feet="Hiza. Sune-Ate +2",
		neck="Asperity Necklace",
		waist="Kentarch Belt +1",
		left_ear="Assuage Earring",
		right_ear="Brutal Earring",
		left_ring="Adoulin Ring",
		right_ring="Hetairoi Ring",
		back=gear.da_jse_back
	}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {} --legs="Mochizuki Chainmail"
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}

    sets.precast.Flourish1 = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Hattori Hakama +1",feet=gear.herculean_acc_feet}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ear2="Loquacious Earring"}
		
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {feet="Hattori Kyahan +1", back=gear.da_jse_back})
	--sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ammo="Staunch Tathlum",ring1="Prolix Ring"})

    -- Snapshot for ranged
    sets.precast.RA = {legs="Nahtirah Trousers"}
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Expeditious Pinion",
		head="Ken. Jinpachi",
        --head="Lilitu Headpiece",
		body="Mummu Jacket +2",
        --body="Adhemar Jacket +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Mummu Kecks +2",
		--legs="Jokushu Haidate",
		feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Store TP"+3','Accuracy+7',}},
		--feet=gear.herculean_wsd_feet
		neck="Yarak Torque",
		--neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Mache Earring",
		--left_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		--right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
	
	
	
	
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {head="Dampening Tam","Ken. Samue",legs="Hiza. Hizayoroi +2",ear2="Telos Earring"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {head="Ynglinga Sallet",neck="Combatant's Torque",ear2="Telos Earring",body="Ken. Samue",hands="Mummu Wrists +2",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ammo="Yamarang",head="Ynglinga Sallet",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",body="Mummu Jacket +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet})
	sets.precast.WS.Proc = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {ammo="Yetshila",head="Adhemar Bonnet +1",ear1="Moonshade Earring",ear2="Brutal Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring1="Begrudging Ring",back=gear.wsd_jse_back,legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Hi'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila",head="Mummu Bonnet +2",ear1="Moonshade Earring",ear2="Trux Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring1="Begrudging Ring",back=gear.wsd_jse_back,legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS.Acc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",ear2="Telos Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",legs="Hiza. Hizayoroi +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Blade: Hi'].FullAcc = set_combine(sets.precast.WS.FullAcc, {hands="Ryuo Tekko",legs="Hiza. Hizayoroi +2"})
    sets.precast.WS['Blade: Hi'].Fodder = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {ear1="Lugra Earring",ear2="Lugra Earring +1",legs="Jokushu Haidate",feet=gear.herculean_acc_feet})
    sets.precast.WS['Blade: Shun'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear1="Lugra Earring",ear2="Lugra Earring +1",legs="Jokushu Haidate",feet=gear.herculean_acc_feet})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Shun'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Shun'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})
	
	sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, {ear1="Lugra Earring",ear2="Lugra Earring +1",legs="Jokushu Haidate",feet=gear.herculean_acc_feet})
    sets.precast.WS['Blade: Metsu'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ear1="Lugra Earring",ear2="Lugra Earring +1",legs="Jokushu Haidate",feet=gear.herculean_acc_feet})
    sets.precast.WS['Blade: Metsu'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Metsu'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Metsu'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring",ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring",}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Mochizuki Tekko +1",ring1="Defending Ring",ring2="Kishar Ring",
        legs="Rawhide Trousers",feet=gear.herculean_acc_feet}

    sets.midcast.ElementalNinjutsu = {ammo="Pemphredo Tathlum",
        head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Hattori Tekko +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Eschan Stone",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
		
	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast
		
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	
	sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}
	
	sets.element.Earth = {neck="Quanpur Necklace"}

    sets.midcast.NinjutsuDebuff = {ammo="Dosis Tathlum",
        head="Dampening Tam",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Mochizuki Tekko +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Rawhide Trousers",feet="Mochi. Kyahan +1"}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    sets.midcast.RA = {
        head="Dampening Tam",neck="Combatant's Torque",ear1="Clearview Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Nahtirah Trousers",feet="Mummu Gamash. +2"}
		
    sets.midcast.RA.Acc = {
        head="Dampening Tam",neck="Combatant's Torque",ear1="Clearview Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Chaac Belt",legs="Nahtirah Trousers",feet="Mummu Gamash. +2"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {}

    sets.idle.PDT = {}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})
		
    sets.idle.Weak = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}
    
    -- Defense sets
    sets.defense.Evasion = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Apate Ring",
        back="Andartia's Mantle",waist="Shetal Stone",legs="Nahtirah Trousers",feet=gear.herculean_dt_feet}

    sets.defense.PDT = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}

    sets.defense.MDT = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape +1",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Ahosi Leggings"}
		
	sets.defense.MEVA = {ammo="Yamarang",
		head="Dampening Tam",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Mekosu. Harness",hands="Leyline Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
		back="Toro Cape",waist="Engraved Belt",legs="Samnuha Tights",feet="Ahosi Leggings"}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		ammo="Happo Shuriken",
		head="Ryuo Somen +1",
		body="Hachiya Chain. +2",
        --body="Ken. Samue",
		hands="Adhemar Wrist. +1",
		legs="Hiza. Hizayoroi +2",
		--legs="Samnuha Tights",
		feet="Herculean Boots",
		neck="Yarak Torque",
		--neck="Moonbeam Nodowa",
		waist="Kentarch Belt +1",
		--waist="Windbuffet Belt +1",
		left_ear="Assuage Earring",
		--left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Hetairoi Ring",
		--left_ring="Epona's Ring",
		right_ring="Petrov Ring",
		back=gear.da_jse_back
	}
	
	
    sets.engaged.SomeAcc = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands="Buremte Gloves",ring1="Apate Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Shetal Stone",legs="Samnuha Tights",feet=gear.herculean_acc_feet}
	
	-- SET JP
	sets.engaged.Acc = set_combine(sets.engaged, 
		{
			head="Mummu Bonnet +2",
			body="Mummu Jacket +2",
			hands="Mummu Wrists +2",
			legs="Mummu Kecks +2",
			feet="Mummu Gamashes +2",
			neck="Yarak Torque",
			--neck="Moonbeam Nodowa",
			waist="Kentarch Belt +1",
			--waist="Windbuffet Belt +1",
			left_ear="Assuage Earring",
			--left_ear="Cessance Earring",
			right_ear="Brutal Earring",
			left_ring="Hetairoi Ring",
			--left_ring="Epona's Ring",
			right_ring="Petrov Ring",
			back=gear.da_jse_back
			}
		)
	
	-- SET NM
    sets.engaged.FullAcc = {
		head="Hiza. Somen　+2",
		body="Hiza. Haramaki +2",
		hands="Hizamaru Kote +2",
		legs="Hiza. Hizayoroi +2",
		feet="Hiza. Sune-Ate +2",
		neck="Yarak Torque",
		waist="Kentarch Belt +1",
		left_ear="Assuage Earring",
		right_ear="Brutal Earring",
		left_ring="Hetairoi Ring",
		right_ring="Adoulin Ring",
		back=gear.da_jse_back
	}
    sets.engaged.Fodder = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Dedition Earring",ear2="Brutal Earring",
        body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
    
	sets.engaged.Crit = {
		head="Hiza. Somen　+2",
		body="Hiza. Haramaki +2",
		hands="Hizamaru Kote +2",
		legs="Hiza. Hizayoroi +2",
		feet="Hiza. Sune-Ate +2",
		neck="Yarak Torque",
		waist="Scouter's Rope",
		left_ear="Assuage Earring",
		right_ear="Phawaylla Earring",
		left_ring="Adoulin Ring",
		right_ring="Hizamaru Ring",
		back=gear.da_jse_back
	}
		
	-- SET Evasion
    sets.engaged.Evasion = {
		range="Ungur Boomerang",
		head="Hiza. Somen　+2",
		body="Hiza. Haramaki +2",
		hands="Hizamaru Kote +2",
		legs="Hiza. Hizayoroi +2",
		feet="Hiza. Sune-Ate +2",
		neck="Yarak Torque",
		waist="Scouter's Rope",
		left_ear="Assuage Earring",
		right_ear="Phawaylla Earring",
		left_ring="Adoulin Ring",
		right_ring="Hizamaru Ring",
		back=gear.da_jse_back
	}
	sets.engaged.SomeAcc.Evasion = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands="Buremte Gloves",ring1="Apate Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Shetal Stone",legs="Samnuha Tights",feet=gear.herculean_acc_feet}
    sets.engaged.Acc.Evasion = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Apate Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet}
    sets.engaged.FullAcc.Evasion = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Mekosu. Harness",hands="Buremte Gloves",ring1="Apate Ring",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet}
    sets.engaged.PDT = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Epona's Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}
	sets.engaged.SomeAcc.PDT = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Epona's Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.herculean_dt_legs,feet="Ahosi Leggings"}
	sets.engaged.Acc.PDT = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Epona's Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.herculean_dt_legs,feet="Ahosi Leggings"}
	sets.engaged.FullAcc.PDT = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Olseni Belt",legs=gear.herculean_dt_legs,feet="Ahosi Leggings"}
	sets.engaged.Fodder.PDT = {ammo="Togakushi Shuriken",
        head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Epona's Ring",
        back="Moonlight Cape",waist="Flume Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_dt_feet}
		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi +1"}
    --sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Yonin = {legs="Hattori Hakama +1"}
    sets.buff.Innin = {head="Hattori Zukin +1"}
	
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Shetal Stone"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {legs="Ryuo Hakama"}
	
	-- Weapons sets
	sets.weapons.Heishi = {main="Heishi Shorinken",sub="Kanaria"}
	sets.weapons.LowBuff = {main="Heishi Shorinken",sub="Blurred Knife +1"}
	sets.weapons.ProcDagger = {main="Chicken Knife II",sub=empty}
	sets.weapons.ProcSword = {main="Ark Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
	sets.weapons.ProcKatana = {main="Kanaria",sub=empty}
	sets.weapons.ProcClub = {main="Dream Bell +1",sub=empty}
	sets.weapons.ProcStaff = {main="Terra's Staff",sub=empty}
	sets.weapons.MagicWeapons = {main="Ochu",sub="Ochu"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 1)
end