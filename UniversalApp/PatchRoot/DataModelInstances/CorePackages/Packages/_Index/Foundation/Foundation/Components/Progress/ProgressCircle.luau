local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(script.Parent.constants)
local FlagsModule = require(Foundation.Utility.Flags)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
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
local config = { size = require(Foundation.Enums.ProgressSize).Medium }

local function _(p1: number, HorizontalAlignment): number --[[ Line: 60 | Named "getRotationFromProgress" ]]
	local MinValue: number = if HorizontalAlignment == Enum.HorizontalAlignment.Left then 180 else 0
	local MaxValue: number = if HorizontalAlignment == Enum.HorizontalAlignment.Left then 360 else 180
	
	return if p1 == nil then 0 else math.clamp(p1 * 360, MinValue, MaxValue)
end

local function getLabelFromProgress(p1: number): string --[[ Line: 66 ]]
	return if p1 == nil then "0%" else `{math.floor(p1 * 100)}%`
end

local function getCapAngleFromProgress(p1): number --[[ Line: 70 ]]
	return math.clamp(p1 or 0, 0, 1) * 360
end

local function hasVisibleArc(p1): boolean --[[ Line: 74 ]]
	return (p1 or 0) > 0
end

local function ArcCap(p1) --[[ Line: 84 ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		Rotation = p1.angle,
		Visible = p1.isVisible,
		testId = p1.testId
	}, {
		Cap = ReactModule.createElement(ViewModule, {
			tag = "anchor-center-center radius-circle",
			ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.04310344827586207),
			Size = UDim2.fromScale(0.08620689655172414, 0.08620689655172414),
			backgroundStyle = UseTokensModule().Color.Content.Emphasis
		})
	})
end

local function ArcCaps(p1) --[[ Line: 108 ]]
	-- upvalues: MapBindableModule (copy), hasVisibleArc (copy), ReactModule (copy), ArcCap (copy), getCapAngleFromProgress (copy)
	local MapBindableModuleResult = MapBindableModule(p1.progress, hasVisibleArc)
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		StartCap = ReactModule.createElement(ArcCap, {
			angle = 0,
			isVisible = MapBindableModuleResult,
			testId = `{p1.testId}--start-cap`
		}),
		EndCap = ReactModule.createElement(ArcCap, {
			angle = MapBindableModule(p1.progress, getCapAngleFromProgress),
			isVisible = MapBindableModuleResult,
			testId = `{p1.testId}--end-cap`
		})
	})
end

local function ProgressGradient(p1) --[[ Line: 128 ]]
	-- upvalues: UseTokensModule (copy), UsePreferencesModule (copy), ReactModule (copy), MapBindableModule (copy)
	local Side = p1.side
	local IsIndeterminate = p1.isIndeterminate
	local Progress = p1.progress
	local Pulse = p1.pulse
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local UseMemoResult = ReactModule.useMemo(function(): NumberSequence --[[ Line: 142 ]]
		-- upvalues: UseTokensModuleResult (copy), IsIndeterminate (copy)
		local Transparency = UseTokensModuleResult.Color.Content.Emphasis.Transparency
		local Transparency1 = if IsIndeterminate then 1 else UseTokensModuleResult.Color.Shift.Shift_200.Transparency
		
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, Transparency),
			NumberSequenceKeypoint.new(0.4999, Transparency),
			NumberSequenceKeypoint.new(0.5, Transparency1),
			NumberSequenceKeypoint.new(1, Transparency1)
		})
	end, { UseTokensModuleResult, IsIndeterminate })
	local UseMemoResult1 = ReactModule.useMemo(function(): ColorSequence --[[ Line: 154 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0, UseTokensModuleResult.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.4999, UseTokensModuleResult.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Shift.Shift_200.Color3),
			ColorSequenceKeypoint.new(1, UseTokensModuleResult.Color.Shift.Shift_200.Color3)
		})
	end, { UseTokensModuleResult })
	
	return if IsIndeterminate and UsePreferencesModuleResult.reducedMotion and Pulse then ReactModule.createElement("UIGradient", {
		Transparency = Pulse:map(function(Alpha: number): NumberSequence --[[ Line: 165 ]]
			-- upvalues: UseTokensModuleResult (copy)
			return NumberSequence.new((math.lerp(UseTokensModuleResult.Color.Content.Emphasis.Transparency, UseTokensModuleResult.Color.Shift.Shift_200.Transparency, Alpha)))
		end),
		Color = Pulse:map(function(Alpha): ColorSequence --[[ Line: 174 ]]
			-- upvalues: UseTokensModuleResult (copy)
			return ColorSequence.new(UseTokensModuleResult.Color.Content.Emphasis.Color3:Lerp(UseTokensModuleResult.Color.Shift.Shift_200.Color3, Alpha))
		end),
		Rotation = if Side == Enum.HorizontalAlignment.Left then 0 else 180
	}) else ReactModule.createElement("UIGradient", {
		Transparency = UseMemoResult,
		Color = UseMemoResult1,
		Rotation = MapBindableModule(Progress, function(p2: number): number --[[ Line: 185 ]]
			-- upvalues: Side (copy)
			local MinValue: number = if Side == Enum.HorizontalAlignment.Left then 180 else 0
			local MaxValue: number = if Side == Enum.HorizontalAlignment.Left then 360 else 180
			
			return if p2 == nil then 0 else math.clamp(p2 * 360, MinValue, MaxValue)
		end)
	})
