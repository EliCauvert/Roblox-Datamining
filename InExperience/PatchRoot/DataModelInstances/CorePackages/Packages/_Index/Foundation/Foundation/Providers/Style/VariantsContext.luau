local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

function getOrSet(value, p0, p1, ...) --[[ line: 7 ]]
	local var2 = value[p0]
	
	if not var2 then
		var2 = p1(...)
		value[p0] = var2
	end
	return var2
end

function useVariantsState() --[[ line: 22 ]]
	-- upvalues: reactModule (ref)
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p2, p3, p4) --[[ line: 26 ]]
		-- upvalues: var4 (ref), var3 (ref)
		if var4.current ~= p4 then
			table.clear(var3.current)
			var4.current = p4
		end
		return getOrSet(var3.current, p2, p3, p4)
	end, {})
end

local var1 = reactModule.createContext(nil)

function useVariants(p5, p6, p7) --[[ line: 39 ]]
	-- upvalues: reactModule (ref), var1 (ref)
	local var5 = reactModule.useContext(var1)
	
	if var5 == nil then
		error("VariantsContext hasn't been instantiated")
	end
	return var5(p5, p6, p7)
end

return {
	useVariants = useVariants,
	useVariantsState = useVariantsState,
	Provider = var1.Provider
}