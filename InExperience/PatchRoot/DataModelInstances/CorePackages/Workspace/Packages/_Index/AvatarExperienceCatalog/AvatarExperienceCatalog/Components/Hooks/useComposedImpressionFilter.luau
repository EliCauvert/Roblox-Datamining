local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)

return function(p0) --[[ line: 27 | named "useComposedImpressionFilter" ]]
	-- upvalues: reactModule (ref)
	return reactModule.useCallback(function(p1) --[[ line: 32 ]]
		-- upvalues: p0 (ref)
		for i, v in p0 do
			if not v(p1) then
				return false
			end
		end
		return true
	end, p0)
end