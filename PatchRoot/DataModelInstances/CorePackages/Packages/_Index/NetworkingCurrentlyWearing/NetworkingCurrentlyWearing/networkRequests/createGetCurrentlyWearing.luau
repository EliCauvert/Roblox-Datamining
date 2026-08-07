-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local AVATAR_URLModule = require(script.Parent.Parent.AVATAR_URL)

return function(p0) --[[ line: 8 ]]
	-- upvalues: AVATAR_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetCurrentlyWearing" }, function(p1, p2) --[[ line: 11 ]]
		-- upvalues: AVATAR_URLModule (copy)
		return p1(AVATAR_URLModule):path("v1"):path("users"):id(p2):path("currently-wearing")
	end)
end