local friendsCarousel = script:FindFirstAncestor("FriendsCarousel")

if require(friendsCarousel.Parent.SharedFlags).FFlagFriendsCarouselDeprecateUnusedReducers then
	return nil
end
local dependenciesModule = require(friendsCarousel.dependencies)
local roduxUsers = dependenciesModule.RoduxUsers

return dependenciesModule.convertActions(roduxUsers.installReducer(), dependenciesModule.usersActionAdaptor(roduxUsers), { byUserId = {}, byUsername = {} })