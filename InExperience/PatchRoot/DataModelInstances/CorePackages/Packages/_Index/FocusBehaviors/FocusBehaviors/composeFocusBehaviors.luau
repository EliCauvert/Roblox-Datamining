local _ = require(script.Parent.Parent.FocusNavigation)

return function(...)
	local list = { ... }
	
	return {
		onDescendantFocusChanged = function(p1)
			-- upvalues: list (ref)
			for i, v in list do
				if v.onDescendantFocusChanged then
					v.onDescendantFocusChanged(p1)
				end
			end
		end,
		getTargets = function()
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