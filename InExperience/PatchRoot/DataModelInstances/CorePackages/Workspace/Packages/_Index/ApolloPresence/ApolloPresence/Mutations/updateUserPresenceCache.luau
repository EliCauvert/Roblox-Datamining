local apolloPresence = script:FindFirstAncestor("ApolloPresence")
local fragments = require(apolloPresence.Parent.ApolloLocalState).fragments
local formattersModule = require(apolloPresence.Formatters)

return function(p1, p2)
	-- upvalues: fragments (ref), formattersModule (ref)
	return p1.cache:writeFragment({
		id = p1.cache:identify({ __typename = "UserPresence", id = p2.id }),
		fragment = fragments.userPresenceAllFields,
		data = formattersModule.formatUserPresence(p2)
	})
end