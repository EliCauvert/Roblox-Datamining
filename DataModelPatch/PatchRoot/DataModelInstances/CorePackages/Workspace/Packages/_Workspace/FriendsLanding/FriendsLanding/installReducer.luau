local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local RoduxUserPermissions = DependenciesModule.RoduxUserPermissions
local RoduxAnalytics = DependenciesModule.RoduxAnalytics

return function()
	-- upvalues: Rodux (copy), RoduxUserPermissions (copy), RoduxNetworking (copy), RoduxAnalytics (copy)
	return Rodux.combineReducers({
		DeletedUsers = require(script.DeletedUsers),
		VerifiedUsers = require(script.VerifiedUsers),
		InactiveFriends = require(script.InactiveFriends),
		Users = require(script.Users),
		Friends = require(script.Friends)(),
		Presence = require(script.Presence),
		UserPermissions = RoduxUserPermissions.installReducer(),
		NetworkStatus = RoduxNetworking.installReducer(),
		Analytics = RoduxAnalytics.installReducer()
	})
end