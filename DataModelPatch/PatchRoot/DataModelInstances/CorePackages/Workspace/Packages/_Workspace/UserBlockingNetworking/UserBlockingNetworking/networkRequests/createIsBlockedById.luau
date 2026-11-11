local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "IsBlockedById" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule, { currentUserId = p2.currentUserId }):path("user-blocking-api"):path("v1"):path("users"):id(p2.userId):path("is-blocked")
	end)
end