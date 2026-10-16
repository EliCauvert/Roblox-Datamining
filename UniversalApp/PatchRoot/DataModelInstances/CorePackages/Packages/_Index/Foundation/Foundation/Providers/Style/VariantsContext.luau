local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

function getOrSet(p1, Key, Callback, ...) --[[ Line: 7 ]]
	local v1 = p1[Key]
	
	if not v1 then
		v1 = Callback(...)
		p1[Key] = v1
	end
	return v1
end

function useVariantsState() --[[ Line: 22 ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(p1, p2, Current) --[[ Line: 26 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		if UseRefResult1.current ~= Current then
			table.clear(UseRefResult.current)
			UseRefResult1.current = Current
		end
		return getOrSet(UseRefResult.current, p1, p2, Current)
	end, {})
end

local Context = ReactModule.createContext(nil)

function useVariants(p1, p2, p3) --[[ Line: 39 ]]
	-- upvalues: ReactModule (copy), Context (copy)
	local UseContextResult = ReactModule.useContext(Context)
	
	if UseContextResult == nil then
		error("VariantsContext hasn't been instantiated")
	end
	return UseContextResult(p1, p2, p3)
end

return {
	useVariants = useVariants,
	useVariantsState = useVariantsState,
	Provider = Context.Provider
}