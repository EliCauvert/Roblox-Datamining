local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking

return function()
	-- upvalues: Rodux (copy), RoduxNetworking (copy)
	return Rodux.combineReducers({
		Friends = require(script.Friends)(),
		NetworkStatus = RoduxNetworking.installReducer()
	})
end