local appNavBarModule = require(script:FindFirstAncestor("Moments").Parent.AppNavBar)

return function(p1)
	-- upvalues: appNavBarModule (ref)
	p1 = p1 or {}
	local visibilityControl = p1.visibilityControl or appNavBarModule.VisibilityControl
	local var1 = (p1.isScrollAwayEnabled or appNavBarModule.getScrollAwayEnabled)()
	
	return {
		isEnabled = var1,
		setVisible = function(value)
			-- upvalues: var1 (ref), visibilityControl (ref)
			if not var1 then return end
			if value then
				visibilityControl.show()
				
				return
			end
			visibilityControl.hide()
		end,
		dispose = function()
			-- upvalues: var1 (ref), visibilityControl (ref)
			if var1 then
				visibilityControl.show()
				
				return
			end
		end
	}
end