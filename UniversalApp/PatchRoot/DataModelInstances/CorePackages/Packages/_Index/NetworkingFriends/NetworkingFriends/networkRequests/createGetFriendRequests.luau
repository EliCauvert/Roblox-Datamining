local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetFriendRequests" }, function(p1, p2) --[[ line: 8 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule, { currentUserId = p2.currentUserId }):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
			fetchMutualFriends = p2.fetchMutualFriends,
			sortOrder = p2.sortOrder,
			limit = p2.limit,
			cursor = p2.cursor
		})
	end)
end