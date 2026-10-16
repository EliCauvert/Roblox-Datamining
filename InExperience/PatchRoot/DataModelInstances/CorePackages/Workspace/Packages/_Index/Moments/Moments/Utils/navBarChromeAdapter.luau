local AppNavBarModule = require(script:FindFirstAncestor("Moments").Parent.AppNavBar)

return function(p1) --[[ Line: 50 | Named "createNavBarChromeAdapter" ]]
	-- upvalues: AppNavBarModule (copy)
	local P0 = p1 or {}
	local VisibilityControl = P0.visibilityControl or AppNavBarModule.VisibilityControl
	local IsEnabled = (P0.isScrollAwayEnabled or AppNavBarModule.getScrollAwayEnabled)()
	
	return {
		isEnabled = IsEnabled,
		setVisible = function(p2) --[[ Line: 61 ]]
			-- upvalues: IsEnabled (copy), VisibilityControl (copy)
			if not IsEnabled then return end
			if p2 then
				VisibilityControl.show()
				
				return
			else
				VisibilityControl.hide()
			end
		end,
		dispose = function() --[[ Line: 72 ]]
			-- upvalues: IsEnabled (copy), VisibilityControl (copy)
			if IsEnabled then
				VisibilityControl.show()
				
				return
			end
		end
	}
end