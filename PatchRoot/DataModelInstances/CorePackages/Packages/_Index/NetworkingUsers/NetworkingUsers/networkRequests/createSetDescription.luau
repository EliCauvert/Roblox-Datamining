-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

local USERS_URLModule = require(script.Parent.Parent.USERS_URL)

return function(p0) --[[ line: 3 ]]
	-- upvalues: USERS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "SetDescription" }, function(p1, p2, p3) --[[ line: 6 ]]
		-- upvalues: USERS_URLModule (copy)
		return p1(USERS_URLModule, { LocalUserId = p2 }):path("v1"):path("description"):body({ description = p3 })
	end)
end