local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)
local FFlagAddFriendsSessionId = require(script:FindFirstAncestor("FriendsNetworking").Parent.SharedFlags).FFlagAddFriendsSessionId

return function(p1)
	-- upvalues: FRIENDSURLModule (copy), FFlagAddFriendsSessionId (copy)
	return p1.roduxNetworking.GET("GetFriendRequests", function(Callback, p2)
		-- upvalues: FRIENDSURLModule (upval), FFlagAddFriendsSessionId (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
			uprankUnseen = true,
			fetchMutualFriends = p2.fetchMutualFriends,
			sortOrder = p2.sortOrder,
			limit = p2.limit,
			cursor = p2.cursor,
			sessionId = if FFlagAddFriendsSessionId then p2.sessionId else nil
		})
	end)
end