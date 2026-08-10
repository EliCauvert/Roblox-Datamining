local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local fFlagFriendsLandingDeprecateUnusedMapToUsersModule = require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers)

return function() --[[ line: 10 ]]
	-- upvalues: rodux (ref), fFlagFriendsLandingDeprecateUnusedMapToUsersModule (ref), dependenciesModule (ref), roduxNetworking (ref)
	return rodux.combineReducers({
		DeletedUsers = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else require(script.DeletedUsers),
		VerifiedUsers = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else require(script.VerifiedUsers),
		InactiveFriends = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else require(script.InactiveFriends),
		Users = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else require(script.Users),
		Friends = require(script.Friends)(),
		Presence = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else require(script.Presence),
		UserPermissions = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else dependenciesModule.RoduxUserPermissions.installReducer(),
		NetworkStatus = roduxNetworking.installReducer(),
		Analytics = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else dependenciesModule.RoduxAnalytics.installReducer()
	})
end