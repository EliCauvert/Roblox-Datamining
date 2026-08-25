local gql = require(script:FindFirstAncestor("ApolloFriends").Parent.ApolloClient).gql

return function(p0, p1)
	-- upvalues: gql (ref)
	return p0.cache:writeFragment({
		data = {
			__typename = "Friend",
			displayName = "",
			id = p1.userId,
			targetUserId = p1.targetUserId,
			hasVerifiedBadge = p1.hasVerifiedBadge or false
		},
		fragment = gql("\t\t\tfragment NewFriend on Friend {\n\t\t\t\tid\n\t\t\t\ttargetUserId\n\t\t\t\thasVerifiedBadge\n\t\t\t\tdisplayName\n\t\t\t}\n\t\t")
	})
end