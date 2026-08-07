-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local GAMES_URLModule = require(script.Parent.Parent.GAMES_URL)

return function(p0) --[[ line: 9 ]]
	-- upvalues: GAMES_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetExperiencesPlayabilityStatus" }, function(p1, p2) --[[ line: 12 ]]
		-- upvalues: GAMES_URLModule (copy)
		return p1(GAMES_URLModule):path("v1"):path("games"):path("multiget-playability-status"):expandedQueryArgsWithIds("universeIds", p2)
	end)
end