local Fragments = require(script:FindFirstAncestor("ApolloPresence").Parent.ApolloLocalState).fragments

return function(p1, p2) --[[ Line: 11 | Named "getUserPresenceByUserId" ]]
	-- upvalues: Fragments (copy)
	return (p1.cache:readFragment({
		id = p1.cache:identify({ __typename = "UserPresence", id = p2.userId }),
		fragment = Fragments.userPresenceAllFields
	}))
end