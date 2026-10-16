local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET("GetPostsByPostId", function(Callback, p2) --[[ Line: 17 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("posts-api"):path("v1"):path("content-posts"):path("findByUser"):queryArgs({ limit = p2.limit, postId = p2.postId, userId = p2.userId })
	end)
end