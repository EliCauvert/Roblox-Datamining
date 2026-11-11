local DependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local RoduxUsers = DependenciesModule.RoduxUsers

return DependenciesModule.convertActions(RoduxUsers.installReducer(), DependenciesModule.usersActionAdaptor(RoduxUsers), { byUserId = {}, byUsername = {} })