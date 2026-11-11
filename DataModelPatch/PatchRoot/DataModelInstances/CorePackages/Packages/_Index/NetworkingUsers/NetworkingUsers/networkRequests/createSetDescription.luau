local USERSURLModule = require(script.Parent.Parent.USERS_URL)

return function(p1)
	-- upvalues: USERSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "SetDescription" }, function(Callback, LocalUserId, Description)
		-- upvalues: USERSURLModule (upval)
		return Callback(USERSURLModule, { LocalUserId = LocalUserId }):path("v1"):path("description"):body({ description = Description })
	end)
end