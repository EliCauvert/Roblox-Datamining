local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)

return function(p1) --[[ Line: 28 | Named "useComposedImpressionFilter" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.useCallback(function(p2): boolean --[[ Line: 33 ]]
		-- upvalues: p1 (copy)
		for _, value in p1 do
			if not value(p2) then
				return false
			end
		end
		return true
	end, p1)
end