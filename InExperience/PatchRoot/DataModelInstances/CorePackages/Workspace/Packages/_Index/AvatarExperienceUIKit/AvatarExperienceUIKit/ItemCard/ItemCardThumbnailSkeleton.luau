local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local usePulseBinding = foundationModule.Hooks.usePulseBinding
local useTokens = foundationModule.Hooks.useTokens
local withCommonProps = foundationModule.Utility.withCommonProps
local withDefaults = foundationModule.Utility.withDefaults

local function _(startValue, endValue, alpha) --[[ line: 28 | named "lerp" ]]
	return (1 - alpha) * startValue + endValue * alpha
end

local t = {
	testId = "--foundation-skeleton",
	radius = radius.None,
	Size = UDim2.fromScale(1, 1)
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 43 | named "ItemCardThumbnailSkeleton" ]]
	-- upvalues: withDefaults (ref), t (ref), usePulseBinding (ref), useTokens (ref), radius (ref), reactModule (ref), view (ref), withCommonProps (ref)
	local var3 = withDefaults(p0, t)
	local var4 = useTokens()
	
	return reactModule.createElement(view, withCommonProps(var3, {
		cornerRadius = if var3.radius ~= radius.None then nil else UDim.new(0, var4.Radius[var3.radius]),
		backgroundStyle = usePulseBinding(2):map(function(p2) --[[ line: 54 ]]
			-- upvalues: var4 (ref)
			return {
				Color3 = var4.Color.Shift.Shift_300.Color3,
				Transparency = (1 - p2) * var4.Color.Extended.White.White_10.Transparency + (var4.Color.Extended.White.White_10.Transparency - 0.1) * p2
			}
		end),
		Size = var3.Size,
		ref = p1
	}))
end))