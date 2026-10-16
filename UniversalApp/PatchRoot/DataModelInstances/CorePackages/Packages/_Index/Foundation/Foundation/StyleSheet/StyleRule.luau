local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return ReactModule.memo(function(p1) --[[ Line: 13 | Named "StyleRule" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("StyleRule", {
		Priority = p1.Priority or 1,
		Selector = p1.Selector,
		ref = ReactModule.useCallback(function(StyleRule) --[[ Line: 14 ]]
			-- upvalues: p1 (copy)
			if StyleRule ~= nil then
				StyleRule:SetProperties(p1.properties)
			end
		end, { p1.properties })
	})
end)