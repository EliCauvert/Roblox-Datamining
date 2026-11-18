local _ = require(script.Parent.swipeMath)

return function(ReducedMotion)
	local v1 = "idle"
	local Flag = false
	local Flag1 = false
	local ReducedMotion1 = ReducedMotion
	
	local function arrive(List)
		-- upvalues: v1 (ref)
		if v1 == "entering" or v1 == "settling" then
			v1 = "resting"
			table.insert(List, { kind = "restartTimer" })
			
			return
		end
		if v1 == "leaving" then
			v1 = "gone"
			table.insert(List, { kind = "exited" })
		end
	end
	
	local function moveTo(List, Target, CarryVelocity)
		-- upvalues: ReducedMotion1 (ref), arrive (copy)
		if ReducedMotion1 then
			table.insert(List, { kind = "jump", target = Target })
			arrive(List)
			
			return
		else
			table.insert(List, {
				kind = "spring",
				target = Target,
				carryVelocity = CarryVelocity
			})
		end
	end
	
	local function _(List)
		-- upvalues: Flag1 (ref)
		if Flag1 then
			Flag1 = false
			table.insert(List, { kind = "collapse" })
		end
	end
	
	return {
		getPhase = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		isExpanded = function()
			-- upvalues: Flag1 (ref)
			return Flag1
		end,
		setReducedMotion = function(Value)
			-- upvalues: ReducedMotion1 (ref)
			ReducedMotion1 = Value
		end,
		start = function()
			-- upvalues: v1 (ref), ReducedMotion1 (ref), moveTo (copy)
			local List = {}
			
			if v1 ~= "idle" then
				return List
			end
			v1 = "entering"
			
			if not ReducedMotion1 then
				table.insert(List, { kind = "jump", target = "exit" })
			end
			moveTo(List, "rest", false)
			
			return List
		end,
		press = function()
			-- upvalues: Flag (ref), v1 (ref)
			local List = {}
			
			if Flag or v1 == "idle" or v1 == "leaving" or v1 == "gone" then
				return List
			end
			Flag = true
			
			if v1 == "entering" or v1 == "settling" then
				table.insert(List, { kind = "stopSpring" })
			end
			return List
		end,
		scroll = function()
			-- upvalues: Flag (ref), Flag1 (ref), v1 (ref)
			local List = {}
			
			if Flag and not Flag1 then
				v1 = "dragging"
				Flag1 = true
				table.insert(List, { kind = "expand" })
				table.insert(List, { kind = "pauseTimer" })
				
				return List
			else
				return List
			end
		end,
		release = function(p1)
			-- upvalues: Flag (ref), v1 (ref), Flag1 (ref), moveTo (copy)
			local List = {}
			
			if not Flag then
				return List
			end
			Flag = false
			
			if v1 == "dragging" then
				if Flag1 then
					Flag1 = false
					table.insert(List, { kind = "collapse" })
				end
				if p1 == "dismiss" then
					v1 = "leaving"
					table.insert(List, { kind = "dismiss" })
					moveTo(List, "exit", true)
					
					return List
				else
					v1 = "settling"
					moveTo(List, "rest", true)
					
					return List
				end
			else
				if v1 == "entering" or v1 == "settling" then
					moveTo(List, "rest", false)
				end
				return List
			end
		end,
		requestExit = function()
			-- upvalues: v1 (ref), Flag (ref), Flag1 (ref), moveTo (copy)
			local List = {}
			
			if v1 == "leaving" or v1 == "gone" then
				return List
			end
			if v1 == "idle" then
				v1 = "gone"
				table.insert(List, { kind = "exited" })
				
				return List
			end
			Flag = false
			
			if Flag1 then
				Flag1 = false
				table.insert(List, { kind = "collapse" })
			end
			v1 = "leaving"
			table.insert(List, { kind = "pauseTimer" })
			moveTo(List, "exit", false)
			
			return List
		end,
		settled = function()
			-- upvalues: Flag (ref), arrive (copy)
			local t = {}
			
			if not Flag then
				arrive(t)
			end
			return t
		end
	}
end