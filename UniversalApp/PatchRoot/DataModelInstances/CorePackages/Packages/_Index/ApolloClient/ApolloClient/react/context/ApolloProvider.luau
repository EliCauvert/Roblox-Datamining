local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.LuauPolyfill)
local reactModule = require(parent_1.React)
local getApolloContext = require(script.Parent.ApolloContext).getApolloContext
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.core.ApolloClient)

function ApolloProvider(p1)
	-- upvalues: getApolloContext (ref), reactModule (ref), invariant (ref)
	local var1 = getApolloContext()
	
	return reactModule.createElement(var1.Consumer, nil, function(p2)
		-- upvalues: p1 (ref), invariant (copy), reactModule (copy), var1 (ref)
		if p2 == nil then
			p2 = {}
		end
		if p1.client and p2.client ~= p1.client then
			p2.client = p1.client
		end
		invariant(p2.client, "ApolloProvider was not passed a client instance. Make sure you pass in your client via the \"client\" prop.")
		
		return reactModule.createElement(var1.Provider, { value = p2 }, p1.children)
	end)
end

return { ApolloProvider = ApolloProvider }