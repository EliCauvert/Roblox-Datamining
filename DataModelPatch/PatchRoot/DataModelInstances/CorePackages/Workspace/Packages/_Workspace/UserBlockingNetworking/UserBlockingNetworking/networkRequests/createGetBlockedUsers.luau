local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetBlockedUsers" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule, { currentUserId = p2 and p2.currentUserId or nil }):path("user-blocking-api"):path("v1"):path("users"):path("get-blocked-users"):queryArgs({
			cursor = p2 and p2.cursor or nil,
			count = p2 and p2.count or nil
		})
	end)
end