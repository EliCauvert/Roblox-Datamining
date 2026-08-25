local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local useDeviceInsets = require(parent.Responsive).useDeviceInsets
local appNavBarModule = require(parent.AppNavBar)
local visibilityControl = appNavBarModule.VisibilityControl
local getScrollAwayEnabled = appNavBarModule.getScrollAwayEnabled

return if require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway then function(p2)
	-- upvalues: getScrollAwayEnabled (ref), useDeviceInsets (ref), reactModule (ref), visibilityControl (ref)
	local headerHeightBinding = p2.headerHeightBinding
	local var3 = p2.enabled == true and (getScrollAwayEnabled() and (p2.scrollAwayHeight ~= nil and p2.scrollAwayHeight > 0))
	local top = useDeviceInsets().top
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), p2 (ref), top (ref), headerHeightBinding (ref), visibilityControl (copy)
		if not var3 or not p2.scrollAwayHeight then
			return UDim2.fromOffset(0, 0)
		end
		local scrollAwayHeight = p2.scrollAwayHeight
		local var4 = if top > 0 and top < scrollAwayHeight then top - scrollAwayHeight else -1e999
		
		return (if headerHeightBinding ~= nil then visibilityControl.getHeaderBinding():map(function(p4)
			-- upvalues: scrollAwayHeight (ref)
			return p4 * scrollAwayHeight
		end) else headerHeightBinding):map(function(p3)
			-- upvalues: scrollAwayHeight (ref), var4 (ref)
			return UDim2.new(0, 0, 0, math.max(p3 - scrollAwayHeight, var4))
		end)
	end, { var3, p2.scrollAwayHeight, top, headerHeightBinding })
end else function(p0)
	-- upvalues: getScrollAwayEnabled (ref), reactModule (ref), visibilityControl (ref)
	local var2 = p0.enabled == true and getScrollAwayEnabled()
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), reactModule (copy), p0 (ref), visibilityControl (copy)
		return if var2 then reactModule.joinBindings({
			size = p0.sizeBinding,
			ratio = visibilityControl.getHeaderBinding()
		}):map(function(p1)
			return UDim2.new(0, 0, 0, (p1.ratio - 1) * p1.size.Y.Offset)
		end) else UDim2.fromOffset(0, 0)
	end, { p0.sizeBinding, var2 })
end