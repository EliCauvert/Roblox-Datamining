-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:04 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p0, p1) --[[ line: 6 | named "useUncontrolledState" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p0 or false)
	reactModule.useEffect(function() --[[ line: 8 ]]
		-- upvalues: p0 (ref), var2 (ref)
		if p0 ~= nil then
			var2(p0)
		end
	end, { p0 })
	
	return var1, reactModule.useCallback(function(p2) --[[ line: 14 ]]
		-- upvalues: p0 (ref), var2 (ref), p1 (ref)
		if p0 == nil then
			var2(p2)
		end
		p1(p2)
	end, { p0, p1 })
end