local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.POST("AddReaction", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("posts-api"):path("v1"):path("content-posts"):path("addReaction"):body(p3)
	end)
end