local DependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local RoduxFriends = DependenciesModule.RoduxFriends

return DependenciesModule.convertActions(RoduxFriends.installReducer(), DependenciesModule.friendsActionAdaptor(RoduxFriends), {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0, newFriendRequestsCount = 0 },
	recommendations = {},
	friendshipStatus = {},
	friendsRankByUserId = {}
})