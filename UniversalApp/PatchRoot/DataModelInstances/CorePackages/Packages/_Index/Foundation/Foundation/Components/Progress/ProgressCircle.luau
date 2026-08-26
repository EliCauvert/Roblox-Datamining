local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(script.Parent.constants)
local flagsModule = require(foundation.Utility.Flags)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
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
local t = { size = require(foundation.Enums.ProgressSize).Medium }

local function _(p1, p2)
	return if p1 == nil then 0 else math.clamp(p1 * 360, if p2 == Enum.HorizontalAlignment.Left then 180 else 0, if p2 == Enum.HorizontalAlignment.Left then 360 else 180)
end

local function getLabelFromProgress(p1)
	return if p1 == nil then "0%" else `{math.floor(p1 * 100)}%`
end

local function getCapAngleFromProgress(vectorA)
	return math.clamp(vectorA or 0, 0, 1) * 360
end

local function hasVisibleArc(p1)
	return (p1 or 0) > 0
end

local function ArcCap(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		Rotation = p1.angle,
		Visible = p1.isVisible,
		testId = p1.testId
	}, {
		Cap = reactModule.createElement(viewModule, {
			tag = "anchor-center-center radius-circle",
			ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.043103448276),
			Size = UDim2.fromScale(0.086206896552, 0.086206896552),
			backgroundStyle = useTokensModule().Color.Content.Emphasis
		})
	})
end

local function ArcCaps(p1)
	-- upvalues: mapBindableModule (ref), hasVisibleArc (ref), reactModule (ref), ArcCap (ref), getCapAngleFromProgress (ref)
	local var1 = mapBindableModule(p1.progress, hasVisibleArc)
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		StartCap = reactModule.createElement(ArcCap, {
			angle = 0,
			isVisible = var1,
			testId = `{p1.testId}--start-cap`
		}),
		EndCap = reactModule.createElement(ArcCap, {
			angle = mapBindableModule(p1.progress, getCapAngleFromProgress),
			isVisible = var1,
			testId = `{p1.testId}--end-cap`
		})
	})
end

local function ProgressGradient(p1)
	-- upvalues: useTokensModule (ref), usePreferencesModule (ref), reactModule (ref), mapBindableModule (ref)
	local side = p1.side
	local isIndeterminate = p1.isIndeterminate
	local progress = p1.progress
	local pulse = p1.pulse
	local var1 = useTokensModule()
	
	return if isIndeterminate and usePreferencesModule().reducedMotion and pulse then reactModule.createElement("UIGradient", {
		Transparency = pulse:map(function(p2)
			-- upvalues: var1 (ref)
			return NumberSequence.new(math.lerp(var1.Color.Content.Emphasis.Transparency, var1.Color.Shift.Shift_200.Transparency, p2))
		end),
		Color = pulse:map(function(p2)
			-- upvalues: var1 (ref)
			return ColorSequence.new(var1.Color.Content.Emphasis.Color3:Lerp(var1.Color.Shift.Shift_200.Color3, p2))
		end),
		Rotation = if side == Enum.HorizontalAlignment.Left then 0 else 180
	}) else reactModule.createElement("UIGradient", {
		Transparency = reactModule.useMemo(function()
			-- upvalues: var1 (ref), isIndeterminate (ref)
			local transparency = var1.Color.Content.Emphasis.Transparency
			local var2 = if isIndeterminate then 1 else var1.Color.Shift.Shift_200.Transparency
			
			return NumberSequence.new({
				NumberSequenceKeypoint.new(0, transparency),
				NumberSequenceKeypoint.new(0.4999, transparency),
				NumberSequenceKeypoint.new(0.5, var2),
				NumberSequenceKeypoint.new(1, var2)
			})
		end, { var1, isIndeterminate }),
		Color = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			return ColorSequence.new({
				ColorSequenceKeypoint.new(0, var1.Color.Content.Emphasis.Color3),
				ColorSequenceKeypoint.new(0.4999, var1.Color.Content.Emphasis.Color3),
				ColorSequenceKeypoint.new(0.5, var1.Color.Shift.Shift_200.Color3),
				ColorSequenceKeypoint.new(1, var1.Color.Shift.Shift_200.Color3)
			})
		end, { var1 }),
		Rotation = mapBindableModule(progress, function(p2)
			-- upvalues: side (ref)
			return if p2 == nil then 0 else math.clamp(p2 * 360, if side == Enum.HorizontalAlignment.Left then 180 else 0, if side == Enum.HorizontalAlignment.Left then 360 else 180)
		end)
	})
