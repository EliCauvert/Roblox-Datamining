local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local AppNavBarModule = require(Parent.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local GetScrollAwayEnabledFunction = AppNavBarModule.getScrollAwayEnabled

return function(p1)
	-- upvalues: GetScrollAwayEnabledFunction (copy), ReactModule (copy), VisibilityControl (copy)
	local ScrollAwayEnabled = p1.enabled == true and GetScrollAwayEnabledFunction()
	
	return ReactModule.useMemo(function()
		-- upvalues: ScrollAwayEnabled (copy), ReactModule (upval), p1 (copy), VisibilityControl (upval)
		return if ScrollAwayEnabled then ReactModule.joinBindings({
			size = p1.sizeBinding,
			ratio = VisibilityControl.getHeaderBinding()
		}):map(function(p2): UDim2
			return UDim2.new(0, 0, 0, (p2.ratio - 1) * p2.size.Y.Offset)
		end) else UDim2.fromOffset(0, 0)
	end, { p1.sizeBinding, ScrollAwayEnabled })
end