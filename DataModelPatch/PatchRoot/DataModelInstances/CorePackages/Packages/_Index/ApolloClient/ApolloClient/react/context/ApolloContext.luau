local Parent = script.Parent.Parent.Parent.Parent
local WeakMap = require(Parent.LuauPolyfill).WeakMap
local ReactModule = require(Parent.React)
local _ = require(script.Parent.Parent.Parent.core)
local NewWeakMap = WeakMap.new()

return {
	getApolloContext = function()
		-- upvalues: NewWeakMap (ref), ReactModule (copy)
		local GetResult = NewWeakMap:get(ReactModule.createContext)
		
		if GetResult == nil then
			GetResult = ReactModule.createContext({})
			GetResult.displayName = "ApolloContext"
			NewWeakMap:set(ReactModule.createContext, GetResult)
		end
		return GetResult
	end,
	resetApolloContext = function()
		-- upvalues: NewWeakMap (ref), WeakMap (copy)
		NewWeakMap = WeakMap.new()
	end
}