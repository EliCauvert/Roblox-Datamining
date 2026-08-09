local dependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local roduxUserPermissions = dependenciesModule.RoduxUserPermissions
local roduxAnalytics = dependenciesModule.RoduxAnalytics
local usersModule = require(script.Parent.Users)
local friendsModule = require(script.Parent.Friends)
local presenceModule = require(script.Parent.Presence)
local showContactImporterParams = dependenciesModule.ShowContactImporterParams

return function() --[[ line: 15 ]]
	-- upvalues: rodux (ref), usersModule (ref), friendsModule (ref), presenceModule (ref), roduxUserPermissions (ref), roduxNetworking (ref), showContactImporterParams (ref), roduxAnalytics (ref)
	return rodux.combineReducers({
		Users = usersModule,
		Friends = friendsModule,
		Presence = presenceModule,
		UserPermissions = roduxUserPermissions.installReducer(),
		NetworkStatus = roduxNetworking.installReducer(),
		ShowContactImporterParams = showContactImporterParams,
		Analytics = roduxAnalytics.installReducer()
	})
end