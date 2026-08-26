return function(p1, p2)
	local var1 = "hidden"
	local var2 = nil
	
	local function _()
		-- upvalues: var2 (write)
		if var2 ~= nil then
			var2()
			var2 = nil
		end
	end
	
	local function onExitElapsed()
		-- upvalues: var2 (write), var1 (write), p2 (ref)
		var2 = nil
		var1 = "hidden"
		p2.setMounted(false)
	end
	
	local function beginExit()
		-- upvalues: var2 (write), var1 (write), p2 (ref), p1 (ref), onExitElapsed (ref)
		var2 = nil
		var1 = "exiting"
		p2.animate("exit")
		var2 = p2.schedule(p1.exitDurationMs, onExitElapsed)
	end
	
	local _ = function()
		-- upvalues: var2 (write), p2 (ref), p1 (ref), beginExit (ref)
		if var2 ~= nil then
			var2()
			var2 = nil
		end
		var2 = p2.schedule(p1.dwellMs, beginExit)
	end
	
	return {
		notifyUserToggle = function()
			-- upvalues: var1 (write), p2 (ref), var2 (write), p1 (ref), beginExit (ref)
			if var1 == "hidden" then
				var1 = "shown"
				p2.setMounted(true)
				p2.animate("enter")
			elseif var1 == "exiting" then
				var1 = "shown"
				p2.animate("enter")
			end
			if var2 ~= nil then
				var2()
				var2 = nil
			end
			var2 = p2.schedule(p1.dwellMs, beginExit)
		end,
		getPhase = function()
			-- upvalues: var1 (write)
			return var1
		end,
		dispose = function()
			-- upvalues: var2 (write)
			if var2 ~= nil then
				var2()
				var2 = nil
			end
		end
	}
end