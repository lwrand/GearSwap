-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------


-- Initialization function for this job file.
function get_sets()
	require('coroutine')
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Define sets and vars used by this job file.
function init_gear_sets()
	
	-- target Bonecraft NPC
	send_command('input /targetnpc Teril')
	-- trade x 24
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	coroutine.sleep(1.0)
	send_command('input /item "Bone. Set 70" <t>')
	
end



