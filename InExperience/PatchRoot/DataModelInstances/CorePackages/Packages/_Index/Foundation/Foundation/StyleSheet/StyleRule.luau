local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("StyleRule", {
		Priority = p0.Priority or 1,
		Selector = p0.Selector,
		ref = reactModule.useCallback(function(p1)
			-- upvalues: p0 (ref)
			if p1 ~= nil then
				p1:SetProperties(p0.properties)
			end
		end, { p0.properties })
	})
end)