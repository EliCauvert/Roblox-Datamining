local ACCOUNT_SETTINGS_URLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p0)
	-- upvalues: ACCOUNT_SETTINGS_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetBlockedUsers" }, function(p1, p2)
		-- upvalues: ACCOUNT_SETTINGS_URLModule (copy)
		return p1(ACCOUNT_SETTINGS_URLModule, { currentUserId = if p2 then p2.currentUserId else nil }):path("v1"):path("users"):path("get-detailed-blocked-users")
	end)
end