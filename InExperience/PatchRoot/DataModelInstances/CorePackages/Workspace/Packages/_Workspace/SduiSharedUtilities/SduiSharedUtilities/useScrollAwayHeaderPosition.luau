local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local AppNavBarModule = require(Parent.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local GetScrollAwayEnabledFunction = AppNavBarModule.getScrollAwayEnabled

return function(p1)
	-- upvalues: GetScrollAwayEnabledFunction (copy), UseDeviceInsetsFunction (copy), ReactModule (copy), VisibilityControl (copy)
	local HeaderHeightBinding = p1.headerHeightBinding
	local IsScrollAwayHeightAbove: boolean = p1.enabled == true and (GetScrollAwayEnabledFunction() and (p1.scrollAwayHeight ~= nil and p1.scrollAwayHeight > 0))
	local Top = UseDeviceInsetsFunction().top
	
	return ReactModule.useMemo(function()
		-- upvalues: IsScrollAwayHeightAbove (copy), p1 (copy), Top (copy), HeaderHeightBinding (copy), VisibilityControl (upval)
		if IsScrollAwayHeightAbove and p1.scrollAwayHeight then
			local ScrollAwayHeight: number = p1.scrollAwayHeight
			local TopDelta = if Top > 0 and Top < ScrollAwayHeight then Top - ScrollAwayHeight else -1e999
			
			return (if HeaderHeightBinding == nil then VisibilityControl.getHeaderBinding():map(function(p2)
				-- upvalues: ScrollAwayHeight (copy)
				return p2 * ScrollAwayHeight
			end) else HeaderHeightBinding):map(function(p2): UDim2
				-- upvalues: ScrollAwayHeight (copy), TopDelta (copy)
				return UDim2.new(0, 0, 0, (math.max(p2 - ScrollAwayHeight, TopDelta)))
			end)
		else
			return UDim2.fromOffset(0, 0)
		end
	end, {
		IsScrollAwayHeightAbove,
		p1.scrollAwayHeight,
		Top,
		HeaderHeightBinding
	})
end