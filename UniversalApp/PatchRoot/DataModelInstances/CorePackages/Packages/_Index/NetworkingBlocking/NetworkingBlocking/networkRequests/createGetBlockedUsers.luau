local ACCOUNT_SETTINGS_URLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p1)
	-- upvalues: ACCOUNT_SETTINGS_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetBlockedUsers" }, function(p2, p3)
		-- upvalues: ACCOUNT_SETTINGS_URLModule (copy)
		return p2(ACCOUNT_SETTINGS_URLModule, { currentUserId = if p3 then p3.currentUserId else nil }):path("v1"):path("users"):path("get-detailed-blocked-users")
	end)
end