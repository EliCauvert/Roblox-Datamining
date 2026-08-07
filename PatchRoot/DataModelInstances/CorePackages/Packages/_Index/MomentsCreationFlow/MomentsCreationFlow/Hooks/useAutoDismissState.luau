-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState

return function(p0, p1) --[[ line: 13 | named "useAutoDismissState" ]]
	-- upvalues: useRef (ref), useState (ref), useCallback (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2, var3 = useState(p0 or true)
	local var4 = useCallback(function() --[[ line: 17 ]]
		-- upvalues: var1 (ref), var3 (ref), p1 (ref)
		if var1.current then
			task.cancel(var1.current)
		end
		var3(true)
		var1.current = task.delay(p1 or 5, function() --[[ line: 23 ]]
			-- upvalues: var3 (copy)
			var3(false)
		end)
	end, { p1, var2 })
	useEffect(function() --[[ line: 28 ]]
		-- upvalues: var4 (ref), var1 (ref)
		var4()
		
		return function() --[[ line: 31 ]]
			-- upvalues: var1 (copy)
			if var1.current then
				task.cancel(var1.current)
				var1.current = nil
			end
		end
	end, { p1 })
	
	return var2, var4
end