local DependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local RoduxPresence = DependenciesModule.RoduxPresence

return DependenciesModule.convertActions(RoduxPresence.installReducer(), DependenciesModule.presenceActionAdaptor(RoduxPresence), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})