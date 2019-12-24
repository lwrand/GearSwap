function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Sequence','Almace','DualWeapons','DualClubs','DualAlmace')
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = "Toro Cape"
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = "Toro Cape"
	gear.obi_high_nuke_waist = "Refoccilation Stone"

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
    main="Oranyan",
    ammo="Impatiens",
    head="Atro. Chapeau +1",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    legs="Gyve Trousers",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Occult Acumen"+5','MND+7','"Mag.Atk.Bns."+4',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape"}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Moonshade Earring",ring1="Begrudging Ring",waist="Fotia Belt",feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Rufescent Ring",
		back="Bleating Mantle",waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Archon Ring",
		back="Sucellos's Cape",waist="Refoccilation Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

	
	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",hands="Amalric Gages +1",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",hands="Amalric Gages +1",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}

	sets.midcast.FastRecast = {
    main="Oranyan",
    ammo="Impatiens",
    head="Atro. Chapeau +1",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    legs="Gyve Trousers",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Occult Acumen"+5','MND+7','"Mag.Atk.Bns."+4',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape",}

    sets.midcast.Cure = {
    main={ name="Serenity", augments={'MP+15','Enha.mag. skill +3','"Cure" potency +2%',}},
    sub="Enki Strap",
    ammo="Hydrocera",
    head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}},
    legs="Atrophy Tights +1",
    feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    neck="Incanter's Torque",
    waist="Rumination Sash",
    right_ear="Regal Earring",
    left_ring="Lebeche Ring",
    right_ring="Janniston Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {main="Chatoyant Staff", body="Chironic doublet", back="Twilight Cape",waist="Hachirin-no-Obi"})
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {main="Chatoyant Staff", back="Twilight Cape",waist="Hachirin-no-Obi"})
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
    main="Oranyan",
    sub="Enki Strap",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +2",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Leth. Houseaux +1",
    neck="Duelist's Torque",
    waist="Rumination Sash",
    left_ear="Andoaa Earring",
    left_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Haven Hose"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {
    main={ name="Grioavolr", augments={'Enfb.mag. skill +14','MND+10','Mag. Acc.+22','"Mag.Atk.Bns."+4',}},
    sub="Enki Strap",
    ammo="Hydrocera",
    head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
	body="Lethargy Sayon +1",
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}},
    legs={ name="Psycloth Lappas", augments={'Mag. Acc.+10','Spell interruption rate down +15%','MND+7',}},
    feet={ name="Vitiation Boots +3", augments={'Enhances "Paralyze II" effect',}},
    neck="Duelist's Torque",
    waist="Rumination Sash",
    left_ear="Hermetic Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Kishar Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
	sets.midcast['Enfeebling Magic'].Resistant = {
    main={ name="Grioavolr", augments={'Enfb.mag. skill +14','MND+10','Mag. Acc.+22','"Mag.Atk.Bns."+4',}},
    sub="Enki Strap",
    ammo="Hydrocera",
    head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}},
    legs={ name="Psycloth Lappas", augments={'Mag. Acc.+10','Spell interruption rate down +15%','MND+7',}},
    feet={ name="Vitiation Boots +3", augments={'Enhances "Paralyze II" effect',}},
    neck="Duelist's Torque",
    waist="Rumination Sash",
    left_ear="Hermetic Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Globidonta Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {main={ name="Grioavolr", augments={'Enfb.mag. skill +15','INT+6','Mag. Acc.+16','"Mag.Atk.Bns."+17','Magic Damage +2',}},back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+4','"Mag.Atk.Bns."+10','Spell interruption rate down-2%',}}})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",hands="Jhakri Cuffs +2"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {hands="Leth. Gantherots +1"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands="Leth. Gantherots +1"})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {hands="Leth. Gantherots +1"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands="Leth. Gantherots +1"})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3",waist="Chaac Belt"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Viti. Chapeau +3"})
	
	sets.midcast['Paralyze II'] = set_combine(sets.midcast['Enfeebling Magic'], {feet="Vitiation boots"})
	sets.midcast['Paralyze II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {feet="Vitiation boots"})
	
    sets.midcast['Elemental Magic'] = {
    main={ name="Grioavolr", augments={'Enfb.mag. skill +15','INT+6','Mag. Acc.+16','"Mag.Atk.Bns."+17','Magic Damage +2',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+29','Magic burst dmg.+10%',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+26','Magic burst dmg.+11%','INT+4','"Mag.Atk.Bns."+13',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}}
		
    sets.midcast['Elemental Magic'].Resistant = {
    main={ name="Grioavolr", augments={'Enfb.mag. skill +15','INT+6','Mag. Acc.+16','"Mag.Atk.Bns."+17','Magic Damage +2',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+29','Magic burst dmg.+10%',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+26','Magic burst dmg.+11%','INT+4','"Mag.Atk.Bns."+13',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}}
		
    sets.midcast['Elemental Magic'].Fodder = {
    main={ name="Grioavolr", augments={'Enfb.mag. skill +15','INT+6','Mag. Acc.+16','"Mag.Atk.Bns."+17','Magic Damage +2',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+29','Magic burst dmg.+10%',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+26','Magic burst dmg.+11%','INT+4','"Mag.Atk.Bns."+13',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}}

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ear1="Regal Earring"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {sub="Alber Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring"})
		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Regal Gem",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands="Leth. Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Luminary Sash",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

	sets.midcast['Dark Magic'] = {
    main={ name="Rubicundity", augments={'Mag. Acc.+3','"Mag.Atk.Bns."+3','Dark magic skill +5','"Conserve MP"+2',}},
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Shango Robe",
    hands="Jhakri Cuffs +2",
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+30','"Conserve MP"+1','MND+9','"Mag.Atk.Bns."+10',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Occult Acumen"+5','MND+7','"Mag.Atk.Bns."+4',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Hermetic Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Evanescence Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}}

    sets.midcast.Drain = {
    main={ name="Rubicundity", augments={'Mag. Acc.+3','"Mag.Atk.Bns."+3','Dark magic skill +5','"Conserve MP"+2',}},
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Shango Robe",
    hands="Jhakri Cuffs +2",
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+30','"Conserve MP"+1','MND+9','"Mag.Atk.Bns."+10',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Occult Acumen"+5','MND+7','"Mag.Atk.Bns."+4',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Hermetic Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Evanescence Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = sets.midcast.Drain
		
	sets.midcast.Stun.Resistant = {main="Serenity",sub="Enki Strap",ammo="Regal Gem",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Acuity Belt +1",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Impatiens",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Lengo Pants",feet=gear.chironic_refresh_feet}
	

	-- Idle sets
	sets.idle = {main="Bolelabunga",
    sub="Beatific Shield +1",
    ammo="Homiliary",
    head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body="Jhakri Robe +2",
    hands={ name="Chironic Gloves", augments={'Accuracy+2 Attack+2','MND+6','"Refresh"+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Chironic Slippers", augments={'Attack+23','"Conserve MP"+4','"Refresh"+2','Accuracy+20 Attack+20','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
	sets.idle.PDT = {main="Bolelabunga",
    sub="Beatific Shield +1",
    ammo="Homiliary",
    head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body="Jhakri Robe +2",
    hands={ name="Chironic Gloves", augments={'Accuracy+2 Attack+2','MND+6','"Refresh"+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Chironic Slippers", augments={'Attack+23','"Conserve MP"+4','"Refresh"+2','Accuracy+20 Attack+20','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
	sets.idle.MDT = {main="Bolelabunga",
    sub="Beatific Shield +1",
    ammo="Homiliary",
    head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body="Jhakri Robe +2",
    hands={ name="Chironic Gloves", augments={'Accuracy+2 Attack+2','MND+6','"Refresh"+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Chironic Slippers", augments={'Attack+23','"Conserve MP"+4','"Refresh"+2','Accuracy+20 Attack+20','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
	sets.idle.Weak = {main="Bolelabunga",
    sub="Beatific Shield +1",
    ammo="Homiliary",
    head={ name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body="Jhakri Robe +2",
    hands={ name="Chironic Gloves", augments={'Accuracy+2 Attack+2','MND+6','"Refresh"+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Chironic Slippers", augments={'Attack+23','"Conserve MP"+4','"Refresh"+2','Accuracy+20 Attack+20','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Umbra Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",ammo="Impatiens",
		head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Emet Harness +1",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Impatiens",
		head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}
		
    sets.defense.MEVA = {main="Terra's Staff",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=empty,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Respite Cloak",hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Sucellos's Cape",waist="Luminary Sash",legs="Leth. Fuseau +1",feet="Telchine Pigaches"}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Sequence = {main="Sequence",sub="Ammurapi Shield"}
	sets.weapons.Almace = {main="Almace",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Sequence",sub="Almace"}
	sets.weapons.DualClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.DualAlmace = {main="Almace",sub="Sequence"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Ginsen",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {
    ammo="Ginsen",
    head="Jhakri Coronal +2",
    body="Ayanmo Corazza +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Begrudging Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}

	sets.engaged.DW = {
    ammo="Ginsen",
    head="Jhakri Coronal +2",
    body="Ayanmo Corazza +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Begrudging Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
	sets.engaged.PhysicalDef = {
    ammo="Ginsen",
    head="Jhakri Coronal +2",
    body="Ayanmo Corazza +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Begrudging Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}
		
	sets.engaged.MagicalDef = {
    ammo="Ginsen",
    head="Jhakri Coronal +2",
    body="Ayanmo Corazza +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Begrudging Ring",
    right_ring="Petrov Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 4)
	else
		set_macro_page(1, 4)
	end
end

function user_job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'buffup' then
		
		if check_arts() then return end
		
		if buffactive.Composure and buffactive.Refresh and buffactive.Haste and buffactive.Regen and buffactive.Aquaveil and buffactive.Phalanx and buffactive.Stoneskin and buffactive.Blink and buffactive['INT Boost'] and buffactive.Shell and buffactive.Protect and buffactive['Shock Spikes'] and buffactive['Enthunder II'] and buffactive['Multi Strikes'] and buffactive.Barfire and buffactive.Barparalyze then
			buffup = false
			add_to_chat(217, 'All buffs are currently up!')
			return
		elseif not (player.status == 'Idle' or player.status == 'Engaged') then
			buffup = false
			return
		end
		
		buffup = true
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if not buffactive.Composure then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[50] < latency then
				windower.chat.input('/ja "Composure" <me>')
			else
				buffup = false
				add_to_chat(123,'Abort: Composure not ready.')
			end
			return
		elseif not buffactive.Refresh and spell_recasts[894] < spell_latency then
			windower.chat.input('/ma "Refresh III" <me>')
		elseif not buffactive.Haste and spell_recasts[511] < spell_latency then
			windower.chat.input('/ma "Haste II" <me>')
		elseif not buffactive.Regen and spell_recasts[110] < spell_latency then
			windower.chat.input('/ma "Regen II" <me>')
		elseif not buffactive.Aquaveil and spell_recasts[55] < spell_latency then
			windower.chat.input('/ma "Aquaveil" <me>')
		elseif not buffactive.Phalanx and spell_recasts[106] < spell_latency then
			windower.chat.input('/ma "Phalanx" <me>')
		elseif not buffactive.Stoneskin and spell_recasts[54] < spell_latency then
			windower.chat.input('/ma "Stoneskin" <me>')
		elseif not buffactive.Blink and spell_recasts[53] < spell_latency then
			windower.chat.input('/ma "Blink" <me>')
		elseif not buffactive['INT Boost'] and spell_recasts[490] < spell_latency then
			windower.chat.input('/ma "Gain-INT" <me>')
		elseif not buffactive.Shell and spell_recasts[52] < spell_latency then
			windower.chat.input('/ma "Shell V" <me>')
		elseif not buffactive.Protect and spell_recasts[47] < spell_latency then
			windower.chat.input('/ma "Protect V" <me>')
		elseif not buffactive['Shock Spikes'] and spell_recasts[251] < spell_latency then
			windower.chat.input('/ma "Shock Spikes" <me>')
		elseif not buffactive['Enthunder II'] and spell_recasts[316] < spell_latency then
			windower.chat.input('/ma "Enthunder II" <me>')
		elseif not buffactive['Multi Strikes'] and spell_recasts[895] < spell_latency then
			windower.chat.input('/ma "Temper II" <me>')
		elseif not buffactive.Barfire and spell_recasts[60] < spell_latency then
			windower.chat.input('/ma "Barfire" <me>')
		elseif not buffactive.Barparalyze and spell_recasts[74] < spell_latency then
			windower.chat.input('/ma "Barparalyze" <me>')
		end
	end
end