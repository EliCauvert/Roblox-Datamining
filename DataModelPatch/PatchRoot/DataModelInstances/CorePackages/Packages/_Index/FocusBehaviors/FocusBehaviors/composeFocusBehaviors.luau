local _ = require(script.Parent.Parent.FocusNavigation)

return function(...)
	local list = { ... }
	
	return {
		onDescendantFocusChanged = function(p1)
			-- upvalues: list (copy)
			for _, value in list do
				if value.onDescendantFocusChanged then
					value.onDescendantFocusChanged(p1)
				end
			end
		end,
		getTargets = function()
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