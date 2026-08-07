-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1) --[[ line: 7 | named "useDebounce" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p0)
	reactModule.useLayoutEffect(function() --[[ line: 10 ]]
		-- upvalues: var2 (ref), p0 (ref), p1 (ref)
		local function updateValue() --[[ line: 11 ]]
			-- upvalues: var2 (copy), p0 (copy)
			var2(p0)
		end
		
		if p1 == nil or p1 == 0 then
			var2(p0)
			
			return
		end
		local delayedThread = task.delay(p1, updateValue)
		
		return function() --[[ line: 22 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p0, p1 })
	
	return var1
end