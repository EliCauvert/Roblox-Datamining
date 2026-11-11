local ACCOUNTSETTINGSURLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p1)
	-- upvalues: ACCOUNTSETTINGSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "UnblockUserById" }, function(Callback, p2)
		-- upvalues: ACCOUNTSETTINGSURLModule (upval)
		return Callback(ACCOUNTSETTINGSURLModule, { params = p2.currentUserId }):path("v1"):path("users"):id(p2.userId):path("unblock"):body({})
	end)
end