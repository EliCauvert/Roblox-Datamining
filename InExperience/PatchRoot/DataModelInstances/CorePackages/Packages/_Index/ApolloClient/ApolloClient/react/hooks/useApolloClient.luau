local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local GetApolloContextFunction = require(Parent.react.context).getApolloContext
local _ = require(Parent.core)

function useApolloClient() --[[ Line: 21 ]]
	-- upvalues: ReactModule (copy), GetApolloContextFunction (copy), InvariantFunction (copy)
	local Client = ReactModule.useContext(GetApolloContextFunction()).client
	InvariantFunction(Client, "No Apollo Client instance can be found. Please ensure that you have called `ApolloProvider` higher up in your tree.")
	
	return Client
end

return { useApolloClient = useApolloClient }