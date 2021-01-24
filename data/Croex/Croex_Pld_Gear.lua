function user_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Tank','DDTank','BreathTank','Dawn','NoShellTank','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT','PDT_HP','Tank')
    state.MagicalDefenseMode:options('BDT','MDT_HP','AegisMDT','AegisNoShellMDT','OchainMDT','OchainNoShellMDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm')
	state.IdleMode:options('Normal','Tank','KiteTank','PDT','MDT','Refresh','Reraise')
	state.Weapons:options('None','BurtgangAegis','BurtgangOchain')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}
	
	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
    select_default_macro_book()
    update_defense_mode()
	set_lockstyle_custom(2)
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {
    	ammo = "Paeapua",
		head = "Loess Barbuta",
    	neck = "Unmoving Collar +1",
    	ear1 = "Friomisi Earring",
    	ear2 = "Cryptic Earring",
    	--body = "Souv. Cuirass +1",
    	hands = "Macabre Gaunt. +1",
    	ring1 = "Apeile Ring +1",
    	ring2 = "Apeile Ring",
    	back = gear.pld_enmity_jse_back,
    	waist = "Creed Baudrier",
    	--legs = "Souv. Diechlings +1",
		legs = "Cab. Breeches +1",
    	feet = "Eschite Greaves"
    }
		
    sets.Enmity.SIRD = {
    	--main = "Mafic Cudgel",
    	ammo = "Staunch Tathlum",
    	--head = "Souveran Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Friomisi Earring",
    	--ear2 = "Trux Earring",
    	--body = "Souv. Cuirass +1",
    	hands = "Macabre Gaunt. +1",
    	ring1 = "Defending Ring",
    	--ring2 = "Moonbeam Ring",
    	back = gear.pld_enmity_jse_back
    	--waist = "Rumination Sash"
    	--legs = "Founder's Hose",
    	--feet = "Odyssean Greaves"
    }
		
    sets.Enmity.DT = {
    	--main = "Mafic Cudgel",
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Souv. Diechlings +1",
    	--feet = "Souveran Schuhs +1"
    }
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity, {
    		--feet = "Rev. Leggings +3"
    	})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT, {
    		--feet = "Rev. Leggings +3"
    	})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
    	--head = "Sulevia's Mask +2",
    	--neck = "Phalaina Locket",
    	ear1 = "Nourish. Earring",
    	ear2 = "Nourish. Earring +1",
    	--body = "Rev. Surcoat +3",
    	hands = "Cab. Gauntlets +1",
    	ring1 = "Stikini Ring",
    	--ring2 = "Rufescent Ring",
    	back = gear.pld_enmity_jse_back,
    	waist = "Luminary Sash",
    	legs = "Carmine Cuisses +1"
    	--feet = "Carmine Greaves +1"
    }

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
    	--head = "Carmine Mask +1",
    	--body = "Rev. Surcoat +3",
    	--ring1 = "Asklepian Ring",
    	--ring2 = "Valseur's Ring",
    	waist = "Chaac Belt"
    	--legs = "Sulev. Cuisses +2"
    }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {
    	ammo = "Ginsen",
    	--head = "Founder's Corona",
    	--neck = "Combatant's Torque",
    	--ear1 = "Zennaroi Earring",
    	ear2 = "Telos Earring",
    	--body = "Tartarus Platemail",
    	hands = "Leyline Gloves",
    	--ring1 = "Ramuh Ring +1",
    	--ring2 = "Patricius Ring",
    	--back = "Ground. Mantle +1",
    	--waist = "Olseni Belt",
    	legs = "Carmine Cuisses +1"
    	--feet = "Founder's Greaves"
    }
		
	sets.precast.JA['Violent Flourish'] = {
		ammo = "Ginsen",
		--head = "Founder's Corona",
		neck = "Erra Pendant",
		ear1 = "Gwati Earring",
		ear2 = "Digni. Earring",
		--body = "Found. Breastplate",
		hands = "Leyline Gloves",
		ring1 = "Defending Ring",
		ring2 = "Stikini Ring",
		--back = "Ground. Mantle +1",
		--waist = "Olseni Belt",
		legs = "Carmine Cuisses +1"
		--feet = "Founder's Greaves"
	}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    	ammo = "Sapience Orb",
    	--head = "Carmine Mask +1",
    	--neck = "Voltsurge Torque",
    	ear1 = "Enchntr. Earring +1",
    	ear2 = "Loquacious Earring",
    	body = gear.odyssean_fc_body,
    	hands = "Leyline Gloves",
    	ring1 = "Rahab Ring",
    	ring2 = "Kishar Ring",
    	back = gear.pld_fc_jse_back,
    	waist = "Flume Belt +1",
    	legs = "Enif Cosciales"
    	--feet = "Odyssean Greaves"
    }
		
    sets.precast.FC.DT = {
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Souv. Diechlings +1",
    	--feet = "Souveran Schuhs +1"
    }
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    		--waist = "Siegel Sash"
    	})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
			neck = "Diemer Gorget",
			ear1 = "Nourish. Earring",
			ear2 = "Nourish. Earring +1"
			--body = "Jumalik Mail"
		})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    	ammo = "Paeapua",
    	--head = "Flam. Zucchetto +2",
    	--neck = "Asperity Necklace",
    	ear1 = "Cessance Earring",
    	ear2 = "Brutal Earring",
    	body = gear.valorous_wsd_body
    	--hands = gear.odyssean_wsd_hands,
    	--ring1 = "Regal Ring",
    	--ring2 = "Rufescent Ring",
    	--back = "Bleating Mantle",
    	--waist = "Fotia Belt",
    	--legs = "Sulev. Cuisses +2",
    	--feet = "Sulev. Leggings +2"
    }
		
    sets.precast.WS.DT = {
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Souv. Diechlings +1",
    	--feet = "Souveran Schuhs +1"
    }

    sets.precast.WS.Acc = {
    	--ammo = "Hasty Pinion +1",
    	--head = "Ynglinga Sallet",
    	--neck = "Combatant's Torque",
    	--ear1 = "Zennaroi Earring",
    	ear2 = "Telos Earring",
    	body = gear.valorous_wsd_body,
    	--hands = "Sulev. Gauntlets +2",
    	--ring1 = "Ramuh Ring +1",
    	--ring2 = "Ramuh Ring +1",
    	--back = "Ground. Mantle +1",
    	--waist = "Olseni Belt",
    	legs = "Carmine Cuisses +1"
    	--feet = "Sulev. Leggings +2"
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
    		--neck = "Fotia Gorget",
    		ear1 = "Brutal Earring",
    		ear2 = "Moonshade Earring"
    	})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {
    		--neck = "Fotia Gorget",
    		--ear1 = "Zennaroi Earring",
    		ear2 = "Moonshade Earring"
    	})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
			--neck = "Fotia Gorget",
			ear1 = "Brutal Earring",
			ear2 = "Moonshade Earring"
		})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {
    		--neck = "Fotia Gorget",
    		--ear1 = "Zennaroi Earring",
    		ear2 = "Moonshade Earring"
    	})

	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {
		head=gear.odyssean_wsd_head,
		hands=gear.odyssean_wsd_hands,
		body=gear.valorous_wsd_body,
		--legs=gear.valorous_wsd_legs,
		legs=gear.odyssean_wsd_legs,
		--feet="Sulevia Leggings +2",
		neck="Breeze Gorget",
		ear1="Moonshade Earring",
		ear2="Thrud Earring",
		ring1="Karieyh Ring +1",
		ring2="Ilabrat Ring",
		back=gear.pld_wsd_jse_back,
		waist="Sailfi Belt +1"
	})
	
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS, {
		head=gear.odyssean_wsd_head,
		hands=gear.odyssean_wsd_hands,
		body=gear.valorous_wsd_body,
		--legs=gear.valorous_wsd_legs,
		legs=gear.odyssean_wsd_legs,
		--feet="Sulevia Leggings +2",
		neck="Breeze Gorget",
		ear1="Moonshade Earring",
		ear2="Thrud Earring",
		ring1="Karieyh Ring +1",
		ring2="Ilabrat Ring",
		back=gear.pld_wsd_jse_back,
		waist="Sailfi Belt +1"
	})
	
	sets.precast.WS['Flat Blade'] = {
		ammo = "Ginsen",
		--head = "Founder's Corona",
		--neck = "Voltsurge Torque",
		ear1 = "Gwati Earring",
		ear2 = "Digni. Earring",
		--body = "Flamma Korazin +2",
		hands = "Leyline Gloves",
		ring1 = "Defending Ring",
		ring2 = "Stikini Ring",
		--back = "Ground. Mantle +1",
		--waist = "Olseni Belt",
		legs = "Carmine Cuisses +1"
		--feet = "Founder's Greaves"
	}

	sets.precast.WS['Flat Blade'].Acc = {
		ammo = "Ginsen",
		--head = "Flam. Zucchetto +2",
		neck = "Sanctity Necklace",
		ear1 = "Gwati Earring",
		ear2 = "Digni. Earring"
		--body = "Flamma Korazin +2",
		--hands = "Flam. Manopolas +2",
		--ring1 = "Ramuh Ring +1",
		--ring2 = "Ramuh Ring +1",
		--back = "Ground. Mantle +1",
		--waist = "Eschan Stone",
		--legs = "Flamma Dirs +2",
		--feet = "Flam. Gambieras +2"
	}

    sets.precast.WS['Sanguine Blade'] = {
    	--ammo = "Dosis Tathlum",
    	--head = "Jumalik Helm",
    	neck = "Sanctity Necklace",
    	ear1 = "Friomisi Earring",
    	--ear2 = "Crematio Earring",
    	--body = "Jumalik Mail",
    	--hands = "Founder's Gauntlets",
    	--ring1 = "Shiva Ring +1",
    	ring2 = "Archon Ring"
    	--back = "Toro Cape",
    	--waist = "Fotia Belt",
    	--legs = "Flamma Dirs +2"
    	--feet = "Founder's Greaves"
    }

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']

    sets.precast.WS['Atonement'] = {
    	ammo = "Paeapua",
    	head = "Loricate Torque +1",
    	--neck = "Fotia Gorget",
    	ear1 = "Moonshade Earring",
    	ear2 = "Ishvara Earring",
    	body = gear.valorous_wsd_body,
    	--hands = gear.odyssean_wsd_hands,
    	ring1 = "Defending Ring",
    	--ring2 = "Moonbeam Ring",
    	back = gear.pld_enmity_jse_back,
    	--waist = "Fotia Belt",
    	--legs = "Flamma Dirs +2",
    	feet = "Eschite Greaves"
    }

    sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {
		--ear1 = "Zennaroi Earring",
		ear2 = "Telos Earring"
	}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {
    	ammo = "Paeapua",
    	--head = "Chev. Armet +1",
    	--neck = "Voltsurge Torque",
    	ear1 = "Enchntr. Earring +1",
    	ear2 = "Loquacious Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Leyline Gloves",
    	ring1 = "Defending Ring",
    	ring2 = "Kishar Ring"
    	--waist = "Tempus Fugit"
    	--legs = gear.odyssean_fc_legs,
    	--feet = "Odyssean Greaves"
    }
		
	sets.midcast.FastRecast.DT = {
		ammo = "Staunch Tathlum",
		--head = "Souv. Schaller +1",
		neck = "Loricate Torque +1",
		ear1 = "Odnowa Earring +1",
		--ear2 = "Odnowa Earring",
		--body = "Rev. Surcoat +3",
		hands = "Souveran Handschuhs",
		--ring1 = "Moonbeam Ring",
		--ring2 = "Moonbeam Ring",
		--back = "Moonlight Cape",
		waist = "Creed Baudrier"
		--legs = "Souv. Diechlings +1",
		--feet = "Souveran Schuhs +1"
	}

    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
    	--main = "Deacon Sword",
    	ammo = "Staunch Tathlum",
    	neck = "Loricate Torque +1",
    	ear1 = "Nourish. Earring",
    	ear2 = "Nourish. Earring +1",
    	--body = "Jumalik Mail",
    	hands = "Macabre Gaunt. +1",
    	ring1 = "Defending Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Solemnity Cape",
    	waist = "Creed Baudrier",
    	legs = "Carmine Cuisses +1"
    	--feet = "Odyssean Greaves"
    }
		
    sets.midcast.Cure.SIRD = {
    	--main = "Deacon Sword",
    	ammo = "Staunch Tathlum",
    	--head = "Souveran Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Nourish. Earring",
    	ear2 = "Nourish. Earring +1",
    	--body = "Jumalik Mail",
    	hands = "Macabre Gaunt. +1",
    	ring1 = "Defending Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Solemnity Cape",
    	waist = "Creed Baudrier"
    	--legs = "Founder's Hose",
    	--feet = "Odyssean Greaves"
    }
		
    sets.midcast.Cure.DT = {
    	--main = "Deacon Sword",
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Souv. Diechlings +1",
    	--feet = "Souveran Schuhs +1"
    }
		
    sets.midcast.Reprisal = {
    	ammo = "Staunch Tathlum",
    	head = "Loricate Torque +1",
    	neck = "Sanctity Necklace",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Arke Cosciales",
    	--feet = "Souveran Schuhs +1"
    }

	sets.Self_Healing = {
		--main = "Deacon Sword",
		ammo = "Staunch Tathlum",
		--head = "Souv. Schaller +1",
		neck = "Loricate Torque +1",
		ear1 = "Nourish. Earring",
		ear2 = "Nourish. Earring +1",
		--body = "Souv. Cuirass +1",
		hands = "Macabre Gaunt. +1",
		--ring1 = "Moonbeam Ring",
		--ring2 = "Moonbeam Ring",
		--back = "Moonlight Cape",
		waist = "Creed Baudrier"
		--legs = "Souv. Diechlings +1",
		--feet = "Souveran Schuhs +1"
	}
		
	sets.Self_Healing.SIRD = {
		--main = "Deacon Sword",
		ammo = "Staunch Tathlum",
		--head = "Souv. Schaller +1",
		neck = "Loricate Torque +1",
		ear1 = "Nourish. Earring",
		ear2 = "Nourish. Earring +1",
		--body = "Souv. Cuirass +1",
		hands = "Macabre Gaunt. +1",
		ring1 = "Defending Ring",
		--ring2 = "Moonbeam Ring",
		--back = "Solemnity Cape",
		waist = "Flume Belt +1"
		--legs = "Founder's Hose",
		--feet = "Odyssean Greaves"
	}
		
	sets.Self_Healing.DT = {
		ammo = "Staunch Tathlum",
		--head = "Souv. Schaller +1",
		neck = "Loricate Torque +1",
		ear1 = "Odnowa Earring +1",
		--ear2 = "Odnowa Earring",
		--body = "Rev. Surcoat +3",
		hands = "Souveran Handschuhs",
		--ring1 = "Moonbeam Ring",
		--ring2 = "Moonbeam Ring",
		--back = "Moonlight Cape",
		waist = "Creed Baudrier"
		--legs = "Souv. Diechlings +1",
		--feet = "Souveran Schuhs +1"
	}

	sets.Cure_Received = {
		hands = "Souveran Handschuhs",
		--feet = "Souveran Schuhs +1"
	}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {
    	--main = "Colada",
    	ammo = "Staunch Tathlum",
    	--head = "Carmine Mask +1",
    	neck = "Incanter's Torque",
    	ear1 = "Andoaa Earring",
    	ear2 = "Loquacious Earring",
    	--body = "Shab. Cuirass +1",
    	hands = "Leyline Gloves",
    	ring1 = "Defending Ring",
    	ring2 = "Kishar Ring",
    	--back = "Merciful Cape",
    	--waist = "Olympus Sash",
    	legs = "Carmine Cuisses +1"
    	--feet = "Odyssean Greaves"
    }
		
    sets.midcast['Enhancing Magic'].SIRD = {
    	--main = "Colada",
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Incanter's Torque",
    	ear1 = "Andoaa Earring",
    	--ear2 = "Odnowa Earring",
    	--body = "Shab. Cuirass +1",
    	hands = "Souveran Handschuhs",
    	ring1 = "Defending Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Merciful Cape",
    	--waist = "Olympus Sash",
    	legs = "Carmine Cuisses +1"
    	--feet = "Odyssean Greaves"
    }

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
			--waist = "Siegel Sash"
		})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
			body = gear.odyssean_phalanx_body,
			hands = "Souveran Handschuhs",
			neck = "Unmoving Collar +1",
			waist = "Creed Baudrier",
			back = gear.pld_phalanx_jse_back,
			feet = "Souveran Schuhs"
		})
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {
			body = gear.odyssean_phalanx_body,
			hands = "Souveran Handschuhs",
			neck = "Unmoving Collar +1",
			waist = "Creed Baudrier",
			back = gear.pld_phalanx_jse_back,
			feet = "Souveran Schuhs"
		})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {
    	ammo = "Homiliary",
    	--head = "Jumalik Helm",
    	--neck = "Coatl Gorget +1",
    	--ear1 = "Etiolation Earring",
    	ear2 = "Ethereal Earring",
    	--body = "Jumalik Mail",
    	hands = "Souveran Handschuhs",
    	ring1 = "Defending Ring",
    	ring2 = "Dark Ring",
    	--back = "Moonlight Cape",
    	waist = "Fucho-no-obi",
    	--legs = "Sulev. Cuisses +2",
    	feet = "Cab. Leggings +1"
    }

    -- Idle sets
    sets.idle = {
		main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1",
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }
		
    sets.idle.PDT = {
    	main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }
		
    sets.idle.MDT = {
    	main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }
		
	sets.idle.Refresh = {
		main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
	}
	sets.idle.Tank = {
		main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
	}
		
	sets.idle.KiteTank = {
		main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
	}
		
    sets.idle.Reraise = {
    	main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }

    sets.idle.Weak = {
    	main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }
	sets.Kiting = {
		main = "Burtgang",
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1",
		legs = "Carmine Cuisses +1"
		--feet = "Valorous Greaves"
	}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {
    	--head = "Chev. Armet +1",
    	--neck = "Coatl Gorget +1",
    	ear2 = "Ethereal Earring",
    	waist = "Flume Belt +1"
    	--feet = "Rev. Leggings +3"
    }
	sets.passive.AbsorbMP = {
		--head = "Chev. Armet +1",
		--neck = "Coatl Gorget +1",
		ear2 = "Ethereal Earring",
		waist = "Flume Belt +1"
		--feet = "Rev. Leggings +3"
	}
    sets.MP_Knockback = {}
    sets.Twilight = {
    	--head = "Twilight Helm",
    	--body = "Twilight Mail"
    }
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.BurtgangAegis = {
		main = "Burtgang",
		sub = "Aegis"
	}
	sets.weapons.BurtgangOchain = {
		main = "Burtgang",
		sub = "Ochain"
	}
	
    sets.defense.PDT = {
    	--main = "Mafic Cudgel",
    	ammo = "Staunch Tathlum",
    	--head = "Chev. Armet +1",
    	neck = "Diemer Gorget",
    	--ear1 = "Creed Earring",
    	--ear2 = "Thureous Earring",
    	--body = "Tartarus Platemail",
    	hands = "Souveran Handschuhs",
    	ring1 = "Defending Ring",
    	--ring2 = "Warden's Ring",
    	--back = "Shadow Mantle",
    	waist = "Flume Belt +1"
    	--legs = "Souv. Diechlings +1",
    	--feet = "Souveran Schuhs +1"
    }
		
    sets.defense.PDT_HP = {
    	--main = "Mafic Cudgel",
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Arke Cosciales",
    	--feet = "Souveran Schuhs +1"
    }
		
    sets.defense.MDT_HP = {
    	--main = "Mafic Cudgel",
    	--sub = "Aegis",
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Souv. Diechlings +1",
    	--feet = "Souveran Schuhs +1"
    }
		
    sets.defense.MEVA_HP = {
    	--main = "Mafic Cudgel",
    	--sub = "Aegis",
    	ammo = "Staunch Tathlum",
    	--head = "Souv. Schaller +1",
    	neck = "Loricate Torque +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Odnowa Earring",
    	--body = "Rev. Surcoat +3",
    	hands = "Souveran Handschuhs",
    	--ring1 = "Moonbeam Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Creed Baudrier"
    	--legs = "Arke Cosciales",
    	--feet = "Souveran Schuhs +1"
    }
		
    sets.defense.PDT_Reraise = {
    	ammo = "Staunch Tathlum",
    	--head = "Twilight Helm",
    	neck = "Loricate Torque +1",
    	--ear1 = "Etiolation Earring",
    	--ear2 = "Thureous Earring",
    	--body = "Twilight Mail",
    	hands = "Macabre Gaunt. +1",
    	ring1 = "Defending Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Moonlight Cape",
    	waist = "Flume Belt +1"
    	--legs = "Arke Cosciales",
    	--feet = "Souveran Schuhs +1"
    }
		
    sets.defense.MDT_Reraise = {
    	--main = "Mafic Cudgel",
    	--sub = "Aegis",
    	ammo = "Staunch Tathlum",
    	--head = "Twilight Helm",
    	neck = "Loricate Torque +1",
    	--ear1 = "Etiolation Earring",
    	--ear2 = "Sanare Earring",
    	--body = "Twilight Mail",
    	hands = "Souveran Handschuhs",
    	ring1 = "Defending Ring",
    	--ring2 = "Moonbeam Ring",
    	--back = "Engulfer Cape +1",
    	waist = "Flume Belt +1",
    	--legs = gear.odyssean_fc_legs,
    	feet = "Cab. Leggings +1"
    }

	sets.defense.BDT = {
		--main = "Mafic Cudgel",
		--sub = "Aegis",
		ammo = "Staunch Tathlum",
		--head = "Loricate Torque +1",
		--neck = "Warder's Charm +1",
		ear1 = "Odnowa Earring +1",
		--ear2 = "Sanare Earring",
		--body = "Tartarus Platemail",
		--hands = "Sulev. Gauntlets +2",
		ring1 = "Defending Ring"
		--ring2 = "Shadow Ring",
		--back = "Moonlight Cape",
		--waist = "Asklepian Belt",
		--legs = "Sulev. Cuisses +2"
		--feet = "Amm Greaves"
	}
		
	sets.defense.Tank = {
		ammo = "Staunch Tathlum",
		--head = "Chev. Armet +1",
		neck = "Loricate Torque +1",
		--ear1 = "Creed Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		--ring2 = "Shadow Ring",
		--back = "Shadow Mantle",
		waist = "Flume Belt +1"
		--legs = "Chev. Cuisses +1",
		--feet = "Souveran Schuhs +1"
	}
		
	sets.defense.MEVA = {
		ammo = "Staunch Tathlum",
		--head = "Founder's Corona",
		--neck = "Warder's Charm +1",
		--ear1 = "Etiolation Earring",
		--ear2 = "Sanare Earring",
		--body = "Tartarus Platemail",
		hands = "Leyline Gloves",
		--ring1 = "Vengeful Ring",
		--ring2 = "Purity Ring",
		back = gear.pld_fc_jse_back
		--waist = "Asklepian Belt",
		--legs = gear.odyssean_fc_legs
		--feet = "Hippo. Socks +1"
	}
		
	sets.defense.Death = {
		ammo = "Staunch Tathlum",
		--head = "Founder's Corona",
		neck = "Loricate Torque +1",
		--ear1 = "Etiolation Earring",
		--ear2 = "Sanare Earring",
		--body = "Tartarus Platemail",
		hands = "Leyline Gloves",
		--ring1 = "Warden's Ring",
		--ring2 = "Shadow Ring",
		back = gear.pld_fc_jse_back
		--waist = "Asklepian Belt",
		--legs = gear.odyssean_fc_legs
		--feet = "Odyssean Greaves"
	}
		
	sets.defense.Charm = {
		ammo = "Staunch Tathlum",
		--head = "Founder's Corona",
		neck = "Unmoving Collar +1",
		--ear1 = "Etiolation Earring",
		--ear2 = "Sanare Earring",
		--body = "Tartarus Platemail",
		hands = "Leyline Gloves",
		--ring1 = "Vengeful Ring"
		--ring2 = "Purity Ring",
		--back = "Solemnity Cape",
		--waist = "Asklepian Belt",
		--legs = "Souv. Diechlings +1"
		--feet = "Odyssean Greaves"
	}
		
		-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = {
    	sub = "Aegis",
    	ammo = "Staunch Tathlum",
    	--head = "Founder's Corona",
    	--neck = "Warder's Charm +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Sanare Earring",
    	--body = "Tartarus Platemail",
    	hands = "Souveran Handschuhs",
    	ring1 = "Defending Ring",
    	--ring2 = "Shadow Ring",
    	--back = "Engulfer Cape +1",
    	waist = "Creed Baudrier",
    	--legs = "Chev. Cuisses +1",
    	feet = "Chev. Sabatons +1"
    }
		
    sets.defense.OchainNoShellMDT = {
    	sub = "Aegis",
    	ammo = "Staunch Tathlum",
    	--head = "Founder's Corona",
    	--neck = "Warder's Charm +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Sanare Earring",
    	--body = "Tartarus Platemail",
    	hands = "Souveran Handschuhs",
    	ring1 = "Defending Ring",
    	--ring2 = "Shadow Ring",
    	--back = "Engulfer Cape +1",
    	--waist = "Flax Sash",
    	--legs = "Sulev. Cuisses +2",
    	feet = "Chev. Sabatons +1"
    }
		
    sets.defense.AegisMDT = {
    	sub = "Aegis",
    	ammo = "Staunch Tathlum",
    	--head = "Founder's Corona",
    	--neck = "Warder's Charm +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Sanare Earring",
    	--body = "Tartarus Platemail",
    	hands = "Leyline Gloves",
    	ring1 = "Defending Ring",
    	--ring2 = "Shadow Ring",
    	back = gear.pld_fc_jse_back
    	--waist = "Asklepian Belt",
    	--legs = gear.odyssean_fc_legs
    	--feet = "Odyssean Greaves"
    }
		
    sets.defense.AegisNoShellMDT = {
    	sub = "Aegis",
    	ammo = "Staunch Tathlum",
    	--head = "Founder's Corona",
    	--neck = "Warder's Charm +1",
    	ear1 = "Odnowa Earring +1",
    	--ear2 = "Sanare Earring",
    	--body = "Tartarus Platemail",
    	hands = "Souveran Handschuhs",
    	ring1 = "Defending Ring",
    	--ring2 = "Shadow Ring",
    	back = gear.pld_fc_jse_back
    	--waist = "Asklepian Belt",
    	--legs = "Sulev. Cuisses +2"
    	--feet = "Amm Greaves"
    }

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		--ear2 = "Thureous Earring",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back={ name="Weard Mantle", augments={'VIT+3','DEX+2','Enmity+2','Phalanx +5',}},
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
	}

    sets.engaged.Acc = {
    	ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		ear2 = "Suppanomimi",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Shadow Mantle",
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }

    sets.engaged.DW = {
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		ear2 = "Suppanomimi",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Shadow Mantle",
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }

    sets.engaged.DW.Acc = {
		ammo = "Staunch Tathlum",
		--head = "Sulevia's Mask +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		ear2 = "Suppanomimi",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Shadow Mantle",
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
    }

	sets.engaged.Tank = {
		ammo = "Staunch Tathlum",
		--head = "Chev. Armet +1",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		ear2 = "Suppanomimi",
		--body = "Tartarus Platemail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring",
		ring2 = "Dark Ring",
		--back = "Shadow Mantle",
		waist = "Flume Belt +1"
		--legs = "Sulevia's Cuisses +1"
		--feet = "Valorous Greaves"
	}
		
	sets.engaged.Dawn = {
		--main = "Mafic Cudgel",
		ammo = "Staunch Tathlum",
		--head = "Jumalik Helm",
		neck = "Loricate Torque +1",
		ear1 = "Telos Earring",
		ear2 = "Ethereal Earring",
		--body = "Jumalik Mail",
		hands = "Souveran Handschuhs",
		ring1 = "Defending Ring"
		--ring2 = "Shadow Ring",
		--back = "Moonlight Cape",
		--waist = "Tempus Fugit"
		--legs = "Arke Cosciales",
		--feet = "Rev. Leggings +3"
	}
		
	sets.engaged.BreathTank = {
		--main = "Mafic Cudgel",
		ammo = "Staunch Tathlum",
		neck = "Loricate Torque +1",
		--ear1 = "Thureous Earring",
		--ear2 = "Etiolation Earring",
		--body = "Tartarus Platemail",
		--hands = "Sulev. Gauntlets +2",
		ring1 = "Defending Ring",
		--ring2 = "Shadow Ring",
		--back = "Engulfer Cape +1",
		waist = "Creed Baudrier"
		--legs = "Sulev. Cuisses +2"
		--feet = "Amm Greaves"
	}
		
	sets.engaged.DDTank = {
		--ammo = "Hasty Pinion +1",
		--head = "Sulevia's Mask +2",
		neck = "Loricate Torque +1",
		ear1 = "Brutal Earring",
		ear2 = "Cessance Earring",
		--body = "Tartarus Platemail",
		--hands = "Sulev. Gauntlets +2",
		ring1 = "Defending Ring"
		--ring2 = "Patricius Ring",
		--back = "Weard Mantle",
		--waist = "Tempus Fugit",
		--legs = "Sulev. Cuisses +2",
		--feet = "Sulev. Leggings +2"
	}
		
	sets.engaged.Acc.DDTank = {
		--ammo = "Hasty Pinion +1",
		--head = "Sulevia's Mask +2",
		neck = "Loricate Torque +1",
		--ear1 = "Zennaroi Earring",
		ear2 = "Telos Earring",
		--body = "Tartarus Platemail",
		--hands = "Sulev. Gauntlets +2",
		ring1 = "Defending Ring",
		--ring2 = "Patricius Ring",
		--back = "Weard Mantle",
		--waist = "Tempus Fugit",
		--legs = "Sulev. Cuisses +2",
		--feet = "Sulev. Leggings +2"
	}
		
	sets.engaged.NoShellTank = {
		--main = "Mafic Cudgel",
		ammo = "Staunch Tathlum",
		--head = "Jumalik Helm",
		neck = "Loricate Torque +1",
		--ear1 = "Thureous Earring",
		--ear2 = "Etiolation Earring",
		--body = "Rev. Surcoat +3",
		--hands = "Sulev. Gauntlets +2",
		ring1 = "Defending Ring",
		--ring2 = "Moonbeam Ring",
		--back = "Moonlight Cape",
		waist = "Flume Belt +1",
		--legs = gear.odyssean_fc_legs,
		feet = "Cab. Leggings +1"
	}
		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck = "Nicander's Necklace",
		waist = "Gishdubar Sash"
		--legs = "Shabti Cuisses",
		--legs = "Shabti Cuisses +1",
		--ring1 = "Purity Ring",
		--ring2 = "Blenmot's Ring",
		--ring2 = "Blenmot's Ring +1"
	})
	sets.buff.Sleep = {
		--neck = "Vim Torque +1"
	}
    sets.buff.Cover = {
    	body = "Cab. Surcoat +1"
    }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'RUN' then
        set_macro_page(9, 4)
    elseif player.sub_job == 'RDM' then
        set_macro_page(6, 4)
    elseif player.sub_job == 'BLU' then
        set_macro_page(8, 4)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 4)
    else
        set_macro_page(2, 4) --War/Etc
    end
end