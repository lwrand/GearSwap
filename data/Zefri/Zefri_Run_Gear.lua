function user_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('Epeolatry','Lionheart','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity') --ALT 
	send_command('bind @` gs c cycle RuneElement') --WIN
	send_command('bind ^` gs c RuneElement') --CTRL
	send_command('bind !pause gs c toggle AutoRuneMode') --WIN
	send_command('bind ^delete input /ja "Provoke" <stnpc>') --CTRL
	send_command('bind !delete input /ma "Cure IV" <stal>') --ALT
	send_command('bind @delete input /ma "Flash" <stnpc>') --WIN
    send_command('bind !f11 gs c cycle ExtraDefenseMode') --ALT
	send_command('bind ^\\\\ input /ma "Protect IV" <t>') --CTRL
	send_command('bind @\\\\ input /ma "Shell V" <t>') --WIN
	send_command('bind !\\\\ input /ma "Crusade" <me>') --ALT
	send_command('bind ^backspace input /ja "Lunge" <t>') --CTRL
	send_command('bind @backspace input /ja "Gambit" <t>') --WIN
	send_command('bind !backspace input /ja "Rayke" <t>') --ALT
	send_command('bind @f8 gs c toggle AutoTankMode') --WIN
	send_command('bind @f10 gs c toggle TankAutoDefense') --WIN
	send_command('bind ^@!` gs c cycle SkillchainMode') --CTRL
	send_command('bind !r gs c weapons Lionheart;gs c update') --ALT
	
	select_default_macro_book()
end

function init_gear_sets()

