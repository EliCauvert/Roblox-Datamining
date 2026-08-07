local _ = require(script.Parent.Parent.FocusNavigation)

return function(...) --[[ line: 5 | named "composeFocusBehaviors" ]]
	local list = { ... }
	
	return {
		onDescendantFocusChanged = function(p0) --[[ line: 8 ]]
			-- upvalues: list (ref)
			for i, v in list do
				if v.onDescendantFocusChanged then
					v.onDescendantFocusChanged(p0)
				end
			end
		end,
		getTargets = function() --[[ line: 15 ]]
			-- upvalues: list (ref)
			local t = {}
			
			for i, v in list do
				for i_1, v_1 in v.getTargets() do
					table.insert(t, v_1)
				end
			end
			return t
		end
	}
end