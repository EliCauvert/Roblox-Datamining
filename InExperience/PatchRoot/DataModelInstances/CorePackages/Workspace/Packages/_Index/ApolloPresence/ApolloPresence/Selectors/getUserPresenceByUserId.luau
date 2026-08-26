local fragments = require(script:FindFirstAncestor("ApolloPresence").Parent.ApolloLocalState).fragments

return function(p1, p2)
	-- upvalues: fragments (ref)
	return p1.cache:readFragment({
		id = p1.cache:identify({ __typename = "UserPresence", id = p2.userId }),
		fragment = fragments.userPresenceAllFields
	})
end