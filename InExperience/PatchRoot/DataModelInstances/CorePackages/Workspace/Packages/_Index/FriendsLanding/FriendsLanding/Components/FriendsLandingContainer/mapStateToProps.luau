local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local mapToUsersModule = require(friendsLanding.Friends.mapToUsers)
local fFlagFriendsLandingDeprecateUnusedMapToUsersModule = require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers)

return function(p0, _) --[[ line: 7 ]]
	-- upvalues: fFlagFriendsLandingDeprecateUnusedMapToUsersModule (ref), mapToUsersModule (ref)
	return {
		localUserId = p0.LocalUserId,
		friends = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else mapToUsersModule(p0)(p0.LocalUserId)
	}
end