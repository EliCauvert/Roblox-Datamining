local apolloPresence = script:FindFirstAncestor("ApolloPresence")
local parent = apolloPresence.Parent
local fragments = require(parent.ApolloLocalState).fragments
local cryoModule = require(parent.Cryo)
local formattersModule = require(apolloPresence.Formatters)

return function(p1, p2)
	-- upvalues: cryoModule (ref), formattersModule (ref), fragments (ref)
	return p1.cache:writeFragment({
		data = cryoModule.Dictionary.join({ __typename = "UserPresence" }, formattersModule.formatUserPresence(p2)),
		fragment = fragments.userPresenceAllFields
	})
end