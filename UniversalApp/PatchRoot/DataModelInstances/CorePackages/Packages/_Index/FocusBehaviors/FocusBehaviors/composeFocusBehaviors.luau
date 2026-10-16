local _ = require(script.Parent.Parent.FocusNavigation)

return function(...) --[[ Line: 5 | Named "composeFocusBehaviors" ]]
	local list = { ... }
	
	return {
		onDescendantFocusChanged = function(p1) --[[ Line: 8 ]]
			-- upvalues: list (copy)
			for _, value in list do
				if value.onDescendantFocusChanged then
					value.onDescendantFocusChanged(p1)
				end
			end
		end,
		getTargets = function() --[[ Line: 15 ]]
			-- upvalues: list (copy)
			local List = {}
			
			for _, value in list do
				for _, value1 in value.getTargets() do
					table.insert(List, value1)
				end
			end
			return List
		end
	}
end