local gql = require(script:FindFirstAncestor("ApolloFriends").Parent.ApolloClient).gql

return function(p1, p2)
	-- upvalues: gql (ref)
	return p1.cache:writeFragment({
		data = {
			__typename = "Friend",
			displayName = "",
			id = p2.userId,
			targetUserId = p2.targetUserId,
			hasVerifiedBadge = p2.hasVerifiedBadge or false
		},
		fragment = gql("\t\t\tfragment NewFriend on Friend {\n\t\t\t\tid\n\t\t\t\ttargetUserId\n\t\t\t\thasVerifiedBadge\n\t\t\t\tdisplayName\n\t\t\t}\n\t\t")
	})
end