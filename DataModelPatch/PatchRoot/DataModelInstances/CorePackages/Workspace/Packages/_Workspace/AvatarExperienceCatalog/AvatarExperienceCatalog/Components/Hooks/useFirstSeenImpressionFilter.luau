local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = {}
	end, { p1 })
	
	return ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current[p2] then
			return false
		else
			UseRefResult.current[p2] = true
			
			return true
		end
	end, {})
end