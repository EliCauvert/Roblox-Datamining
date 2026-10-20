local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "AddReaction" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("posts-api"):path("v1"):path("content-posts"):path("addReaction"):body(p2)
	end)
end