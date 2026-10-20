local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("UnblockUserById", function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule, { params = p2.currentUserId }):path("user-blocking-api"):path("v1"):path("users"):id(p2.userId):path("unblock-user"):body({})
	end)
end