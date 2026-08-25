local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.LuauPolyfill)
local reactModule = require(parent_1.React)
local getApolloContext = require(script.Parent.ApolloContext).getApolloContext
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.core.ApolloClient)

function ApolloProvider(p0)
	-- upvalues: getApolloContext (ref), reactModule (ref), invariant (ref)
	local var1 = getApolloContext()
	
	return reactModule.createElement(var1.Consumer, nil, function(p1)
		-- upvalues: p0 (ref), invariant (copy), reactModule (copy), var1 (ref)
		if p1 == nil then
			p1 = {}
		end
		if p0.client and p1.client ~= p0.client then
			p1.client = p0.client
		end
		invariant(p1.client, "ApolloProvider was not passed a client instance. Make sure you pass in your client via the \"client\" prop.")
		
		return reactModule.createElement(var1.Provider, { value = p1 }, p0.children)
	end)
end

return { ApolloProvider = ApolloProvider }