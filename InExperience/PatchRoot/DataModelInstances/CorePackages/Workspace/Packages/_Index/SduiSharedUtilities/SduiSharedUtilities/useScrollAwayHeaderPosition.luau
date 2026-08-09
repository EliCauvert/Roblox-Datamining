local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local appNavBarModule = require(parent.AppNavBar)
local visibilityControl = appNavBarModule.VisibilityControl
local getScrollAwayEnabled = appNavBarModule.getScrollAwayEnabled

return function(p0) --[[ line: 31 | named "useScrollAwayHeaderPosition" ]]
	-- upvalues: getScrollAwayEnabled (ref), reactModule (ref), visibilityControl (ref)
	local var2 = p0.enabled == true and getScrollAwayEnabled()
	
	return reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: var2 (ref), reactModule (copy), p0 (ref), visibilityControl (copy)
		return if var2 then reactModule.joinBindings({
			size = p0.sizeBinding,
			ratio = visibilityControl.getHeaderBinding()
		}):map(function(p1) --[[ line: 40 ]]
			return UDim2.new(0, 0, 0, (p1.ratio - 1) * p1.size.Y.Offset)
		end) else UDim2.fromOffset(0, 0)
	end, { p0.sizeBinding, var2 })
end