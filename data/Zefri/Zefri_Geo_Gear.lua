function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Nehushtan','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+4','"Mag.Atk.Bns."+10',}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	
	gear.obi_cure_back = "Lifestream Cape"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	

	
	autoindi = "Fury"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="Grioavolr",ammo="Sapience Orb",
			head="Nahtirah Hat",neck = "Orunmila's Torque",ear2="Loquacious Earring",
			body="Anhur Robe",ring1="Kishar Ring",
			back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkaro. Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Enki Strap"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {main="Grioavolr",ammo="Sapience Orb",
		head=empty,neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Twilight Cloak",ring1="Kishar Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="Grioavolr",ammo="Sapience Orb",
			head="Nahtirah Hat",neck = "Orunmila's Torque",ear2="Loquacious Earring",
			body="Anhur Robe",ring1="Kishar Ring",
			back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}

	sets.midcast.Geomancy = {main="Idris",sub="Genbu's Shield",range="Dunna",
				head="Azimuth Hood",neck="Incanter's Torque",ear2="Loquacious Earring",
				body="Bagua Tunic",hands="Geo. Mitaines +1",ring1="Kishar Ring",
				back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back=gear.idle_jse_back,legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})
		
    sets.midcast.Cure = {main="Serenity",sub="Enki Strap",
				head="Vanya Hood",neck="Incanter's Torque",ear2="Loquacious Earring",
				body="Jhakri Robe +2",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Serenity",sub="Enki Strap",
				head="Vanya Hood",neck="Incanter's Torque",ear2="Loquacious Earring",
				body="Jhakri Robe +2",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geomancy Pants",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Serenity",sub="Enki Strap",
				head="Vanya Hood",neck="Incanter's Torque",ear2="Loquacious Earring",
				body="Jhakri Robe +2",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geomancy Pants",feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Shiva Ring",ring2="Acumen Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast['Elemental Magic'].Resistant = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Shiva Ring",ring2="Acumen Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].Fodder = {main=gear.grioavolr_nuke_staff,sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Shiva Ring",ring2="Acumen Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages +1",})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages +1"})
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Sangoma Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Sangoma Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Sangoma Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Stun.Resistant = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Sangoma Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

		
	sets.midcast.Impact = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands="Amalric Gages",ring1="Kishar Ring",ring2="Sangoma Ring",
		back=gear.nuke_jse_back,waist="Ovate Rope",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Enfeebling Magic'] = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body=gear.merlinic_nuke_body,hands="Amalric Gages",ring1="Kishar Ring",ring2="Sangoma Ring",
		back=gear.nuke_jse_back,waist="Ovate Rope",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body=gear.merlinic_nuke_body,hands="Amalric Gages",ring1="Kishar Ring",ring2="Sangoma Ring",
		back=gear.nuke_jse_back,waist="Ovate Rope",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {main="Kirin's Pole",sub="Fulcio Grip",
		neck="Incanter's Torque",ear1="Andoaa Earring",body="Anhur Robe",
		hands="Augur's Gloves",feet="Rubeus Boots",
		waist="Olympus Sash",back="Merciful Cape"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Stone Gorget",waist="Siegel Sash",legs="Haven Hose"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
		
	sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
		
	sets.idle.TPEat = set_combine(sets.idle, {
	--neck="Chrys. Torque"
	})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Geo. Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Assid. Pants +1",feet="Bagua Sandals +1"}

	sets.idle.PDT.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Geo. Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Assid. Pants +1",feet="Bagua Sandals +1"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Defense sets
	
	sets.defense.PDT = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	sets.defense.MDT = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
		
    sets.defense.MEVA = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geomancy Sandals +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
		
	sets.engaged.DW = {
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Loquacious Earring",
		body="Jhakri Robe +2",hands="Bagua Mitaines +1",ring1="Vocane Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",
	--ring1="Mujin Band"
	}
	sets.RecoverBurst = {neck="Mizu. Kubikazari",body="Seidr Cotehardie",
	--ring1="Mujin Band",
	}

	-- Weapons sets
	sets.weapons.Nehushtan = {main='Nehushtan',sub='Genmei Shield'}
	sets.weapons.DualWeapons = {main='Nehushtan',sub='Nehushtan'}
end


function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 2)
	set_style(20) 
end