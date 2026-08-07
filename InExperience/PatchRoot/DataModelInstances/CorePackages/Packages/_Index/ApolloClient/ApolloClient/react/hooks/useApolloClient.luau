local parent = script.Parent.Parent.Parent
local t = { useApolloClient = useApolloClient }
local reactModule = require(parent.Parent.React)
local invariant = require(parent.jsutils.invariant).invariant
local getApolloContext = require(parent.react.context).getApolloContext
local _ = require(parent.core)

function useApolloClient() --[[ line: 21 ]]
	-- upvalues: reactModule (ref), getApolloContext (ref), invariant (ref)
	local client = reactModule.useContext(getApolloContext()).client
	invariant(client, "No Apollo Client instance can be found. Please ensure that you have called `ApolloProvider` higher up in your tree.")
	
	return client
end

return t