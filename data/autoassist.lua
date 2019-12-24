require('chat')
require('lists')
require('coroutine')
require('queues')
require('logger')
require('tables')
require('sets')
require('strings')

state.autoassist = M(false, 'autoassist')
send_command('bind !a gs c autoassist')
mainpg="Croex"

function assistcheck()
if state.autoassist.value==true then
local target = windower.ffxi.get_mob_by_target('t')
	if target == nil or (player.target.type ~= 'MONSTER' and target.name ~= mainpg) then
		send_command('input /follow '..mainpg)
		send_command('input /ta '..mainpg)
--		add_to_chat(204, "*-*-*-*-*-*-*-*-* [ RESET ] *-*-*-*-*-*-*-*-*")
	elseif target.name == mainpg then
		send_command('input /assist '..mainpg)
--		add_to_chat(204, "*-*-*-*-*-*-*-*-* [ ASSIST ] *-*-*-*-*-*-*-*-*")
	elseif player.target.distance > 8 then
		send_command('input /follow '..mainpg)
		send_command('input /ta '..mainpg)
--		add_to_chat(204, "*-*-*-*-*-*-*-*-* [ TOO FAR ] *-*-*-*-*-*-*-*-*")
	elseif (target.name ~= mainpg and player.status == 'Idle') then
		send_command('input /attack <t>')
--		add_to_chat(204, "*-*-*-*-*-*-*-*-* [ ATTACK ] *-*-*-*-*-*-*-*-*")
	elseif player.status == 'Engaged' then
		send_command('input /follow <t>')
--		add_to_chat(204, "*-*-*-*-*-*-*-*-* [ FOLLOW  ] *-*-*-*-*-*-*-*-*")
	end
coroutine.schedule(assistcheck, 0.5)
end
end

function handle_aa()

	if state.autoassist.value==true then
		state.autoassist  	  = M(false, 'Autoassist')
		send_command('unbind TAB')
		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ ASSIST OFF ]->->->->->->->->->")
	else
		state.autoassist  	  = M(true, 'Autoassist')
		send_command('bind TAB a')
		send_command('input /ta <me>')
		assistcheck()
		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ ASSIST ON ]->->->->->->->->->")
	end

end

function user_self_command(commandArgs, eventArgs)
    if commandArgs[1]:lower() == 'autoassist' then
        handle_aa(commandArgs)
        eventArgs.handled = true
	end
end