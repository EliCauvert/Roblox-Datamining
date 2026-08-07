-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local GAMES_URLModule = require(script.Parent.Parent.GAMES_URL)

return function(p0) --[[ line: 5 ]]
	-- upvalues: GAMES_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetExperienceMedia" }, function(p1, p2) --[[ line: 10 ]]
		-- upvalues: GAMES_URLModule (copy)
		return p1(GAMES_URLModule):path("v2"):path("games"):id(p2):path("media")
	end)
end