return function(p1, p2)
	local v1 = "hidden"
	local ScheduleResult: (() -> ())? = nil
	
	local function _()
		-- upvalues: ScheduleResult (ref)
		if ScheduleResult ~= nil then
			ScheduleResult()
			ScheduleResult = nil
		end
	end
	
	local function onExitElapsed()
		-- upvalues: ScheduleResult (ref), v1 (ref), p2 (copy)
		ScheduleResult = nil
		v1 = "hidden"
		p2.setMounted(false)
	end
	
	local function beginExit()
		-- upvalues: ScheduleResult (ref), v1 (ref), p2 (copy), p1 (copy), onExitElapsed (copy)
		ScheduleResult = nil
		v1 = "exiting"
		p2.animate("exit")
		ScheduleResult = p2.schedule(p1.exitDurationMs, onExitElapsed)
	end
	
	local _ = function()
		-- upvalues: ScheduleResult (ref), p2 (copy), p1 (copy), beginExit (copy)
		if ScheduleResult ~= nil then
			ScheduleResult()
			ScheduleResult = nil
		end
		ScheduleResult = p2.schedule(p1.dwellMs, beginExit)
	end
	
	return {
		notifyUserToggle = function()
			-- upvalues: v1 (ref), p2 (copy), ScheduleResult (ref), p1 (copy), beginExit (copy)
			if v1 == "hidden" then
				v1 = "shown"
				p2.setMounted(true)
				p2.animate("enter")
			elseif v1 == "exiting" then
				v1 = "shown"
				p2.animate("enter")
			end
			if ScheduleResult ~= nil then
				ScheduleResult()
				ScheduleResult = nil
			end
			ScheduleResult = p2.schedule(p1.dwellMs, beginExit)
		end,
		getPhase = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		dispose = function()
			-- upvalues: ScheduleResult (ref)
			if ScheduleResult ~= nil then
				ScheduleResult()
				ScheduleResult = nil
			end
		end
	}
end