local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 14 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET("GetPostsByPostId", function(p1, p2) --[[ line: 17 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("posts-api"):path("v1"):path("content-posts"):path("findByUser"):queryArgs({ limit = p2.limit, postId = p2.postId, userId = p2.userId })
	end)
end