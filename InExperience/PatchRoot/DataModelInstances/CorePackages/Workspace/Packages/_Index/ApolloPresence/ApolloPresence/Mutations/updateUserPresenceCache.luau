local apolloPresence = script:FindFirstAncestor("ApolloPresence")
local fragments = require(apolloPresence.Parent.ApolloLocalState).fragments
local formattersModule = require(apolloPresence.Formatters)

return function(p0, p1)
	-- upvalues: fragments (ref), formattersModule (ref)
	return p0.cache:writeFragment({
		id = p0.cache:identify({ __typename = "UserPresence", id = p1.id }),
		fragment = fragments.userPresenceAllFields,
		data = formattersModule.formatUserPresence(p1)
	})
end