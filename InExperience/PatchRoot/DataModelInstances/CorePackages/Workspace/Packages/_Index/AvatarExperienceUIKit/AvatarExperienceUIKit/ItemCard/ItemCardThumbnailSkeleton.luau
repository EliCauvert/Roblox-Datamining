local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UsePulseBindingFunction = FoundationModule.Hooks.usePulseBinding
local UseTokensFunction = FoundationModule.Hooks.useTokens
local WithCommonPropsFunction = FoundationModule.Utility.withCommonProps
local WithDefaultsFunction = FoundationModule.Utility.withDefaults

local function _(p1, p2, p3: number) --[[ Line: 28 | Named "lerp" ]]
	return (1 - p3) * p1 + p2 * p3
end

local config = {
	testId = "--foundation-skeleton",
	radius = Radius.None,
	Size = UDim2.fromScale(1, 1)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 43 | Named "ItemCardThumbnailSkeleton" ]]
	-- upvalues: WithDefaultsFunction (copy), config (copy), UsePulseBindingFunction (copy), UseTokensFunction (copy), Radius (copy), ReactModule (copy), View (copy), WithCommonPropsFunction (copy)
	local WithDefaultsResult = WithDefaultsFunction(p1, config)
	local UsePulseBindingResult = UsePulseBindingFunction(2)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, WithCommonPropsFunction(WithDefaultsResult, {
		cornerRadius = if WithDefaultsResult.radius == Radius.None then nil else UDim.new(0, UseTokensResult.Radius[WithDefaultsResult.radius]),
		backgroundStyle = UsePulseBindingResult:map(function(p2: number) --[[ Line: 54 ]]
			-- upvalues: UseTokensResult (copy)
			return {
				Color3 = UseTokensResult.Color.Shift.Shift_300.Color3,
				Transparency = (1 - p2) * UseTokensResult.Color.Extended.White.White_10.Transparency + (UseTokensResult.Color.Extended.White.White_10.Transparency - 0.1) * p2
			}
		end),
		Size = WithDefaultsResult.Size,
		ref = Ref
	}))
end))