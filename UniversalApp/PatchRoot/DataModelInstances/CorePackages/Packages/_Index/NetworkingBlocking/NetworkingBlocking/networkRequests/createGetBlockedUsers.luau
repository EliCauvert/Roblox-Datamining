local ACCOUNTSETTINGSURLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: ACCOUNTSETTINGSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetBlockedUsers" }, function(Callback, p2) --[[ Line: 15 ]]
		-- upvalues: ACCOUNTSETTINGSURLModule (upval)
		return Callback(ACCOUNTSETTINGSURLModule, { currentUserId = p2 and p2.currentUserId or nil }):path("v1"):path("users"):path("get-detailed-blocked-users")
	end)
end