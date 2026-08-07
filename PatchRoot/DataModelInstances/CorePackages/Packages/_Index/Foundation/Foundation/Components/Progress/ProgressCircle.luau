-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local constantsModule = require(script.Parent.constants)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
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

local function _(p0, p1) --[[ line: 42 | named "getRotationFromProgress" ]]
	return if p0 == nil then 0 else math.clamp(p0 * 360, if p1 == Enum.HorizontalAlignment.Left then 180 else 0, if p1 == Enum.HorizontalAlignment.Left then 360 else 180)
end

local function getLabelFromProgress(p2) --[[ line: 48 ]]
	return if p2 == nil then "0%" else `{math.floor(p2 * 100)}%`
end

local function ProgressGradient(p3) --[[ line: 52 ]]
	-- upvalues: useTokensModule (ref), usePreferencesModule (ref), reactModule (ref), reactIsModule (ref)
	local side = p3.side
	local isIndeterminate = p3.isIndeterminate
	local progress = p3.progress
	local var18 = useTokensModule()
	
	return if isIndeterminate and usePreferencesModule().reducedMotion then reactModule.createElement("UIGradient", {
		Transparency = p3.pulse:map(function(p5) --[[ line: 96 ]]
			-- upvalues: var18 (ref)
			return NumberSequence.new(math.lerp(var18.Color.Content.Emphasis.Transparency, var18.Color.Shift.Shift_200.Transparency, p5))
		end),
		Color = p3.pulse:map(function(p6) --[[ line: 105 ]]
			-- upvalues: var18 (ref)
			return ColorSequence.new(var18.Color.Content.Emphasis.Color3:Lerp(var18.Color.Shift.Shift_200.Color3, p6))
		end),
		Rotation = if not isIndeterminate then p3.rotation elseif side == Enum.HorizontalAlignment.Left then 0 else 180
	}) else reactModule.createElement("UIGradient", {
		Transparency = reactModule.useMemo(function() --[[ line: 66 ]]
			-- upvalues: var18 (ref), isIndeterminate (ref)
			local transparency = var18.Color.Content.Emphasis.Transparency
			local var19 = if isIndeterminate then 1 else var18.Color.Shift.Shift_200.Transparency
			
			return NumberSequence.new({
				NumberSequenceKeypoint.new(0, transparency),
				NumberSequenceKeypoint.new(0.4999, transparency),
				NumberSequenceKeypoint.new(0.5, var19),
				NumberSequenceKeypoint.new(1, var19)
			})
		end, { var18, isIndeterminate }),
		Color = reactModule.useMemo(function() --[[ line: 78 ]]
			-- upvalues: var18 (ref)
			return ColorSequence.new({
				ColorSequenceKeypoint.new(0, var18.Color.Content.Emphasis.Color3),
				ColorSequenceKeypoint.new(0.4999, var18.Color.Content.Emphasis.Color3),
				ColorSequenceKeypoint.new(0.5, var18.Color.Shift.Shift_200.Color3),
				ColorSequenceKeypoint.new(1, var18.Color.Shift.Shift_200.Color3)
			})
		end, { var18 }),
		Rotation = if reactIsModule.isBinding(progress) then progress:map(function(p4) --[[ line: 117 ]]
			-- upvalues: side (ref)
			return if p4 == nil then 0 else math.clamp(p4 * 360, if side == Enum.HorizontalAlignment.Left then 180 else 0, if side == Enum.HorizontalAlignment.Left then 360 else 180)
		end) elseif progress == nil then 0 else math.clamp(progress * 360, if side == Enum.HorizontalAlignment.Left then 180 else 0, if side == Enum.HorizontalAlignment.Left then 360 else 180)
	})
end

return function(p7) --[[ line: 125 | named "ProgressCircle" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), useProgressVariantsModule (ref), useProgressBindingModule (ref), reactModule (ref), useRotationModule (ref), usePulseBindingModule (ref), constantsModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), ProgressGradient (ref), textModule (ref), reactIsModule (ref), getLabelFromProgress (ref)
	local var20 = withDefaultsModule(p7, t)
	local var21 = usePreferencesModule()
	local var22 = useProgressVariantsModule(useTokensModule(), var20.size)
	local var23, var24 = useProgressBindingModule(var20.value)
	local var25 = reactModule.useBinding(0.8)
	local var26 = useRotationModule(1)
	local var27 = usePulseBindingModule(1 / constantsModule.INDETERMINATE_SHIMMER_SPEED)
	local uDim2 = UDim2.fromOffset(var22.circle.size, var22.circle.size)
	
	return if var24 and not var21.reducedMotion then reactModule.createElement(viewModule, withCommonPropsModule(var20, { tag = "auto-xy", ref = var20.ref }), {
		IndeterminateContainer = reactModule.createElement(viewModule, {
			Size = uDim2,
			Rotation = var26,
			testId = `{var20.testId}--indeterminate-container`
		}, {
			LeftGradient = reactModule.createElement(viewModule, {
				tag = "position-top-left clip",
				Size = UDim2.fromScale(0.5, 1),
				testId = `{var20.testId}--left-gradient`
			}, {
				Image = reactModule.createElement(imageModule, {
					Image = "rbxasset://textures/ui/Controls/RadialFill.png",
					tag = "position-top-left content-emphasis",
					Size = UDim2.fromScale(2, 1)
				}, {
					Gradient = reactModule.createElement(ProgressGradient, {
						side = Enum.HorizontalAlignment.Left,
						isIndeterminate = var24,
						rotation = var26,
						progress = var25,
						pulse = var27
					})
				})
			}),
			RightGradient = reactModule.createElement(viewModule, {
				tag = "position-top-center clip",
				Size = UDim2.fromScale(0.5, 1),
				testId = `{var20.testId}--right-gradient`
			}, {
				Image = reactModule.createElement(imageModule, {
					Image = "rbxasset://textures/ui/Controls/RadialFill.png",
					tag = "content-emphasis",
					Size = UDim2.fromScale(2, 1),
					Position = UDim2.fromScale(-1, 0)
				}, {
					Gradient = reactModule.createElement(ProgressGradient, {
						side = Enum.HorizontalAlignment.Right,
						isIndeterminate = var24,
						rotation = var26,
						progress = var25,
						pulse = var27
					})
				})
			})
		})
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var20, { Size = uDim2, ref = var20.ref }), {
		LeftGradient = reactModule.createElement(viewModule, {
			tag = "position-top-left clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{var20.testId}--left-gradient`
		}, {
			Image = reactModule.createElement(imageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "position-top-left content-emphasis",
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = reactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Left,
					isIndeterminate = var24,
					rotation = var26,
					progress = var23,
					pulse = var27
				})
			})
		}),
		RightGradient = reactModule.createElement(viewModule, {
			tag = "position-top-center clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{var20.testId}--right-gradient`
		}, {
			Image = reactModule.createElement(imageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "content-emphasis",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = reactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Right,
					isIndeterminate = var24,
					rotation = var26,
					progress = var23,
					pulse = var27
				})
			})
		}),
		ProgressLabel = if var22.circle.labelFont and not var24 then reactModule.createElement(textModule, {
			tag = "position-center-center anchor-center-center",
			Text = if reactIsModule.isBinding(var23) then var23:map(getLabelFromProgress) elseif var23 == nil then "0%" else `{math.floor(var23 * 100)}%`,
			fontStyle = var22.circle.labelFont,
			testId = `{var20.testId}--label`
		}) else nil
	})
end