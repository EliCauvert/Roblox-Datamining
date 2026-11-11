local ApolloPresence = script:FindFirstAncestor("ApolloPresence")
local Parent = ApolloPresence.Parent
local Fragments = require(Parent.ApolloLocalState).fragments
local CryoModule = require(Parent.Cryo)
local FormattersModule = require(ApolloPresence.Formatters)

return function(p1, p2)
	-- upvalues: CryoModule (copy), FormattersModule (copy), Fragments (copy)
	return (p1.cache:writeFragment({
		data = CryoModule.Dictionary.join({ __typename = "UserPresence" }, FormattersModule.formatUserPresence(p2)),
		fragment = Fragments.userPresenceAllFields
	}))
end