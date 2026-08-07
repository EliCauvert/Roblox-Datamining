-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local getApolloContext = require(script.Parent.ApolloContext).getApolloContext
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.core.ApolloClient)

function ApolloConsumer(p0) --[[ line: 21 ]]
	-- upvalues: getApolloContext (ref), reactModule (ref), invariant (ref)
	return reactModule.createElement(getApolloContext().Consumer, nil, function(p1) --[[ line: 23 ]]
		-- upvalues: invariant (copy), p0 (ref)
		invariant(p1 and p1.client, "Could not find \"client\" in the context of ApolloConsumer. Wrap the root component in an <ApolloProvider>.")
		
		return p0.children(p1.client)
	end)
end

return { ApolloConsumer = ApolloConsumer }