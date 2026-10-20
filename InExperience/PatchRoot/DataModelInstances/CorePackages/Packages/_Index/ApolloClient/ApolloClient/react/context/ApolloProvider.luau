local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.LuauPolyfill)
local ReactModule = require(Parent1.React)
local GetApolloContextFunction = require(script.Parent.ApolloContext).getApolloContext
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local _ = require(Parent.core.ApolloClient)

function ApolloProvider(p1)
	-- upvalues: GetApolloContextFunction (copy), ReactModule (copy), InvariantFunction (copy)
	local ApolloContext = GetApolloContextFunction()
	
	return ReactModule.createElement(ApolloContext.Consumer, nil, function(Value)
		-- upvalues: p1 (copy), InvariantFunction (upval), ReactModule (upval), ApolloContext (copy)
		if Value == nil then
			Value = {}
		end
		if p1.client and Value.client ~= p1.client then
			Value.client = p1.client
		end
		InvariantFunction(Value.client, "ApolloProvider was not passed a client instance. Make sure you pass in your client via the \"client\" prop.")
		
		return ReactModule.createElement(ApolloContext.Provider, { value = Value }, p1.children)
	end)
end

return { ApolloProvider = ApolloProvider }