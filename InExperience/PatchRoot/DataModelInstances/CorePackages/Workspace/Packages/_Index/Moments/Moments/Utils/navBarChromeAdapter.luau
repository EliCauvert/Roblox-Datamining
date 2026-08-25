local appNavBarModule = require(script:FindFirstAncestor("Moments").Parent.AppNavBar)

return function(p0)
	-- upvalues: appNavBarModule (ref)
	p0 = p0 or {}
	local visibilityControl = p0.visibilityControl or appNavBarModule.VisibilityControl
	local var3 = (p0.isScrollAwayEnabled or appNavBarModule.getScrollAwayEnabled)()
	
	return {
		isEnabled = var3,
		setVisible = function(value)
			-- upvalues: var3 (ref), visibilityControl (ref)
			if not var3 then return end
			if value then
				visibilityControl.show()
				
				return
			end
			visibilityControl.hide()
		end,
		dispose = function()
			-- upvalues: var3 (ref), visibilityControl (ref)
			if var3 then
				visibilityControl.show()
				
				return
			end
		end
	}
end