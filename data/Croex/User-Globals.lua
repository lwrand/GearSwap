function set_lockstyle_custom(styleid)
	add_to_chat(217, 'Style '..styleid..' is ON!')
    send_command('wait 4; input /lockstyleset ' .. styleid)
end

sets.precast.FC.Trust =  {
	body="Yoran Unity Shirt"
}
