return function(p0, p1) --[[ line: 63 | named "createPlaybackToggleIndicatorMachine" ]]
	local var0 = "hidden"
	local var1 = nil
	
	local function _() --[[ line: 71 | named "clearTimer" ]]
		-- upvalues: var1 (write)
		if var1 ~= nil then
			var1()
			var1 = nil
		end
	end
	
	local function onExitElapsed() --[[ line: 78 ]]
		-- upvalues: var1 (write), var0 (write), p1 (ref)
		var1 = nil
		var0 = "hidden"
		p1.setMounted(false)
	end
	
	local function beginExit() --[[ line: 85 ]]
		-- upvalues: var1 (write), var0 (write), p1 (ref), p0 (ref), onExitElapsed (ref)
		var1 = nil
		var0 = "exiting"
		p1.animate("exit")
		var1 = p1.schedule(p0.exitDurationMs, onExitElapsed)
	end
	
	local _ = function() --[[ line: 93 | named "armDwell" ]]
		-- upvalues: var1 (write), p1 (ref), p0 (ref), beginExit (ref)
		if var1 ~= nil then
			var1()
			var1 = nil
		end
		var1 = p1.schedule(p0.dwellMs, beginExit)
	end
	
	return {
		notifyUserToggle = function() --[[ line: 99 ]]
			-- upvalues: var0 (write), p1 (ref), var1 (write), p0 (ref), beginExit (ref)
			if var0 == "hidden" then
				var0 = "shown"
				p1.setMounted(true)
				p1.animate("enter")
			elseif var0 == "exiting" then
				var0 = "shown"
				p1.animate("enter")
			end
			if var1 ~= nil then
				var1()
				var1 = nil
			end
			var1 = p1.schedule(p0.dwellMs, beginExit)
		end,
		getPhase = function() --[[ line: 121 ]]
			-- upvalues: var0 (write)
			return var0
		end,
		dispose = function() --[[ line: 115 ]]
			-- upvalues: var1 (write)
			if var1 ~= nil then
				var1()
				var1 = nil
			end
		end
	}
end