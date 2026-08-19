local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 4 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET("GetPostsByUserId", function(p1) --[[ line: 7 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("posts-api"):path("v1"):path("content-posts"):path("getActiveCategories")
	end)
end