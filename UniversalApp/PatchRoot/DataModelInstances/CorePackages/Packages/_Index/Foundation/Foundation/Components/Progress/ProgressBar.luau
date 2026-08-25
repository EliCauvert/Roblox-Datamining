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

local function getBarSequenceFromProgress(p0)
	p0 = p0 or 0
	
	if p0 == 0 then
		return NumberSequence.new(1)
	elseif p0 == 1 then
		return NumberSequence.new(0)
	end
	local list = {
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(p0, 0),
		NumberSequenceKeypoint.new(math.min(p0 + 0.001, 1), 1)
	}
	
	if p0 < 0.999 then
		table.insert(list, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(list)
end

local function getFillSizeFromProgress(p1)
	return UDim2.fromScale(p1 or 0, 1)
end

local function getIndeterminateShimmerTransparency(a, b, p2)
	return if b then NumberSequence.new(a) else NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.2, 1),
		NumberSequenceKeypoint.new(0.5, p2),
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
		Transparency = usePulseBindingModule(1 / constantsModule.INDETERMINATE_SHIMMER_SPEED):map(function(p3)
			-- upvalues: getIndeterminateShimmerTransparency (copy), a (ref)
			return getIndeterminateShimmerTransparency(p3, a.reducedMotion, a.emphasisTransparency)
		end),
		Offset = useRotationModule(1):map(function(p4)
			-- upvalues: getIndeterminateShimmerOffset (copy), a (ref)
			return getIndeterminateShimmerOffset(p4, a.reducedMotion)
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

return function(p5)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), useProgressVariantsModule (ref), flagsModule (ref), progressSizeModule (ref), useProgressBindingModule (ref), useRotationModule (ref), usePulseBindingModule (ref), constantsModule (ref), mapBindableModule (ref), getBarSequenceFromProgress (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), getFillSizeFromProgress (ref), ProgressBarIndeterminateGradient (ref), textModule (ref)
	local var25 = withDefaultsModule(p5, t)
	local var26 = useTokensModule()
	local var27 = usePreferencesModule()
	local var28 = useProgressVariantsModule(var26, if flagsModule.FoundationProgressBarBetaUpdate then progressSizeModule.Medium else var25.size)
	local var29, var30 = useProgressBindingModule(var25.value)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var25, {
		tag = if flagsModule.FoundationProgressBarBetaUpdate then "col gap-xsmall size-full-0 auto-y" else "radius-small bg-shift-400",
		Size = if flagsModule.FoundationProgressBarBetaUpdate then UDim2.new(var25.width, UDim.new(0, 0)) else UDim2.new(var25.width, UDim.new(0, var28.bar.height)),
		ref = var25.ref
	}), if flagsModule.FoundationProgressBarBetaUpdate then {
		Track = reactModule.createElement(viewModule, {
			tag = "size-full-0 clip bg-shift-400",
			LayoutOrder = 1,
			Size = UDim2.new(UDim.new(1, 0), UDim.new(0, var28.bar.height)),
			cornerRadius = UDim.new(0, var26.Radius.Circle),
			testId = `{var25.testId}--track`
		}, {
			Fill = reactModule.createElement(viewModule, {
				backgroundStyle = var26.Color.Content.Emphasis,
				cornerRadius = UDim.new(0, var26.Radius.Circle),
				Size = if var30 then UDim2.fromScale(1, 1) else mapBindableModule(var29, getFillSizeFromProgress),
				tag = if var30 then "size-full" else nil,
				testId = `{var25.testId}--fill`
			}, if var30 then {
				Gradient = reactModule.createElement(ProgressBarIndeterminateGradient, {
					emphasisColor3 = var26.Color.Content.Emphasis.Color3,
					emphasisTransparency = var26.Color.Content.Emphasis.Transparency,
					reducedMotion = var27.reducedMotion,
					testId = `{var25.testId}--fill--gradient`
				})
			} else nil)
		}),
		Labels = if var25.showLabel and not var30 then reactModule.createElement(viewModule, {
			tag = "row size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{var25.testId}--labels`
		}, {
			MinValue = reactModule.createElement(textModule, {
				tag = "fill auto-xy text-label-medium text-align-x-left content-default",
				LayoutOrder = 1,
				Text = var25.minValueLabel,
				testId = `{var25.testId}--label-min`
			}),
			MaxValue = reactModule.createElement(textModule, {
				tag = "fill auto-xy text-label-medium text-align-x-right content-default",
				LayoutOrder = 2,
				Text = var25.maxValueLabel,
				testId = `{var25.testId}--label-max`
			})
		}) else nil
	} else {
		Fill = reactModule.createElement(viewModule, {
			tag = "size-full radius-small",
			backgroundStyle = var26.Color.Content.Emphasis,
			ref = var25.ref,
			testId = `{var25.testId}--fill`
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Color = ColorSequence.new(var26.Color.Content.Emphasis.Color3),
				Transparency = if var30 then usePulseBindingModule(1 / constantsModule.INDETERMINATE_SHIMMER_SPEED):map(function(p6)
					-- upvalues: var27 (ref), var26 (ref)
					return if var27.reducedMotion then NumberSequence.new(p6) else NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.2, 1),
						NumberSequenceKeypoint.new(0.5, var26.Color.Content.Emphasis.Transparency),
						NumberSequenceKeypoint.new(0.8, 1),
						NumberSequenceKeypoint.new(1, 1)
					})
				end) else mapBindableModule(var29, getBarSequenceFromProgress),
				Offset = if var30 then useRotationModule(1):map(function(p7)
					-- upvalues: var27 (ref), constantsModule (copy)
					return if var27.reducedMotion then Vector2.new(0, 0) else Vector2.new(p7 * constantsModule.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
				end) else nil
			})
		})
	})
end