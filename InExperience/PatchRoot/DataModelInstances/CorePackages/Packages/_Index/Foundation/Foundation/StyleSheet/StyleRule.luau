local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("StyleRule", {
		Priority = p1.Priority or 1,
		Selector = p1.Selector,
		ref = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref)
			if p2 ~= nil then
				p2:SetProperties(p1.properties)
			end
		end, { p1.properties })
	})
end)