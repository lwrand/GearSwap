-- Curing rules
function refine_cure(spell, action, spellMap, eventArgs)
    cures = S{'Cure', 'Cure II','Cure III','Cure IV'}
	
	
	print ("hello world")
	add_to_chat(122,'test')
    if not cures:contains(spell.english) then
        return
    end
  
    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
  
    if spell_recasts[spell.recast_id] > 0 then
        if cures:contains(spell.english) then
            if spell.english == 'Cure' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Cure IV' then
                newSpell = 'Cure III'  
            elseif spell.english == 'Cure III' then
                newSpell = 'Cure II'
            end        
        end
    end
 
    if newSpell ~= spell.english then
        send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
        eventArgs.cancel = true
        return
    end
     
    if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
        equip(sets.self_healing)       
    end
end