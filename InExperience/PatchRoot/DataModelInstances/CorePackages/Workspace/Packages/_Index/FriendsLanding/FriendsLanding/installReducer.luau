local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking

return function()
	-- upvalues: rodux (ref), roduxNetworking (ref)
	return rodux.combineReducers({
		Friends = require(script.Friends)(),
		NetworkStatus = roduxNetworking.installReducer()
	})
end