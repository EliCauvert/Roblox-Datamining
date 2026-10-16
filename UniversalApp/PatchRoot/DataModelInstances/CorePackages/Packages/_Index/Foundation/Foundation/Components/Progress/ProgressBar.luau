local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(script.Parent.constants)
local FlagsModule = require(Foundation.Utility.Flags)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseProgressBindingModule = require(script.Parent.useProgressBinding)
local UseProgressVariantsModule = require(script.Parent.useProgressVariants)
local UsePulseBindingModule = require(Foundation.Utility.usePulseBinding)
local UseRotationModule = require(Foundation.Utility.useRotation)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.ProgressShape)
local ProgressSizeModule = require(Foundation.Enums.ProgressSize)

local function getBarSequenceFromProgress(p1): NumberSequence --[[ Line: 32 ]]
	local P0 = p1 or 0
	
	if P0 == 0 then
		return NumberSequence.new(1)
	end
	if P0 == 1 then
		return NumberSequence.new(0)
	end
	local List = {
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(P0, 0),
		NumberSequenceKeypoint.new(math.min(P0 + 0.001, 1), 1)
	}
	
	if P0 < 0.999 then
		table.insert(List, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(List)
end

local function getFillSizeFromProgress(p1): UDim2 --[[ Line: 52 ]]
	return UDim2.fromScale(p1 or 0, 1)
end

local function getIndeterminateShimmerTransparency(p1, ReducedMotion, EmphasisTransparency): NumberSequence --[[ Line: 56 ]]
	return if ReducedMotion then NumberSequence.new(p1) else NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.2, 1),
		NumberSequenceKeypoint.new(0.5, EmphasisTransparency),
		NumberSequenceKeypoint.new(0.8, 1),
		NumberSequenceKeypoint.new(1, 1)
	})
end

