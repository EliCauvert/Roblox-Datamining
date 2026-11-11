local DependenciesModule = require(script:FindFirstAncestor("InviteLinkExpiredModal").dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxGames = DependenciesModule.RoduxGames
local RoduxNetworking = DependenciesModule.RoduxNetworking

return function()
	-- upvalues: Rodux (copy), RoduxGames (copy), RoduxNetworking (copy)
	return Rodux.combineReducers({
		Games = RoduxGames.installReducer(),
		NetworkStatus = RoduxNetworking.installReducer()
	})
end