local USERSURLModule = require(script.Parent.Parent.USERS_URL)

return function(p1)
	-- upvalues: USERSURLModule (copy)
	return p1.roduxNetworking.PATCH({ Name = "SetDisplayName" }, function(Callback, p2, NewDisplayName)
		-- upvalues: USERSURLModule (upval)
		return Callback(USERSURLModule):path("v1"):path("users"):id(p2):path("display-names"):body({ newDisplayName = NewDisplayName })
	end)
end