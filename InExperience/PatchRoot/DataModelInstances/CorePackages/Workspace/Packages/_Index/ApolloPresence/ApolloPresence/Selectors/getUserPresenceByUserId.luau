local fragments = require(script:FindFirstAncestor("ApolloPresence").Parent.ApolloLocalState).fragments

return function(p0, p1) --[[ line: 11 | named "getUserPresenceByUserId" ]]
	-- upvalues: fragments (ref)
	return p0.cache:readFragment({
		id = p0.cache:identify({ __typename = "UserPresence", id = p1.userId }),
		fragment = fragments.userPresenceAllFields
	})
end