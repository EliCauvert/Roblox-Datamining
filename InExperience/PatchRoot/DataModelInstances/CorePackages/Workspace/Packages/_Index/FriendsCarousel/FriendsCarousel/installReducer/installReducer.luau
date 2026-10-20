local DependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local FriendsModule = require(script.Parent.Friends)

return function()
	-- upvalues: Rodux (copy), FriendsModule (copy), RoduxNetworking (copy)
	return Rodux.combineReducers({
		Friends = FriendsModule,
		NetworkStatus = RoduxNetworking.installReducer()
	})
end