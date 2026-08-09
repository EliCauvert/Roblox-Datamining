local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local roduxUserPermissions = dependenciesModule.RoduxUserPermissions
local roduxAnalytics = dependenciesModule.RoduxAnalytics

return function() --[[ line: 9 ]]
	-- upvalues: rodux (ref), roduxUserPermissions (ref), roduxNetworking (ref), roduxAnalytics (ref)
	return rodux.combineReducers({
		DeletedUsers = require(script.DeletedUsers),
		VerifiedUsers = require(script.VerifiedUsers),
		InactiveFriends = require(script.InactiveFriends),
		Users = require(script.Users),
		Friends = require(script.Friends)(),
		Presence = require(script.Presence),
		UserPermissions = roduxUserPermissions.installReducer(),
		NetworkStatus = roduxNetworking.installReducer(),
		Analytics = roduxAnalytics.installReducer()
	})
end