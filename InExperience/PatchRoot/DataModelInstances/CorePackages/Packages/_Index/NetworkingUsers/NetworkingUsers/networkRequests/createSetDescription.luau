local USERSURLModule = require(script.Parent.Parent.USERS_URL)

return function(p1) --[[ Line: 3 ]]
	-- upvalues: USERSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "SetDescription" }, function(Callback, LocalUserId, Description) --[[ Line: 6 ]]
		-- upvalues: USERSURLModule (upval)
		return Callback(USERSURLModule, { LocalUserId = LocalUserId }):path("v1"):path("description"):body({ description = Description })
	end)
end