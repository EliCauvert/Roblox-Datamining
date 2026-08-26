local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(script.Parent.constants)
local flagsModule = require(foundation.Utility.Flags)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local mapBindableModule = require(foundation.Utility.mapBindable)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local useProgressBindingModule = require(script.Parent.useProgressBinding)
local useProgressVariantsModule = require(script.Parent.useProgressVariants)
local usePulseBindingModule = require(foundation.Utility.usePulseBinding)
local useRotationModule = require(foundation.Utility.useRotation)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Enums.ProgressShape)
local progressSizeModule = require(foundation.Enums.ProgressSize)

local function getBarSequenceFromProgress(p1)
	p1 = p1 or 0
	
	if p1 == 0 then
		return NumberSequence.new(1)
	elseif p1 == 1 then
		return NumberSequence.new(0)
	end
	local list = {
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(p1, 0),
		NumberSequenceKeypoint.new(math.min(p1 + 0.001, 1), 1)
	}
	
	if p1 < 0.999 then
		table.insert(list, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(list)
end

local function getFillSizeFromProgress(p1)
	return UDim2.fromScale(p1 or 0, 1)
end

local function getIndeterminateShimmerTransparency(a, b, p1)
	return if b then NumberSequence.new(a) else NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.2, 1),
		NumberSequenceKeypoint.new(0.5, p1),
		NumberSequenceKeypoint.new(0.8, 1),
		NumberSequenceKeypoint.new(1, 1)
	})
end

local function getIndeterminateShimmerOffset(a, b)
	-- upvalues: constantsModule (ref)
	return if b then Vector2.new(0, 0) else Vector2.new(a * constantsModule.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
end

local function ProgressBarIndeterminateGradient(a)
	-- upvalues: useRotationModule (ref), usePulseBindingModule (ref), constantsModule (ref), reactModule (ref), getIndeterminateShimmerTransparency (ref), getIndeterminateShimmerOffset (ref), getTestIdTagModule (ref)
	return reactModule.createElement("UIGradient", {
		Color = ColorSequence.new(a.emphasisColor3),
		Transparency = usePulseBindingModule(1 / constantsModule.INDETERMINATE_SHIMMER_SPEED):map(function(p1)
			-- upvalues: getIndeterminateShimmerTransparency (copy), a (ref)
			return getIndeterminateShimmerTransparency(p1, a.reducedMotion, a.emphasisTransparency)
		end),
		Offset = useRotationModule(1):map(function(p1)
			-- upvalues: getIndeterminateShimmerOffset (copy), a (ref)
			return getIndeterminateShimmerOffset(p1, a.reducedMotion)
		end),
		[reactModule.Tag] = getTestIdTagModule(a.testId)
	})
end

local t = {
	showLabel = false,
	minValueLabel = "0",
	maxValueLabel = "100",
	size = progressSizeModule.Medium,
	width = UDim.new(1, 0)
}

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), useProgressVariantsModule (ref), flagsModule (ref), progressSizeModule (ref), useProgressBindingModule (ref), useRotationModule (ref), usePulseBindingModule (ref), constantsModule (ref), mapBindableModule (ref), getBarSequenceFromProgress (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), getFillSizeFromProgress (ref), ProgressBarIndeterminateGradient (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = usePreferencesModule()
	local var4 = useProgressVariantsModule(var2, if flagsModule.FoundationProgressBarBetaUpdate then progressSizeModule.Medium else var1.size)
	local var5, var6 = useProgressBindingModule(var1.value)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = if flagsModule.FoundationProgressBarBetaUpdate then "col gap-xsmall size-full-0 auto-y" else "radius-small bg-shift-400",
		Size = if flagsModule.FoundationProgressBarBetaUpdate then UDim2.new(var1.width, UDim.new(0, 0)) else UDim2.new(var1.width, UDim.new(0, var4.bar.height)),
		ref = var1.ref
	}), if flagsModule.FoundationProgressBarBetaUpdate then {
		Track = reactModule.createElement(viewModule, {
			tag = "size-full-0 clip bg-shift-400",
			LayoutOrder = 1,
			Size = UDim2.new(UDim.new(1, 0), UDim.new(0, var4.bar.height)),
			cornerRadius = UDim.new(0, var2.Radius.Circle),
			testId = `{var1.testId}--track`
		}, {
			Fill = reactModule.createElement(viewModule, {
				backgroundStyle = var2.Color.Content.Emphasis,
				cornerRadius = UDim.new(0, var2.Radius.Circle),
				Size = if var6 then UDim2.fromScale(1, 1) else mapBindableModule(var5, getFillSizeFromProgress),
				tag = if var6 then "size-full" else nil,
				testId = `{var1.testId}--fill`
			}, if var6 then {
				Gradient = reactModule.createElement(ProgressBarIndeterminateGradient, {
					emphasisColor3 = var2.Color.Content.Emphasis.Color3,
					emphasisTransparency = var2.Color.Content.Emphasis.Transparency,
					reducedMotion = var3.reducedMotion,
					testId = `{var1.testId}--fill--gradient`
				})
			} else nil)
		}),
		Labels = if var1.showLabel and not var6 then reactModule.createElement(viewModule, {
			tag = "row size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{var1.testId}--labels`
		}, {
			MinValue = reactModule.createElement(textModule, {
				tag = "fill auto-xy text-label-medium text-align-x-left content-default",
				LayoutOrder = 1,
				Text = var1.minValueLabel,
				testId = `{var1.testId}--label-min`
			}),
			MaxValue = reactModule.createElement(textModule, {
				tag = "fill auto-xy text-label-medium text-align-x-right content-default",
				LayoutOrder = 2,
				Text = var1.maxValueLabel,
				testId = `{var1.testId}--label-max`
			})
		}) else nil
	} else {
		Fill = reactModule.createElement(viewModule, {
			tag = "size-full radius-small",
			backgroundStyle = var2.Color.Content.Emphasis,
			ref = var1.ref,
			testId = `{var1.testId}--fill`
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Color = ColorSequence.new(var2.Color.Content.Emphasis.Color3),
				Transparency = if var6 then usePulseBindingModule(1 / constantsModule.INDETERMINATE_SHIMMER_SPEED):map(function(p2)
					-- upvalues: var3 (ref), var2 (ref)
					return if var3.reducedMotion then NumberSequence.new(p2) else NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.2, 1),
						NumberSequenceKeypoint.new(0.5, var2.Color.Content.Emphasis.Transparency),
						NumberSequenceKeypoint.new(0.8, 1),
						NumberSequenceKeypoint.new(1, 1)
					})
				end) else mapBindableModule(var5, getBarSequenceFromProgress),
				Offset = if var6 then useRotationModule(1):map(function(p2)
					-- upvalues: var3 (ref), constantsModule (copy)
					return if var3.reducedMotion then Vector2.new(0, 0) else Vector2.new(p2 * constantsModule.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
				end) else nil
			})
		})
	})
end