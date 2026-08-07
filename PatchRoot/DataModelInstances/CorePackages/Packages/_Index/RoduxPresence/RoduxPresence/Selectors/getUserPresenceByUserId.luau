-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local getDeepValueModule = require(script:FindFirstAncestor("RoduxPresence").getDeepValue)

return function(p0) --[[ line: 4 ]]
	-- upvalues: getDeepValueModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1, p2) --[[ line: 6 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref)
		return getDeepValueModule(p1, keyPath .. ".byUserId")[p2]
	end
end