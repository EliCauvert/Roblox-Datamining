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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useClock (ref), usePulseBindingModule (ref), useTokensModule (ref), usePreferencesModule (ref), radiusModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), lerpModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useClock()
	local var3 = usePulseBindingModule(2)
	local var4 = useTokensModule()
	local var5 = usePreferencesModule()
	local var6 = if flagsModule.FoundationSkeletonCommonShimmerToken then var4.Color.Common.Shimmer else var4.Color.Shift.Shift_300
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		cornerRadius = if var1.radius ~= radiusModule.None then nil else UDim.new(0, var4.Radius[var1.radius]),
		backgroundStyle = if var5.reducedMotion then var3:map(function(p3)
			-- upvalues: flagsModule (copy), var6 (ref), var4 (ref), lerpModule (copy)
			local var7 = if flagsModule.FoundationSkeletonCommonShimmerToken then var6.Transparency else var4.Color.Extended.White.White_10.Transparency
			
			return {
				Color3 = var6.Color3,
				Transparency = lerpModule(var7, var7 - 0.1, p3)
			}
		end) else var4.Color.Extended.White.White_100,
		Size = var1.Size,
		ref = p2
	}), {
		Gradient = if not var5.reducedMotion then reactModule.createElement("UIGradient", {
			Rotation = 15,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, var6.Color3),
				ColorSequenceKeypoint.new(0.5, var4.Color.Extended.White.White_30.Color3),
				ColorSequenceKeypoint.new(1, var6.Color3)
			}),
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, var6.Transparency),
				NumberSequenceKeypoint.new(0.5, var4.Color.Extended.White.White_30.Transparency),
				NumberSequenceKeypoint.new(1, var6.Transparency)
			}),
			Offset = var2:map(function(p3)
				return Vector2.new(p3 * 2 % 3 - 1.5, 0)
			end)
		}) else nil
	})
end))