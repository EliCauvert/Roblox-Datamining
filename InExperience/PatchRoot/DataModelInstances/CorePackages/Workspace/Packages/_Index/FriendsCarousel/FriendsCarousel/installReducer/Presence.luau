local dependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local roduxPresence = dependenciesModule.RoduxPresence

return dependenciesModule.convertActions(roduxPresence.installReducer(), dependenciesModule.presenceActionAdaptor(roduxPresence), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})