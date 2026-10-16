local ApolloPresence = script:FindFirstAncestor("ApolloPresence")
local Fragments = require(ApolloPresence.Parent.ApolloLocalState).fragments
local FormattersModule = require(ApolloPresence.Formatters)

return function(p1, p2) --[[ Line: 9 | Named "updateUserPresenceCache" ]]
	-- upvalues: Fragments (copy), FormattersModule (copy)
	return (p1.cache:writeFragment({
		id = p1.cache:identify({ __typename = "UserPresence", id = p2.id }),
		fragment = Fragments.userPresenceAllFields,
		data = FormattersModule.formatUserPresence(p2)
	}))
end