------Augmented Gear-----------------------------------------------------------------------------------------------------------------------------	
		
	AdhemarJacket = {}
	AdhemarJacket.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	AdhemarJacket.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	
	CarmineMask = {}
	CarmineMask.MND = { name = "Carmine Mask +1", augments = { 'Accuracy+12','DEX+12','MND+20', } }
	CarmineMask.FC = { name = "Carmine Mask +1", augments = { 'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4', } }
	
	HerculeanHelm = {}
	HerculeanHelm.Nuke = { name = "Herculean Helm", augments = { 'Mag. Acc.+18 "Mag.Atk.Bns."+18', '"Fast Cast"+1', 'INT+9', 'Mag. Acc.+9', '"Mag.Atk.Bns."+12', } }
	HerculeanHelm.DT = { name = "Herculean Helm", augments = { 'Attack+12', 'Phys. dmg. taken -4%', 'STR+9', 'Accuracy+8', } }
	HerculeanHelm.Refesh = { name = "Herculean Helm", augments = { 'Weapon skill damage +2%','Pet: Accuracy+11 Pet: Rng. Acc.+11','"Refresh"+2', } }
	HerculeanHelm.WSD = { name="Herculean Helm", augments={'Weapon skill damage +2%','DEX+15','Accuracy+6','Attack+3',}}
	HerculeanHelm.WSDAcc = { name = "Herculean Helm", augments = { 'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+3','Accuracy+13','Attack+11', } }
	HerculeanHelm.Reso =  { name="Herculean Helm", augments = {'Accuracy+27','"Triple Atk."+3','STR+3',} }
	
	TaeonHead = {}
	TaeonHead.SIR = { name="Taeon Chapeau", augments = {'Spell interruption rate down -9%',} }
	
	HerculeanVest = {}
	HerculeanVest.WSD = { name="Herculean Vest", augments = {'Accuracy+25','Weapon skill damage +4%','STR+8',}}
	HerculeanVest.Phalanx = { name="Taeon Tabard", augments={'Phalanx +3',}}
	
	TaeonBody = {}
	TaeonBody.FC = { name="Taeon Tabard", augments={'Accuracy+23','"Fast Cast"+5','HP+36',} }
	TaeonBody.SIR = { name="Taeon Tabard", augments = {'Spell interruption rate down -8%','STR+7 VIT+7'} }
	
	HerculeanGloves = {}
	HerculeanGloves.WSD = { name = "Herculean Gloves", augments = { 'Accuracy+21 Attack+21', 'Weapon skill damage +4%', 'Accuracy+9', 'Attack+10', } }
	HerculeanGloves.DT = { name="Herculean Gloves", augments={'Accuracy+8','Damage taken-2%',}}
	HerculeanGloves.HighAcc = { name = "Herculean Gloves", augments = { 'Accuracy+23 Attack+23', '"Triple Atk."+2', 'DEX+15', 'Accuracy+11', 'Attack+13', } }
	HerculeanGloves.Refresh = { name = "Herculean Gloves", augments = { 'Spell interruption rate down -1%','"Repair" potency +4%','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+16 "Mag.Atk.Bns."+16', } }
	HerculeanGloves.Crit = { name = "Herculean Gloves", augments = { 'Attack+23', 'Crit. hit damage +4%', 'DEX+8', 'Accuracy+11', } }
	HerculeanGloves.Reso = { name="Herculean Gloves", augments={'Accuracy+11 Attack+11','"Triple Atk."+2','STR+10','Accuracy+15','Attack+5', } }
	HerculeanGloves.Phalanx = { name="Taeon Gloves", augments={'Spell interruption rate down -5%','Phalanx +3',}}
	
	HerculeanLegs = {}
	HerculeanLegs.DT = { name = "Herculean Trousers", augments = { 'Accuracy+22', 'Damage taken-2%', 'VIT+6', } }
	HerculeanLegs.WSD = { name = "Herculean Trousers", augments = { 'Attack+28', 'Weapon skill damage +3%', 'STR+10', 'Accuracy+9', } }
	HerculeanLegs.Magic = { name="Herculean Trousers", augments={'"Mag.Atk.Bns."+15','Weapon skill damage +4%','STR+4','Mag. Acc.+15', } }
	HerculeanLegs.Reso = { name="Herculean Trousers", augments={'Attack+21','"Triple Atk."+2','STR+6','Accuracy+13', } }
	HerculeanLegs.TH = { name = "Herculean Trousers", augments = { 'INT+5','MND+6','"Treasure Hunter"+1','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
	HerculeanLegs.Phalanx = { name="Taeon Tights", augments={'Pet: Attack+21 Pet: Rng.Atk.+21','Phalanx +3',}}
		
	LustFeet = {}
	LustFeet.STRDEX = { name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}}
	LustFeet.STRDA = { name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}}
	
	HerculeanFeet = {}
	HerculeanFeet.QA = { name = "Herculean Boots", augments = { 'AGI+4', '"Dbl.Atk."+2', 'Quadruple Attack +3', 'Accuracy+4 Attack+4', } }
	HerculeanFeet.TA = { name = "Herculean Boots", augments = { 'Accuracy+14 Attack+14', '"Triple Atk."+4', 'DEX+3', 'Accuracy+2', 'Attack+15' } }
	HerculeanFeet.DT = { name = "Herculean Boots", augments = { 'Accuracy+23', 'Damage taken -3%' } }
	HerculeanFeet.Idle = { name = "Herculean Boots", augments = { 'Crit. hit damage +1%','STR+10','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
	HerculeanFeet.CritDmg = { name = "Herculean Boots", augments = { 'Accuracy+28', 'Crit. hit damage +5%', 'DEX+9', } }
	HerculeanFeet.WSD = { name = "Herculean Boots", augments = { 'Attack+22', 'Weapon skill damage +4%', 'Accuracy+15', } }
	HerculeanFeet.DW = { name = "Herculean Boots", augments = { 'Accuracy+3 Attack+3','"Dual Wield"+4','AGI+3','Accuracy+14' } }
	HerculeanFeet.Phalanx = { name="Taeon Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Spell interruption rate down -8%','Phalanx +3',}}
	HerculeanFeet.TH = { name="Herculean Boots", augments = { 'Phys. dmg. taken -2%','Pet: Phys. dmg. taken -2%','"Treasure Hunter"+2','Accuracy+16 Attack+16','Mag. Acc.+18 "Mag.Atk.Bns."+18', } }
	
	Ogma = {}
	Ogma.TP = { name="Ogma's cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%', } }
	Ogma.Tank = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}} -- 10% PDT
	Ogma.WSD = { name = "Ogma's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%', } }
	Ogma.Reso = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',} }
	Ogma.FC = { name = "Ogma's Cape", augments = { 'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10', } }
	
	------End of Augmented Gear-----------------------------------------------------------------------------------------------------------------------------	

    sets.Enmity = {ammo = "Sapience Orb",
		head = "Rabid visor",
		neck = "Warder's charm +1",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "Kurys Gloves",
		ring1 = "Provocare Ring",
		ring2 = "Petrov Ring",
		back = Ogma.Tank,
		waist = "Goading belt",
		legs = "Erilaz Leg Guards +1",
		feet = "Rager Ledel. +1"}
		 
    sets.Enmity.SIRD = {ammo = "Sapience Orb",
		head = "Rabid visor",
		neck = "Warder's charm +1",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "Kurys Gloves",
		ring1 = "Provocare Ring",
		ring2 = "Petrov Ring",
		back = Ogma.Tank,
		waist = "Goading belt",
		legs = "Erilaz Leg Guards +1",
		feet = "Rager Ledel. +1"}

    sets.Enmity.DT = {ammo = "Sapience Orb",
		head = "Rabid visor",
		neck = "Warder's charm +1",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "Kurys Gloves",
		ring1 = "Provocare Ring",
		ring2 = "Petrov Ring",
		back = Ogma.Tank,
		waist = "Goading belt",
		legs = "Erilaz Leg Guards +1",
		feet = "Rager Ledel. +1"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Fu. Bandeau +2"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Fu. Bandeau +2"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo = "Pemphredo Tathlum",
		head = HerculeanHelm.WSD,
		neck = "Sanctity Necklace",
		ear1 = "Friomisi Earring",
		ear2 = "Hecate's Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Acumen Ring",
		ring2 = "Shiva Ring",
		back = "Evasionist's Cape",
		waist = "Yamabuki-no-obi",
		legs = "Shned. Tights +1",
		feet = HerculeanFeet.DT}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	sets.element.Earth = {}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",legs="Rune. Trousers +1"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
	--	ear1 = "Etiolation Earring",
		ear2 = "Loquac. Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
	--	ring2 = "Rahab Ring",
		back = Ogma.FC,
		waist = "Goading belt",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}
			
	sets.precast.FC.DT = {ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
	--	ear1 = "Etiolation Earring",
		ear2 = "Loquac. Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
	--	ring2 = "Rahab Ring",
		back = Ogma.FC,
		waist = "Goading belt",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {ammo="Knobkierrie",
	--	ammo = "Seething Bomblet",
		head = "Lustratio Cap",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands="Meghanada Gloves +2",
	--	hands = "Herculean Gloves",
		ring1 = "Epona's Ring",
		ring2 = "Regal Ring",
		back = Ogma.Reso,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = LustFeet.STRDEX}
		
	sets.precast.WS.SomeAcc = {ammo="Knobkierrie",
	--	ammo = "Seething Bomblet",
		head = "Lustratio Cap",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands="Meghanada Gloves +2",
	--	hands = "Herculean Gloves",
		ring1 = "Epona's Ring",
		ring2 = "Regal Ring",
		back = Ogma.Reso,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = LustFeet.STRDEX}
		
	sets.precast.WS.Acc = {ammo="Knobkierrie",
	--	ammo = "Seething Bomblet",
		head = "Lustratio Cap",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands="Meghanada Gloves +2",
	--	hands = "Herculean Gloves",
		ring1 = "Epona's Ring",
		ring2 = "Regal Ring",
		back = Ogma.Reso,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = LustFeet.STRDEX}
		
	sets.precast.WS.HighAcc = {ammo="Knobkierrie",
	--	ammo = "Seething Bomblet",
		head = "Lustratio Cap",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands="Meghanada Gloves +2",
	--	hands = "Herculean Gloves",
		ring1 = "Epona's Ring",
		ring2 = "Regal Ring",
		back = Ogma.Reso,
		waist = "Fotia Belt",
		legs = "Meghanada Chausses +2",
		feet = LustFeet.STRDEX}
		
	sets.precast.WS.FullAcc = {ammo="Knobkierrie",
	--	ammo = "Seething Bomblet",
		head = "Lustratio Cap",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands="Meghanada Gloves +2",
	--	hands = "Herculean Gloves",
		ring1 = "Epona's Ring",
		ring2 = "Regal Ring",
		back = Ogma.Reso,
		waist = "Fotia Belt",
		legs = "Meghanada Chausses +2",
		feet = LustFeet.STRDEX}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{ammo="Knobkierrie",
		head = HerculeanHelm.WSD,
		neck="Caro Necklace",
		ear1="Moonshade earring",
		ear2="Sherida Earring",
		body = "Adhemar Jacket +1",
		hands="Meghanada Gloves +2",
		ring1= "Epona's Ring",
		ring2="Regal Ring",
		back=Ogma.WSD,
		waist="Grunfeld Rope",
		legs="Lustratio Subligar",
		feet=LustFeet.STRDEX})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
	--	ear1 = "Etiolation Earring",
		ear2 = "Loquac. Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
	--	ring2 = "Rahab Ring",
		back = Ogma.FC,
		waist = "Goading belt",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
	--	ear1 = "Etiolation Earring",
		ear2 = "Loquac. Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
	--	ring2 = "Rahab Ring",
		back = Ogma.FC,
		waist = "Goading belt",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{		ammo = "Sapience Orb",
		head = "Erilaz Galea +1",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		ear2 = "Loquacious Earring",
		body = "Manasa Chasuble",
		hands = "Runeist's Mitons",
		ring1 = "Defending Ring",
		ring2 = "Vocane Ring",
		back = "Merciful cape",
		waist = "Olympus sash",
		
		feet = "Turms Leggings +1"})
		
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{		head = "Fu. Bandeau +2",
		body = HerculeanVest.Phalanx,
		hands = HerculeanGloves.Phalanx,
		legs = HerculeanLegs.Phalanx,
		feet = HerculeanFeet.Phalanx})
		
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +1"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck = "Stone Gorget",legs="Haven Hose",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {		ammo = "Homiliary",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
		
    sets.idle.Sphere = set_combine(sets.idle,{})
			
	sets.idle.Tank = {
		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
		
	sets.idle.KiteTank = {
		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Carmine Cuisses +1",
		feet="Turms Leggings +1",}

	sets.idle.Weak = {
		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Carmine Cuisses +1",
		feet="Turms Leggings +1",}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
	sets.defense.PDT_HP = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
		
	sets.defense.MDT = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
	sets.defense.MDT_HP = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
	
	sets.defense.BDT = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
	sets.defense.BDT_HP = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
	
	sets.defense.MEVA = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
	sets.defense.MEVA_HP = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
		
	sets.defense.Death = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}

	sets.defense.DTCharm = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
		
	sets.defense.Charm = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
		ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Rajas Ring",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
    sets.engaged.SomeAcc = {
		ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Rajas Ring",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
	sets.engaged.Acc = {
		ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Rajas Ring",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
	sets.engaged.HighAcc = {
		ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Rajas Ring",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
	sets.engaged.FullAcc = {
		ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Rajas Ring",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
    sets.engaged.DTLite = {ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
    sets.engaged.SomeAcc.DTLite = {ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
	sets.engaged.Acc.DTLite = {ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
	sets.engaged.HighAcc.DTLite = {ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
	sets.engaged.FullAcc.DTLite = {ammo = "Ginsen",
		head = "Felistris Mask",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = "Adhemar Wristbands",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Reso,
		waist = "Ioskeha Belt",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
	
    sets.engaged.Tank = {		ammo = "Staunch Tathlum +1",
		head = "Fu. Bandeau +2",
		neck = "Loricate Torque +1",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's coat +3",
		hands = "Turms Mittens",
		ring1 = "Defending ring",
		ring2 = "Vocane Ring +1",
		back = Ogma.Tank,
		waist = "Engraved Belt",
		legs = "Erilaz Leg Guards +1",
		feet="Turms Leggings +1",}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

function select_default_macro_book()
	-- Default macro set/book
set_macro_page(2, 5)
set_style(19) 

end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = (framerate * 3)
					return true
				else
					return false
				end
			end
		end
	end
	return false
end