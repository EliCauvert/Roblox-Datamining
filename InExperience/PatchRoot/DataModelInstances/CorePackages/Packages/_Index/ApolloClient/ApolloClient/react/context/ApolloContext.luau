local parent = script.Parent.Parent.Parent.Parent
local weakMap = require(parent.LuauPolyfill).WeakMap
local reactModule = require(parent.React)
local _ = require(script.Parent.Parent.Parent.core)
local var1 = weakMap.new()

return {
	getApolloContext = function()
		-- upvalues: var1 (write), reactModule (ref)
		local createContext = var1:get(reactModule.createContext)
		
		if createContext == nil then
			createContext = reactModule.createContext({})
			createContext.displayName = "ApolloContext"
			var1:set(reactModule.createContext, createContext)
		end
		return createContext
	end,
	resetApolloContext = function()
		-- upvalues: var1 (write), weakMap (ref)
		var1 = weakMap.new()
	end
}