local ACCOUNTSETTINGSURLModule = require(script.Parent.Parent.ACCOUNT_SETTINGS_URL)

return function(p1)
	-- upvalues: ACCOUNTSETTINGSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "BlockUserById" }, function(Callback, p2)
		-- upvalues: ACCOUNTSETTINGSURLModule (upval)
		return Callback(ACCOUNTSETTINGSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("users"):id(p2.userId):path("block"):body({})
	end)
end