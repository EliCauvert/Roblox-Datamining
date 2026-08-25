local apolloPresence = script:FindFirstAncestor("ApolloPresence")
local parent = apolloPresence.Parent
local fragments = require(parent.ApolloLocalState).fragments
local cryoModule = require(parent.Cryo)
local formattersModule = require(apolloPresence.Formatters)

return function(p0, p1)
	-- upvalues: cryoModule (ref), formattersModule (ref), fragments (ref)
	return p0.cache:writeFragment({
		data = cryoModule.Dictionary.join({ __typename = "UserPresence" }, formattersModule.formatUserPresence(p1)),
		fragment = fragments.userPresenceAllFields
	})
end