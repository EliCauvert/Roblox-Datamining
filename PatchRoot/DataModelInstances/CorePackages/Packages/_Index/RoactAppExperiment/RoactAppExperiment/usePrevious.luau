-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("RoactAppExperiment").Parent.React)

return function(p0) --[[ line: 9 | named "usePrevious" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 11 ]]
		-- upvalues: var1 (ref), p0 (ref)
		var1.current = p0
	end)
	
	return var1.current
end