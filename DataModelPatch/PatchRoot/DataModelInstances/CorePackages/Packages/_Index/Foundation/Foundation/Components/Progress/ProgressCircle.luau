local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local ConstantsModule = require(script.Parent.constants)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
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

local function _(p1: number, HorizontalAlignment): number
	local MinValue: number = if HorizontalAlignment == Enum.HorizontalAlignment.Left then 180 else 0
	local MaxValue: number = if HorizontalAlignment == Enum.HorizontalAlignment.Left then 360 else 180
	
	return if p1 == nil then 0 else math.clamp(p1 * 360, MinValue, MaxValue)
end

local function getLabelFromProgress(p1: number): string
	return if p1 == nil then "0%" else `{math.floor(p1 * 100)}%`
end

local function ProgressGradient(p1)
	-- upvalues: UseTokensModule (copy), UsePreferencesModule (copy), ReactModule (copy), ReactIsModule (copy)
	local Side = p1.side
	local IsIndeterminate = p1.isIndeterminate
	local Progress: number = p1.progress
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local UseMemoResult = ReactModule.useMemo(function(): NumberSequence
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
	local UseMemoResult1 = ReactModule.useMemo(function(): ColorSequence
		-- upvalues: UseTokensModuleResult (copy)
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0, UseTokensModuleResult.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.4999, UseTokensModuleResult.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Shift.Shift_200.Color3),
			ColorSequenceKeypoint.new(1, UseTokensModuleResult.Color.Shift.Shift_200.Color3)
		})
	end, { UseTokensModuleResult })
	
	if IsIndeterminate and UsePreferencesModuleResult.reducedMotion then
		return ReactModule.createElement("UIGradient", {
			Transparency = p1.pulse:map(function(Alpha: number): NumberSequence
				-- upvalues: UseTokensModuleResult (copy)
				return NumberSequence.new((math.lerp(UseTokensModuleResult.Color.Content.Emphasis.Transparency, UseTokensModuleResult.Color.Shift.Shift_200.Transparency, Alpha)))
			end),
			Color = p1.pulse:map(function(Alpha): ColorSequence
				-- upvalues: UseTokensModuleResult (copy)
				return ColorSequence.new(UseTokensModuleResult.Color.Content.Emphasis.Color3:Lerp(UseTokensModuleResult.Color.Shift.Shift_200.Color3, Alpha))
			end),
			Rotation = if IsIndeterminate then if Side == Enum.HorizontalAlignment.Left then 0 else 180 else p1.rotation
		})
	end
	local CreateElementFunction = ReactModule.createElement
	local v1 = "UIGradient"
	local config = { Transparency = UseMemoResult, Color = UseMemoResult1 }
	local MapResult = nil
	
	if ReactIsModule.isBinding(Progress) then
		MapResult = Progress:map(function(p2: number): number
			-- upvalues: Side (copy)
			local MinValue: number = if Side == Enum.HorizontalAlignment.Left then 180 else 0
			local MaxValue: number = if Side == Enum.HorizontalAlignment.Left then 360 else 180
			
			return if p2 == nil then 0 else math.clamp(p2 * 360, MinValue, MaxValue)
		end)
	else
		local MinValue: number = if Side == Enum.HorizontalAlignment.Left then 180 else 0
		local MaxValue: number = if Side == Enum.HorizontalAlignment.Left then 360 else 180
		MapResult = if Progress == nil then 0 else math.clamp(Progress * 360, MinValue, MaxValue)
	end
	config.Rotation = MapResult
	
	return (CreateElementFunction(v1, config))