end

local function ProgressRing(p1) --[[ Line: 193 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), ImageModule (copy), ProgressGradient (copy), ArcCaps (copy)
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		LeftGradient = ReactModule.createElement(ViewModule, {
			tag = "position-top-left clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{p1.testId}--left-gradient`
		}, {
			Image = ReactModule.createElement(ImageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "position-top-left content-emphasis",
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = ReactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Left,
					isIndeterminate = p1.isIndeterminate,
					progress = p1.progress,
					pulse = p1.pulse
				})
			})
		}),
		RightGradient = ReactModule.createElement(ViewModule, {
			tag = "position-top-center clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{p1.testId}--right-gradient`
		}, {
			Image = ReactModule.createElement(ImageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "content-emphasis",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = ReactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Right,
					isIndeterminate = p1.isIndeterminate,
					progress = p1.progress,
					pulse = p1.pulse
				})
			})
		}),
		Caps = if p1.hasCaps then ReactModule.createElement(ArcCaps, { progress = p1.progress, testId = p1.testId }) else nil
	})
end

local function SpinningRing(p1) --[[ Line: 248 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), ProgressRing (copy)
	return ReactModule.createElement(ViewModule, {
		Size = p1.size,
		Rotation = p1.rotation,
		testId = `{p1.testId}--indeterminate-container`
	}, {
		Ring = ReactModule.createElement(ProgressRing, {
			progress = 0.8,
			isIndeterminate = true,
			hasCaps = p1.hasCaps,
			testId = p1.testId
		})
	})
end

return function(p1) --[[ Line: 268 | Named "ProgressCircle" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePreferencesModule (copy), UseProgressVariantsModule (copy), UseProgressBindingModule (copy), UseRotationModule (copy), UsePulseBindingModule (copy), ConstantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), SpinningRing (copy), FlagsModule (copy), ProgressRing (copy), TextModule (copy), MapBindableModule (copy), getLabelFromProgress (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local UseProgressVariantsModuleResult = UseProgressVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size)
	local UseProgressBindingModuleResult, UseProgressBindingModuleResult2 = UseProgressBindingModule(WithDefaultsModuleResult.value)
	local UseRotationModuleResult = UseRotationModule(1)
	local UsePulseBindingModuleResult = UsePulseBindingModule(1 / ConstantsModule.INDETERMINATE_SHIMMER_SPEED)
	local _UDim2 = UDim2.fromOffset(UseProgressVariantsModuleResult.circle.size, UseProgressVariantsModuleResult.circle.size)
	
	return if UseProgressBindingModuleResult2 and not UsePreferencesModuleResult.reducedMotion then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "auto-xy", ref = WithDefaultsModuleResult.ref }), {
		IndeterminateContainer = ReactModule.createElement(SpinningRing, {
			size = _UDim2,
			rotation = UseRotationModuleResult,
			hasCaps = FlagsModule.FoundationProgressCircleRoundCaps,
			testId = WithDefaultsModuleResult.testId
		})
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { Size = _UDim2, ref = WithDefaultsModuleResult.ref }), {
		Ring = ReactModule.createElement(ProgressRing, {
			progress = UseProgressBindingModuleResult,
			isIndeterminate = UseProgressBindingModuleResult2,
			pulse = UsePulseBindingModuleResult,
			hasCaps = FlagsModule.FoundationProgressCircleRoundCaps and not UseProgressBindingModuleResult2,
			testId = WithDefaultsModuleResult.testId
		}),
		ProgressLabel = if UseProgressVariantsModuleResult.circle.labelFont and not UseProgressBindingModuleResult2 then ReactModule.createElement(TextModule, {
			tag = "position-center-center anchor-center-center",
			Text = MapBindableModule(UseProgressBindingModuleResult, getLabelFromProgress),
			fontStyle = UseProgressVariantsModuleResult.circle.labelFont,
			testId = `{WithDefaultsModuleResult.testId}--label`
		}) else nil
	})
end