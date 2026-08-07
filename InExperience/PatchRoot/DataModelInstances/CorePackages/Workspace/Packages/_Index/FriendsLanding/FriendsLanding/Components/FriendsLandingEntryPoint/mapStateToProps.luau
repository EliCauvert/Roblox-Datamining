local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local friendsNetworking = dependenciesModule.FriendsNetworking

return function(p0) --[[ line: 8 ]]
	-- upvalues: getDeepValue (ref), friendsNetworking (ref)
	local var1 = getDeepValue(p0, string.format("FriendsLanding.Friends.byUserId.%s", p0.LocalUserId))
	
	return {
		localUserId = p0.LocalUserId,
		screenSize = p0.ScreenSize,
		inactiveFriendsNetworkRequestStatus = friendsNetworking.GetInactiveFriends.getStatus(p0, p0.LocalUserId),
		friendRequestCount = getDeepValue(p0, "FriendsLanding.Friends.requests.receivedCount") or 0,
		totalFriendCount = if var1 then #var1 else 0
	}
end