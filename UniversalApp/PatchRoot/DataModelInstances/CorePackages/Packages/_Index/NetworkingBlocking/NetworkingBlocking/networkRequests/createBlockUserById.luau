local ACCOUNT_SETTINGS_URLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p0) --[[ line: 13 ]]
	-- upvalues: ACCOUNT_SETTINGS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "BlockUserById" }, function(p1, p2) --[[ line: 16 ]]
		-- upvalues: ACCOUNT_SETTINGS_URLModule (copy)
		return p1(ACCOUNT_SETTINGS_URLModule, { currentUserId = p2.currentUserId }):path("v1"):path("users"):id(p2.userId):path("block"):body({})
	end)
end