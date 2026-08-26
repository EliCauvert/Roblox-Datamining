local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local getApolloContext = require(script.Parent.ApolloContext).getApolloContext
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.core.ApolloClient)

function ApolloConsumer(p1)
	-- upvalues: getApolloContext (ref), reactModule (ref), invariant (ref)
	return reactModule.createElement(getApolloContext().Consumer, nil, function(p2)
		-- upvalues: invariant (copy), p1 (ref)
		invariant(p2 and p2.client, "Could not find \"client\" in the context of ApolloConsumer. Wrap the root component in an <ApolloProvider>.")
		
		return p1.children(p2.client)
	end)
end

return { ApolloConsumer = ApolloConsumer }