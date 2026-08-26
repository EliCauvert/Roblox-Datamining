local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local friendsNetworking = dependenciesModule.FriendsNetworking

return function(p1)
	-- upvalues: getDeepValue (ref), friendsNetworking (ref)
	local var1 = getDeepValue(p1, string.format("FriendsLanding.Friends.byUserId.%s", p1.LocalUserId))
	
	return {
		localUserId = p1.LocalUserId,
		screenSize = p1.ScreenSize,
		inactiveFriendsNetworkRequestStatus = friendsNetworking.GetInactiveFriends.getStatus(p1, p1.LocalUserId),
		friendRequestCount = getDeepValue(p1, "FriendsLanding.Friends.requests.receivedCount") or 0,
		totalFriendCount = if var1 then #var1 else 0
	}
end