local dependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local roduxUsers = dependenciesModule.RoduxUsers

return dependenciesModule.convertActions(roduxUsers.installReducer(), dependenciesModule.usersActionAdaptor(roduxUsers), { byUserId = {}, byUsername = {} })