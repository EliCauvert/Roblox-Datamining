local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		for i, v in p1 do
			if not v(p2) then
				return false
			end
		end
		return true
	end, p1)
end