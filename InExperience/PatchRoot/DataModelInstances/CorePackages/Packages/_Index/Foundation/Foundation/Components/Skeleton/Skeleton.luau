local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local UseClockFunction = require(Parent.ReactUtils).useClock
local Components = Foundation.Components
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local RadiusModule = require(Foundation.Enums.Radius)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UsePulseBindingModule = require(Foundation.Utility.usePulseBinding)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local LerpModule = require(Foundation.Utility.lerp)
local config = {
	testId = "--foundation-skeleton",
	radius = RadiusModule.None,
	Size = UDim2.fromScale(1, 1)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseClockFunction (copy), UsePulseBindingModule (copy), UseTokensModule (copy), UsePreferencesModule (copy), RadiusModule (copy), FlagsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), LerpModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseClockResult = UseClockFunction()
	local UsePulseBindingModuleResult = UsePulseBindingModule(2)
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local Shimmer = if FlagsModule.FoundationSkeletonCommonShimmerToken then UseTokensModuleResult.Color.Common.Shimmer else UseTokensModuleResult.Color.Shift.Shift_300
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		cornerRadius = if WithDefaultsModuleResult.radius == RadiusModule.None then nil else UDim.new(0, UseTokensModuleResult.Radius[WithDefaultsModuleResult.radius]),
		backgroundStyle = if UsePreferencesModuleResult.reducedMotion then UsePulseBindingModuleResult:map(function(p2)
			-- upvalues: FlagsModule (upval), Shimmer (copy), UseTokensModuleResult (copy), LerpModule (upval)
			local Transparency = if FlagsModule.FoundationSkeletonCommonShimmerToken then Shimmer.Transparency else UseTokensModuleResult.Color.Extended.White.White_10.Transparency
			
			return {
				Color3 = Shimmer.Color3,
				Transparency = LerpModule(Transparency, Transparency - 0.1, p2)
			}
		end) else UseTokensModuleResult.Color.Extended.White.White_100,
		Size = WithDefaultsModuleResult.Size,
		ref = Ref
	}), {
		Gradient = if UsePreferencesModuleResult.reducedMotion then nil else ReactModule.createElement("UIGradient", {
			Rotation = 15,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Shimmer.Color3),
				ColorSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Extended.White.White_30.Color3),
				ColorSequenceKeypoint.new(1, Shimmer.Color3)
			}),
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, Shimmer.Transparency),
				NumberSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Extended.White.White_30.Transparency),
				NumberSequenceKeypoint.new(1, Shimmer.Transparency)
			}),
			Offset = UseClockResult:map(function(p2: number): Vector2
				return Vector2.new(p2 * 2 % 3 - 1.5, 0)
			end)
		})
	})
end))