end

local function ProgressRing(p1)
	-- upvalues: reactModule (ref), viewModule (ref), imageModule (ref), ProgressGradient (ref), ArcCaps (ref)
	return reactModule.createElement(reactModule.Fragment, {}, {
		LeftGradient = reactModule.createElement(viewModule, {
			tag = "position-top-left clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{p1.testId}--left-gradient`
		}, {
			Image = reactModule.createElement(imageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "position-top-left content-emphasis",
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = reactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Left,
					isIndeterminate = p1.isIndeterminate,
					progress = p1.progress,
					pulse = p1.pulse
				})
			})
		}),
		RightGradient = reactModule.createElement(viewModule, {
			tag = "position-top-center clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{p1.testId}--right-gradient`
		}, {
			Image = reactModule.createElement(imageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "content-emphasis",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = reactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Right,
					isIndeterminate = p1.isIndeterminate,
					progress = p1.progress,
					pulse = p1.pulse
				})
			})
		}),
		Caps = if p1.hasCaps then reactModule.createElement(ArcCaps, { progress = p1.progress, testId = p1.testId }) else nil
	})
end

local function SpinningRing(p1)
	-- upvalues: reactModule (ref), viewModule (ref), ProgressRing (ref)
	return reactModule.createElement(viewModule, {
		Size = p1.size,
		Rotation = p1.rotation,
		testId = `{p1.testId}--indeterminate-container`
	}, {
		Ring = reactModule.createElement(ProgressRing, {
			progress = 0.8,
			isIndeterminate = true,
			hasCaps = p1.hasCaps,
			testId = p1.testId
		})
	})
end

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), useProgressVariantsModule (ref), useProgressBindingModule (ref), useRotationModule (ref), usePulseBindingModule (ref), constantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), SpinningRing (ref), flagsModule (ref), ProgressRing (ref), textModule (ref), mapBindableModule (ref), getLabelFromProgress (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = usePreferencesModule()
	local var3 = useProgressVariantsModule(useTokensModule(), var1.size)
	local var4, var5 = useProgressBindingModule(var1.value)
	local uDim2 = UDim2.fromOffset(var3.circle.size, var3.circle.size)
	
	return if var5 and not var2.reducedMotion then reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "auto-xy", ref = var1.ref }), {
		IndeterminateContainer = reactModule.createElement(SpinningRing, {
			size = uDim2,
			rotation = useRotationModule(1),
			hasCaps = flagsModule.FoundationProgressCircleRoundCaps,
			testId = var1.testId
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var1, { Size = uDim2, ref = var1.ref }), {
		Ring = reactModule.createElement(ProgressRing, {
			progress = var4,
			isIndeterminate = var5,
			pulse = usePulseBindingModule(1 / constantsModule.INDETERMINATE_SHIMMER_SPEED),
			hasCaps = flagsModule.FoundationProgressCircleRoundCaps and not var5,
			testId = var1.testId
		}),
		ProgressLabel = if var3.circle.labelFont and not var5 then reactModule.createElement(textModule, {
			tag = "position-center-center anchor-center-center",
			Text = mapBindableModule(var4, getLabelFromProgress),
			fontStyle = var3.circle.labelFont,
			testId = `{var1.testId}--label`
		}) else nil
	})
end