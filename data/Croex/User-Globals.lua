function set_lockstyle_custom(styleid)
	add_to_chat(217, 'Style '..styleid..' is ON!')
    send_command('wait 4; input /lockstyleset ' .. styleid)
end

sets.precast.FC.Trust =  {
	body="Yoran Unity Shirt"
}

function job_precast(spell, spellMap, eventArgs)
	--add_to_chat(217, 'spell...'..spell.type)
	if spell.type == 'Trust' then
		--add_to_chat(217, 'Casting a trust...')
		equip(sets.precast.FC.Trust)
	end
	if spell.action_type == 'Magic' then
		if spellMap == 'Cure' or spellMap == 'Curaga' or (spell.skill == 'Blue Magic' and spellMap == 'Healing') then
			gear.default.obi_back = gear.obi_cure_back
			gear.default.obi_waist = gear.obi_cure_waist
		else
			gear.default.obi_back = gear.obi_nuke_back
			gear.default.obi_waist = gear.obi_nuke_waist
		end
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
		end
	end
end

