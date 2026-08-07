-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local weakMap = require(parent.LuauPolyfill).WeakMap
local reactModule = require(parent.React)
local _ = require(script.Parent.Parent.Parent.core)
local var1 = weakMap.new()

return {
	getApolloContext = function() --[[ line: 33 ]]
		-- upvalues: var1 (write), reactModule (ref)
		local createContext = var1:get(reactModule.createContext)
		
		if createContext == nil then
			createContext = reactModule.createContext({})
			createContext.displayName = "ApolloContext"
			var1:set(reactModule.createContext, createContext)
		end
		return createContext
	end,
	resetApolloContext = function() --[[ line: 45 ]]
		-- upvalues: var1 (write), weakMap (ref)
		var1 = weakMap.new()
	end
}