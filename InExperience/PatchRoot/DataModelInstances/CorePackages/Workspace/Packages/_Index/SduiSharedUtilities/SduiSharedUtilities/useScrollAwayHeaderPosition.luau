local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local useDeviceInsets = require(parent.Responsive).useDeviceInsets
local appNavBarModule = require(parent.AppNavBar)
local visibilityControl = appNavBarModule.VisibilityControl
local getScrollAwayEnabled = appNavBarModule.getScrollAwayEnabled

return if require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway then function(p1)
	-- upvalues: getScrollAwayEnabled (ref), useDeviceInsets (ref), reactModule (ref), visibilityControl (ref)
	local headerHeightBinding = p1.headerHeightBinding
	local var1 = p1.enabled == true and (getScrollAwayEnabled() and (p1.scrollAwayHeight ~= nil and p1.scrollAwayHeight > 0))
	local top = useDeviceInsets().top
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref), top (ref), headerHeightBinding (ref), visibilityControl (copy)
		if not var1 or not p1.scrollAwayHeight then
			return UDim2.fromOffset(0, 0)
		end
		local scrollAwayHeight = p1.scrollAwayHeight
		local var2 = if top > 0 and top < scrollAwayHeight then top - scrollAwayHeight else -1e999
		
		return (if headerHeightBinding ~= nil then visibilityControl.getHeaderBinding():map(function(p2)
			-- upvalues: scrollAwayHeight (ref)
			return p2 * scrollAwayHeight
		end) else headerHeightBinding):map(function(p2)
			-- upvalues: scrollAwayHeight (ref), var2 (ref)
			return UDim2.new(0, 0, 0, math.max(p2 - scrollAwayHeight, var2))
		end)
	end, { var1, p1.scrollAwayHeight, top, headerHeightBinding })
end else function(p1)
	-- upvalues: getScrollAwayEnabled (ref), reactModule (ref), visibilityControl (ref)
	local var1 = p1.enabled == true and getScrollAwayEnabled()
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactModule (copy), p1 (ref), visibilityControl (copy)
		return if var1 then reactModule.joinBindings({
			size = p1.sizeBinding,
			ratio = visibilityControl.getHeaderBinding()
		}):map(function(p2)
			return UDim2.new(0, 0, 0, (p2.ratio - 1) * p2.size.Y.Offset)
		end) else UDim2.fromOffset(0, 0)
	end, { p1.sizeBinding, var1 })
end