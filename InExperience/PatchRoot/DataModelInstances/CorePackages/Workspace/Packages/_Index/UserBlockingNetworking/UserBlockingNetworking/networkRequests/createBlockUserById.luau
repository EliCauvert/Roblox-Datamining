local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 13 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("BlockUserById", function(Callback, p2) --[[ Line: 16 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule, { currentUserId = p2.currentUserId }):path("user-blocking-api"):path("v1"):path("users"):id(p2.userId):path("block-user"):body({})
	end)
end