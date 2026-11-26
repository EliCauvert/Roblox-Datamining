local Parent = script:FindFirstAncestor("FriendRequests").Parent
local FriendsRequestsModule = require(Parent.DataHydration.FriendsRequests)
local FFlagAddFriendsPageKeepAcceptedRequest = require(Parent.SharedFlags).FFlagAddFriendsPageKeepAcceptedRequest

return function(p1)
	-- upvalues: FFlagAddFriendsPageKeepAcceptedRequest (copy), FriendsRequestsModule (copy)
	if not FFlagAddFriendsPageKeepAcceptedRequest then
		FriendsRequestsModule.FriendsRequestsStore.get().removeFriendRequestByUserId(p1)
		
		return
	end
end