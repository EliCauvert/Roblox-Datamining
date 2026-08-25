local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0)
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST("RemoveReaction", function(p1, p2)
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("posts-api"):path("v1"):path("content-posts"):path("removeReaction"):body(p2)
	end)
end