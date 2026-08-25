local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useClock = require(parent.ReactUtils).useClock
local components = foundation.Components
local flagsModule = require(foundation.Utility.Flags)
local _ = require(components.Types)
local viewModule = require(components.View)
local radiusModule = require(foundation.Enums.Radius)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local usePulseBindingModule = require(foundation.Utility.usePulseBinding)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local lerpModule = require(foundation.Utility.lerp)
local t = {
	testId = "--foundation-skeleton",
	radius = radiusModule.None,
	Size = UDim2.fromScale(1, 1)
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useClock (ref), usePulseBindingModule (ref), useTokensModule (ref), usePreferencesModule (ref), radiusModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), lerpModule (ref)
	local var12 = withDefaultsModule(p0, t)
	local var13 = useClock()
	local var14 = usePulseBindingModule(2)
	local var15 = useTokensModule()
	local var16 = usePreferencesModule()
	local var17 = if flagsModule.FoundationSkeletonCommonShimmerToken then var15.Color.Common.Shimmer else var15.Color.Shift.Shift_300
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var12, {
		cornerRadius = if var12.radius ~= radiusModule.None then nil else UDim.new(0, var15.Radius[var12.radius]),
		backgroundStyle = if var16.reducedMotion then var14:map(function(p2)
			-- upvalues: flagsModule (copy), var17 (ref), var15 (ref), lerpModule (copy)
			local var18 = if flagsModule.FoundationSkeletonCommonShimmerToken then var17.Transparency else var15.Color.Extended.White.White_10.Transparency
			
			return {
				Color3 = var17.Color3,
				Transparency = lerpModule(var18, var18 - 0.1, p2)
			}
		end) else var15.Color.Extended.White.White_100,
		Size = var12.Size,
		ref = p1
	}), {
		Gradient = if not var16.reducedMotion then reactModule.createElement("UIGradient", {
			Rotation = 15,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, var17.Color3),
				ColorSequenceKeypoint.new(0.5, var15.Color.Extended.White.White_30.Color3),
				ColorSequenceKeypoint.new(1, var17.Color3)
			}),
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, var17.Transparency),
				NumberSequenceKeypoint.new(0.5, var15.Color.Extended.White.White_30.Transparency),
				NumberSequenceKeypoint.new(1, var17.Transparency)
			}),
			Offset = var13:map(function(p3)
				return Vector2.new(p3 * 2 % 3 - 1.5, 0)
			end)
		}) else nil
	})
end))