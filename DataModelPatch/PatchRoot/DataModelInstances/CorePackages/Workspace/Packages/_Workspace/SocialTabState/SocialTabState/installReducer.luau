local DependenciesModule = require(script:FindFirstAncestor("SocialTabState").dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local ShowContactImporterParams = DependenciesModule.ShowContactImporterParams

return function()
	-- upvalues: Rodux (copy), ShowContactImporterParams (copy), RoduxNetworking (copy)
	return Rodux.combineReducers({
		Users = require(script.Users),
		Friends = require(script.Friends),
		Presence = require(script.Presence),
		PremiumByUserId = require(script.PremiumByUserId),
		ShowContactImporterParams = ShowContactImporterParams,
		NetworkStatus = RoduxNetworking.installReducer(),
		UnreadConversationCount = require(script.UnreadConversationCount)
	})
end