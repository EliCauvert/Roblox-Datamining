local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local usePulseBinding = foundationModule.Hooks.usePulseBinding
local useTokens = foundationModule.Hooks.useTokens
local withCommonProps = foundationModule.Utility.withCommonProps
local withDefaults = foundationModule.Utility.withDefaults

local function _(startValue, endValue, alpha)
	return (1 - alpha) * startValue + endValue * alpha
end

local t = {
	testId = "--foundation-skeleton",
	radius = radius.None,
	Size = UDim2.fromScale(1, 1)
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaults (ref), t (ref), usePulseBinding (ref), useTokens (ref), radius (ref), reactModule (ref), view (ref), withCommonProps (ref)
	local var1 = withDefaults(p1, t)
	local var2 = useTokens()
	
	return reactModule.createElement(view, withCommonProps(var1, {
		cornerRadius = if var1.radius ~= radius.None then nil else UDim.new(0, var2.Radius[var1.radius]),
		backgroundStyle = usePulseBinding(2):map(function(p3)
			-- upvalues: var2 (ref)
			return {
				Color3 = var2.Color.Shift.Shift_300.Color3,
				Transparency = (1 - p3) * var2.Color.Extended.White.White_10.Transparency + (var2.Color.Extended.White.White_10.Transparency - 0.1) * p3
			}
		end),
		Size = var1.Size,
		ref = p2
	}))
end))