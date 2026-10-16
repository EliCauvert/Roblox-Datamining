local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local FriendsNetworking = DependenciesModule.FriendsNetworking

return function(p1) --[[ Line: 8 ]]
	-- upvalues: GetDeepValueFunction (copy), FriendsNetworking (copy)
	local DeepValue = GetDeepValueFunction(p1, string.format("FriendsLanding.Friends.byUserId.%s", p1.LocalUserId))
	
	return {
		localUserId = p1.LocalUserId,
		screenSize = p1.ScreenSize,
		inactiveFriendsNetworkRequestStatus = FriendsNetworking.GetInactiveFriends.getStatus(p1, p1.LocalUserId),
		friendRequestCount = GetDeepValueFunction(p1, "FriendsLanding.Friends.requests.receivedCount") or 0,
		totalFriendCount = DeepValue and #DeepValue or 0
	}
end