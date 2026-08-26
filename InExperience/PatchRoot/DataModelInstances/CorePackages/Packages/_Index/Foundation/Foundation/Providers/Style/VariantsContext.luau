local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

function getOrSet(value, p1, p2, ...)
	local var1 = value[p1]
	
	if not var1 then
		var1 = p2(...)
		value[p1] = var1
	end
	return var1
end

function useVariantsState()
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: var2 (ref), var1 (ref)
		if var2.current ~= p3 then
			table.clear(var1.current)
			var2.current = p3
		end
		return getOrSet(var1.current, p1, p2, p3)
	end, {})
end

local var1 = reactModule.createContext(nil)

function useVariants(p1, p2, p3)
	-- upvalues: reactModule (ref), var1 (ref)
	local var2 = reactModule.useContext(var1)
	
	if var2 == nil then
		error("VariantsContext hasn't been instantiated")
	end
	return var2(p1, p2, p3)
end

return {
	useVariants = useVariants,
	useVariantsState = useVariantsState,
	Provider = var1.Provider
}