local AppNavBarModule = require(script:FindFirstAncestor("Moments").Parent.AppNavBar)

return function(p1)
	-- upvalues: AppNavBarModule (copy)
	local P0 = p1 or {}
	local VisibilityControl = P0.visibilityControl or AppNavBarModule.VisibilityControl
	local IsEnabled = (P0.isScrollAwayEnabled or AppNavBarModule.getScrollAwayEnabled)()
	
	return {
		isEnabled = IsEnabled,
		setVisible = function(p2)
			-- upvalues: IsEnabled (copy), VisibilityControl (copy)
			if not IsEnabled then return end
			if p2 then
				VisibilityControl.show()
				
				return
			else
				VisibilityControl.hide()
			end
		end,
		dispose = function()
			-- upvalues: IsEnabled (copy), VisibilityControl (copy)
			if IsEnabled then
				VisibilityControl.show()
				
				return
			end
		end,
		followDrag = function(p2)
			-- upvalues: VisibilityControl (copy), IsEnabled (copy)
			local OnTouchMovedFunction: (any) -> () = VisibilityControl.onTouchMoved
			
			if IsEnabled and OnTouchMovedFunction ~= nil then
				OnTouchMovedFunction(p2)
			end
		end
	}
end