local dependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local friendsModule = require(script.Parent.Friends)

return function() --[[ line: 9 ]]
	-- upvalues: rodux (ref), friendsModule (ref), roduxNetworking (ref)
	return rodux.combineReducers({
		Friends = friendsModule,
		NetworkStatus = roduxNetworking.installReducer()
	})
end