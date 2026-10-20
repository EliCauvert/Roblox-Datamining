local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local GetApolloContextFunction = require(script.Parent.ApolloContext).getApolloContext
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local _ = require(Parent.core.ApolloClient)

function ApolloConsumer(p1)
	-- upvalues: GetApolloContextFunction (copy), ReactModule (copy), InvariantFunction (copy)
	return ReactModule.createElement(GetApolloContextFunction().Consumer, nil, function(p2)
		-- upvalues: InvariantFunction (upval), p1 (copy)
		InvariantFunction(p2 and p2.client, "Could not find \"client\" in the context of ApolloConsumer. Wrap the root component in an <ApolloProvider>.")
		
		return p1.children(p2.client)
	end)
end

return { ApolloConsumer = ApolloConsumer }