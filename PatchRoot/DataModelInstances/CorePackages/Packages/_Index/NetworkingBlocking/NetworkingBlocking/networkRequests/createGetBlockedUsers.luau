-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

local ACCOUNT_SETTINGS_URLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p0) --[[ line: 12 ]]
	-- upvalues: ACCOUNT_SETTINGS_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetBlockedUsers" }, function(p1, p2) --[[ line: 15 ]]
		-- upvalues: ACCOUNT_SETTINGS_URLModule (copy)
		return p1(ACCOUNT_SETTINGS_URLModule, { currentUserId = if p2 then p2.currentUserId else nil }):path("v1"):path("users"):path("get-detailed-blocked-users")
	end)
end