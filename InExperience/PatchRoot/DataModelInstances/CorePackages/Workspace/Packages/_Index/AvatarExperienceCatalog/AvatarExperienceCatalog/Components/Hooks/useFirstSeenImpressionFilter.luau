local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.current = {}
	end, { p1 })
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		if var1.current[p2] then
			return false
		end
		var1.current[p2] = true
		
		return true
	end, {})
end