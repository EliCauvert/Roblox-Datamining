local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.useCallback(function(p2): boolean
		-- upvalues: p1 (copy)
		for _, value in p1 do
			if not value(p2) then
				return false
			end
		end
		return true
	end, p1)
end