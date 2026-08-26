local parent = script:FindFirstAncestor("FriendsNetworking").Parent
local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)
local fFlagAddFriendsSessionId = require(parent.SharedFlags).FFlagAddFriendsSessionId
local fFlagAddFriendsPageHighlightUnseenRequests = require(parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests

return function(p1)
	-- upvalues: FRIENDS_URLModule (ref), fFlagAddFriendsSessionId (ref), fFlagAddFriendsPageHighlightUnseenRequests (ref)
	return p1.roduxNetworking.GET("GetFriendRequests", function(p2, p3)
		-- upvalues: FRIENDS_URLModule (copy), fFlagAddFriendsSessionId (copy), fFlagAddFriendsPageHighlightUnseenRequests (copy)
		return p2(FRIENDS_URLModule, { currentUserId = p3.currentUserId }):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
			fetchMutualFriends = p3.fetchMutualFriends,
			sortOrder = p3.sortOrder,
			limit = p3.limit,
			cursor = p3.cursor,
			sessionId = if fFlagAddFriendsSessionId then p3.sessionId else nil,
			uprankUnseen = if fFlagAddFriendsPageHighlightUnseenRequests then true else nil
		})
	end)
end