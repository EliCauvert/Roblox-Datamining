local dependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local roduxFriends = dependenciesModule.RoduxFriends

return dependenciesModule.convertActions(roduxFriends.installReducer(), dependenciesModule.friendsActionAdaptor(roduxFriends), {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0, newFriendRequestsCount = 0 },
	recommendations = {},
	friendshipStatus = {},
	friendsRankByUserId = {}
})