local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 14 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET("GetPostsByCursor", function(p1, p2) --[[ line: 17 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("posts-api"):path("v1"):path("content-posts"):path("findByUser"):queryArgs({
			cursor = p2.cursor,
			sortOrder = p2.sortOrder,
			userId = p2.userId
		})
	end)
end