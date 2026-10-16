local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET("GetPostsByUserId", function(Callback) --[[ Line: 7 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("posts-api"):path("v1"):path("content-posts"):path("getActiveCategories")
	end)
end