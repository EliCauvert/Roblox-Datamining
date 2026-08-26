local ACCOUNT_SETTINGS_URLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p1)
	-- upvalues: ACCOUNT_SETTINGS_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "BlockUserById" }, function(p2, p3)
		-- upvalues: ACCOUNT_SETTINGS_URLModule (copy)
		return p2(ACCOUNT_SETTINGS_URLModule, { currentUserId = p3.currentUserId }):path("v1"):path("users"):id(p3.userId):path("block"):body({})
	end)
end