end

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePreferencesModule (copy), UseProgressVariantsModule (copy), UseProgressBindingModule (copy), ReactModule (copy), UseRotationModule (copy), UsePulseBindingModule (copy), ConstantsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ImageModule (copy), ProgressGradient (copy), TextModule (copy), ReactIsModule (copy), getLabelFromProgress (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local UseProgressVariantsModuleResult = UseProgressVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size)
	local UseProgressBindingModuleResult, UseProgressBindingModuleResult2 = UseProgressBindingModule(WithDefaultsModuleResult.value)
	local UseBindingResult = ReactModule.useBinding(0.8)
	local UseRotationModuleResult = UseRotationModule(1)
	local UsePulseBindingModuleResult = UsePulseBindingModule(1 / ConstantsModule.INDETERMINATE_SHIMMER_SPEED)
	local _UDim2 = UDim2.fromOffset(UseProgressVariantsModuleResult.circle.size, UseProgressVariantsModuleResult.circle.size)
	
	return if UseProgressBindingModuleResult2 and not UsePreferencesModuleResult.reducedMotion then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "auto-xy", ref = WithDefaultsModuleResult.ref }), {
		IndeterminateContainer = ReactModule.createElement(ViewModule, {
			Size = _UDim2,
			Rotation = UseRotationModuleResult,
			testId = `{WithDefaultsModuleResult.testId}--indeterminate-container`
		}, {
			LeftGradient = ReactModule.createElement(ViewModule, {
				tag = "position-top-left clip",
				Size = UDim2.fromScale(0.5, 1),
				testId = `{WithDefaultsModuleResult.testId}--left-gradient`
			}, {
				Image = ReactModule.createElement(ImageModule, {
					Image = "rbxasset://textures/ui/Controls/RadialFill.png",
					tag = "position-top-left content-emphasis",
					Size = UDim2.fromScale(2, 1)
				}, {
					Gradient = ReactModule.createElement(ProgressGradient, {
						side = Enum.HorizontalAlignment.Left,
						isIndeterminate = UseProgressBindingModuleResult2,
						rotation = UseRotationModuleResult,
						progress = UseBindingResult,
						pulse = UsePulseBindingModuleResult
					})
				})
			}),
			RightGradient = ReactModule.createElement(ViewModule, {
				tag = "position-top-center clip",
				Size = UDim2.fromScale(0.5, 1),
				testId = `{WithDefaultsModuleResult.testId}--right-gradient`
			}, {
				Image = ReactModule.createElement(ImageModule, {
					Image = "rbxasset://textures/ui/Controls/RadialFill.png",
					tag = "content-emphasis",
					Size = UDim2.fromScale(2, 1),
					Position = UDim2.fromScale(-1, 0)
				}, {
					Gradient = ReactModule.createElement(ProgressGradient, {
						side = Enum.HorizontalAlignment.Right,
						isIndeterminate = UseProgressBindingModuleResult2,
						rotation = UseRotationModuleResult,
						progress = UseBindingResult,
						pulse = UsePulseBindingModuleResult
					})
				})
			})
		})
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { Size = _UDim2, ref = WithDefaultsModuleResult.ref }), {
		LeftGradient = ReactModule.createElement(ViewModule, {
			tag = "position-top-left clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{WithDefaultsModuleResult.testId}--left-gradient`
		}, {
			Image = ReactModule.createElement(ImageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "position-top-left content-emphasis",
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = ReactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Left,
					isIndeterminate = UseProgressBindingModuleResult2,
					rotation = UseRotationModuleResult,
					progress = UseProgressBindingModuleResult,
					pulse = UsePulseBindingModuleResult
				})
			})
		}),
		RightGradient = ReactModule.createElement(ViewModule, {
			tag = "position-top-center clip",
			Size = UDim2.fromScale(0.5, 1),
			testId = `{WithDefaultsModuleResult.testId}--right-gradient`
		}, {
			Image = ReactModule.createElement(ImageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "content-emphasis",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = ReactModule.createElement(ProgressGradient, {
					side = Enum.HorizontalAlignment.Right,
					isIndeterminate = UseProgressBindingModuleResult2,
					rotation = UseRotationModuleResult,
					progress = UseProgressBindingModuleResult,
					pulse = UsePulseBindingModuleResult
				})
			})
		}),
		ProgressLabel = if UseProgressVariantsModuleResult.circle.labelFont and not UseProgressBindingModuleResult2 then ReactModule.createElement(TextModule, {
			tag = "position-center-center anchor-center-center",
			Text = if ReactIsModule.isBinding(UseProgressBindingModuleResult) then UseProgressBindingModuleResult:map(getLabelFromProgress) elseif UseProgressBindingModuleResult == nil then "0%" else `{math.floor(UseProgressBindingModuleResult * 100)}%`,
			fontStyle = UseProgressVariantsModuleResult.circle.labelFont,
			testId = `{WithDefaultsModuleResult.testId}--label`
		}) else nil
	})
end