-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.LuauPolyfill)
local reactModule = require(parent_1.React)
local getApolloContext = require(script.Parent.ApolloContext).getApolloContext
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.core.ApolloClient)

function ApolloProvider(p0) --[[ line: 29 ]]
	-- upvalues: getApolloContext (ref), reactModule (ref), invariant (ref)
	local var1 = getApolloContext()
	
	return reactModule.createElement(var1.Consumer, nil, function(p1) --[[ line: 31 ]]
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