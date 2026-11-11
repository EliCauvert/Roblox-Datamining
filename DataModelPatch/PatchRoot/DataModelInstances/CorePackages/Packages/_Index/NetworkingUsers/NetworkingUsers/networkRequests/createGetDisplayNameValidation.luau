local USERSURLModule = require(script.Parent.Parent.USERS_URL)

return function(p1)
	-- upvalues: USERSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetDisplayNameValidation" }, function(Callback, p2, DisplayName)
		-- upvalues: USERSURLModule (upval)
		return Callback(USERSURLModule):path("v1"):path("users"):id(p2):path("display-names"):path("validate"):queryArgs({ displayName = DisplayName })
	end)
end