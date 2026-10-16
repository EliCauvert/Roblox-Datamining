local Parent = script:FindFirstAncestor("FriendsNetworking").Parent
local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)
local FFlagAddFriendsSessionId = require(Parent.SharedFlags).FFlagAddFriendsSessionId
local FFlagAddFriendsPageHighlightUnseenRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests

return function(p1) --[[ Line: 11 ]]
	-- upvalues: FRIENDSURLModule (copy), FFlagAddFriendsSessionId (copy), FFlagAddFriendsPageHighlightUnseenRequests (copy)
	return p1.roduxNetworking.GET("GetFriendRequests", function(Callback, p2) --[[ Line: 16 ]]
		-- upvalues: FRIENDSURLModule (upval), FFlagAddFriendsSessionId (upval), FFlagAddFriendsPageHighlightUnseenRequests (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
			fetchMutualFriends = p2.fetchMutualFriends,
			sortOrder = p2.sortOrder,
			limit = p2.limit,
			cursor = p2.cursor,
			sessionId = if FFlagAddFriendsSessionId then p2.sessionId else nil,
			uprankUnseen = if FFlagAddFriendsPageHighlightUnseenRequests then true else nil
		})
	end)
end