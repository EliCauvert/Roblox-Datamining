-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 9 ]]
		-- upvalues: p1 (ref), var1 (ref), p0 (ref)
		if p1 and not var1.current then
			p0()
			var1.current = true
		end
	end, { p1 })
end