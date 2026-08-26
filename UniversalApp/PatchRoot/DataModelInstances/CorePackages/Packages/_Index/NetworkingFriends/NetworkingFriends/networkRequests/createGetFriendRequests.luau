local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDS_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetFriendRequests" }, function(p2, p3)
		-- upvalues: FRIENDS_URLModule (copy)
		return p2(FRIENDS_URLModule, { currentUserId = p3.currentUserId }):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
			fetchMutualFriends = p3.fetchMutualFriends,
			sortOrder = p3.sortOrder,
			limit = p3.limit,
			cursor = p3.cursor
		})
	end)
end