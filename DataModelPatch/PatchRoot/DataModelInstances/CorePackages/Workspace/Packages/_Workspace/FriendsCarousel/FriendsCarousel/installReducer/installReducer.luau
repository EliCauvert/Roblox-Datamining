local DependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local RoduxUserPermissions = DependenciesModule.RoduxUserPermissions
local RoduxAnalytics = DependenciesModule.RoduxAnalytics
local UsersModule = require(script.Parent.Users)
local FriendsModule = require(script.Parent.Friends)
local PresenceModule = require(script.Parent.Presence)
local ShowContactImporterParams = DependenciesModule.ShowContactImporterParams

return function()
	-- upvalues: Rodux (copy), UsersModule (copy), FriendsModule (copy), PresenceModule (copy), RoduxUserPermissions (copy), RoduxNetworking (copy), ShowContactImporterParams (copy), RoduxAnalytics (copy)
	return Rodux.combineReducers({
		Users = UsersModule,
		Friends = FriendsModule,
		Presence = PresenceModule,
		UserPermissions = RoduxUserPermissions.installReducer(),
		NetworkStatus = RoduxNetworking.installReducer(),
		ShowContactImporterParams = ShowContactImporterParams,
		Analytics = RoduxAnalytics.installReducer()
	})
end