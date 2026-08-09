local mapToUsersModule = require(script:FindFirstAncestor("FriendsLanding").Friends.mapToUsers)

return function(p0, _) --[[ line: 4 ]]
	-- upvalues: mapToUsersModule (ref)
	return {
		localUserId = p0.LocalUserId,
		friends = mapToUsersModule(p0)(p0.LocalUserId)
	}
end