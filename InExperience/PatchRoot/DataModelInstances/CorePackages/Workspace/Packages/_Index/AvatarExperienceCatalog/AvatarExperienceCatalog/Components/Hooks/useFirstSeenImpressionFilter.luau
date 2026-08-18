local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)

return function(p0) --[[ line: 24 | named "useFirstSeenImpressionFilter" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: var1 (ref)
		var1.current = {}
	end, { p0 })
	
	return reactModule.useCallback(function(p1) --[[ line: 31 ]]
		-- upvalues: var1 (ref)
		if var1.current[p1] then
			return false
		end
		var1.current[p1] = true
		
		return true
	end, {})
end