local function getIndeterminateShimmerOffset(p1, ReducedMotion): Vector2 --[[ Line: 74 ]]
	-- upvalues: ConstantsModule (copy)
	return if ReducedMotion then Vector2.new(0, 0) else Vector2.new(p1 * ConstantsModule.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
end

local function ProgressBarIndeterminateGradient(p1) --[[ Line: 89 ]]
	-- upvalues: UseRotationModule (copy), UsePulseBindingModule (copy), ConstantsModule (copy), ReactModule (copy), getIndeterminateShimmerTransparency (copy), getIndeterminateShimmerOffset (copy), GetTestIdTagModule (copy)
	return ReactModule.createElement("UIGradient", {
		Color = ColorSequence.new(p1.emphasisColor3),
		Transparency = UsePulseBindingModule(1 / ConstantsModule.INDETERMINATE_SHIMMER_SPEED):map(function(p2) --[[ Line: 95 ]]
			-- upvalues: getIndeterminateShimmerTransparency (upval), p1 (copy)
			return getIndeterminateShimmerTransparency(p2, p1.reducedMotion, p1.emphasisTransparency)
		end),
		Offset = UseRotationModule(1):map(function(p2) --[[ Line: 98 ]]
			-- upvalues: getIndeterminateShimmerOffset (upval), p1 (copy)
			return getIndeterminateShimmerOffset(p2, p1.reducedMotion)
		end),
		[ReactModule.Tag] = GetTestIdTagModule(p1.testId)
	})
end

local config = {
	showLabel = false,
	minValueLabel = "0",
	maxValueLabel = "100",
	size = ProgressSizeModule.Medium,
	width = UDim.new(1, 0)
}

return function(p1) --[[ Line: 130 | Named "ProgressBar" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePreferencesModule (copy), UseProgressVariantsModule (copy), FlagsModule (copy), ProgressSizeModule (copy), UseProgressBindingModule (copy), UseRotationModule (copy), UsePulseBindingModule (copy), ConstantsModule (copy), MapBindableModule (copy), getBarSequenceFromProgress (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), getFillSizeFromProgress (copy), ProgressBarIndeterminateGradient (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local UseProgressVariantsModuleResult = UseProgressVariantsModule(UseTokensModuleResult, if FlagsModule.FoundationProgressBarBetaUpdate then if WithDefaultsModuleResult.size == ProgressSizeModule.Small then ProgressSizeModule.Small else ProgressSizeModule.Medium else WithDefaultsModuleResult.size)
	local UseProgressBindingModuleResult, UseProgressBindingModuleResult2 = UseProgressBindingModule(WithDefaultsModuleResult.value)
	local UseRotationModuleResult = UseRotationModule(1)
	local UsePulseBindingModuleResult = UsePulseBindingModule(1 / ConstantsModule.INDETERMINATE_SHIMMER_SPEED)
	local MapBindableModuleResult = MapBindableModule(UseProgressBindingModuleResult, getBarSequenceFromProgress)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = if FlagsModule.FoundationProgressBarBetaUpdate then "col gap-xsmall size-full-0 auto-y" else "radius-small bg-shift-400",
		Size = if FlagsModule.FoundationProgressBarBetaUpdate then UDim2.new(WithDefaultsModuleResult.width, UDim.new(0, 0)) else UDim2.new(WithDefaultsModuleResult.width, UDim.new(0, UseProgressVariantsModuleResult.bar.height)),
		ref = WithDefaultsModuleResult.ref
	}), if FlagsModule.FoundationProgressBarBetaUpdate then {
		Track = ReactModule.createElement(ViewModule, {
			tag = "size-full-0 clip bg-shift-400",
			LayoutOrder = 1,
			Size = UDim2.new(UDim.new(1, 0), UDim.new(0, UseProgressVariantsModuleResult.bar.height)),
			cornerRadius = UDim.new(0, UseTokensModuleResult.Radius.Circle),
			testId = `{WithDefaultsModuleResult.testId}--track`
		}, {
			Fill = ReactModule.createElement(ViewModule, {
				backgroundStyle = UseTokensModuleResult.Color.Content.Emphasis,
				cornerRadius = UDim.new(0, UseTokensModuleResult.Radius.Circle),
				Size = if UseProgressBindingModuleResult2 then UDim2.fromScale(1, 1) else MapBindableModule(UseProgressBindingModuleResult, getFillSizeFromProgress),
				tag = if UseProgressBindingModuleResult2 then "size-full" else nil,
				testId = `{WithDefaultsModuleResult.testId}--fill`
			}, if UseProgressBindingModuleResult2 then {
				Gradient = ReactModule.createElement(ProgressBarIndeterminateGradient, {
					emphasisColor3 = UseTokensModuleResult.Color.Content.Emphasis.Color3,
					emphasisTransparency = UseTokensModuleResult.Color.Content.Emphasis.Transparency,
					reducedMotion = UsePreferencesModuleResult.reducedMotion,
					testId = `{WithDefaultsModuleResult.testId}--fill--gradient`
				})
			} else nil)
		}),
		Labels = if WithDefaultsModuleResult.showLabel and not UseProgressBindingModuleResult2 then ReactModule.createElement(ViewModule, {
			tag = "row size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{WithDefaultsModuleResult.testId}--labels`
		}, {
			MinValue = ReactModule.createElement(TextModule, {
				tag = "fill auto-xy text-label-medium text-align-x-left content-default",
				LayoutOrder = 1,
				Text = WithDefaultsModuleResult.minValueLabel,
				testId = `{WithDefaultsModuleResult.testId}--label-min`
			}),
			MaxValue = ReactModule.createElement(TextModule, {
				tag = "fill auto-xy text-label-medium text-align-x-right content-default",
				LayoutOrder = 2,
				Text = WithDefaultsModuleResult.maxValueLabel,
				testId = `{WithDefaultsModuleResult.testId}--label-max`
			})
		}) else nil
	} else {
		Fill = ReactModule.createElement(ViewModule, {
			tag = "size-full radius-small",
			backgroundStyle = UseTokensModuleResult.Color.Content.Emphasis,
			ref = WithDefaultsModuleResult.ref,
			testId = `{WithDefaultsModuleResult.testId}--fill`
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Color = ColorSequence.new(UseTokensModuleResult.Color.Content.Emphasis.Color3),
				Transparency = if UseProgressBindingModuleResult2 then UsePulseBindingModuleResult:map(function(p2): NumberSequence --[[ Line: 221 ]]
					-- upvalues: UsePreferencesModuleResult (copy), UseTokensModuleResult (copy)
					return if UsePreferencesModuleResult.reducedMotion then NumberSequence.new(p2) else NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.2, 1),
						NumberSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Content.Emphasis.Transparency),
						NumberSequenceKeypoint.new(0.8, 1),
						NumberSequenceKeypoint.new(1, 1)
					})
				end) else MapBindableModuleResult,
				Offset = if UseProgressBindingModuleResult2 then UseRotationModuleResult:map(function(p2): Vector2 --[[ Line: 236 ]]
					-- upvalues: UsePreferencesModuleResult (copy), ConstantsModule (upval)
					return if UsePreferencesModuleResult.reducedMotion then Vector2.new(0, 0) else Vector2.new(p2 * ConstantsModule.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
				end) else nil
			})
		})
	})
end