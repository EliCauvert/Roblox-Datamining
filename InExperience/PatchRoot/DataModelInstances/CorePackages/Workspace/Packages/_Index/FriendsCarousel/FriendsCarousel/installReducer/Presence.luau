local friendsCarousel = script:FindFirstAncestor("FriendsCarousel")

if require(friendsCarousel.Parent.SharedFlags).FFlagFriendsCarouselDeprecateUnusedReducers then
	return nil
end
local dependenciesModule = require(friendsCarousel.dependencies)
local roduxPresence = dependenciesModule.RoduxPresence

return dependenciesModule.convertActions(roduxPresence.installReducer(), dependenciesModule.presenceActionAdaptor(roduxPresence), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})