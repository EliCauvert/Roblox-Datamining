local MapToUsersModule = require(script:FindFirstAncestor("FriendsLanding").Friends.mapToUsers)

return function(p1, _)
	-- upvalues: MapToUsersModule (copy)
	return {
		localUserId = p1.LocalUserId,
		friends = MapToUsersModule(p1)(p1.LocalUserId)
	}
end