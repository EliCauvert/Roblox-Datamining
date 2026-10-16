local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("DeletePost", function(Callback, p2) --[[ Line: 15 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("posts-api"):path("v1"):path("content-posts"):path("delete"):id(p2.postId):body({})
	end)
end