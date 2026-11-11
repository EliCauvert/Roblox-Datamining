local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local ConstantsModule = require(script.Parent.constants)
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

local function getBarSequenceFromProgress(p1): NumberSequence
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

local config = {
	size = require(Foundation.Enums.ProgressSize).Medium,
	width = UDim.new(1, 0)
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePreferencesModule (copy), UseProgressVariantsModule (copy), UseProgressBindingModule (copy), UseRotationModule (copy), UsePulseBindingModule (copy), ConstantsModule (copy), ReactIsModule (copy), getBarSequenceFromProgress (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local UseProgressVariantsModuleResult = UseProgressVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size)
	local UseProgressBindingModuleResult, UseProgressBindingModuleResult2 = UseProgressBindingModule(WithDefaultsModuleResult.value)
	local UseRotationModuleResult = UseRotationModule(1)
	local UsePulseBindingModuleResult = UsePulseBindingModule(1 / ConstantsModule.INDETERMINATE_SHIMMER_SPEED)
	local MapResult = if ReactIsModule.isBinding(UseProgressBindingModuleResult) then UseProgressBindingModuleResult:map(getBarSequenceFromProgress) else getBarSequenceFromProgress(UseProgressBindingModuleResult)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "radius-small bg-shift-400",
		Size = UDim2.new(WithDefaultsModuleResult.width, UDim.new(0, UseProgressVariantsModuleResult.bar.height)),
		ref = WithDefaultsModuleResult.ref
	}), {
		Fill = ReactModule.createElement(ViewModule, {
			tag = "size-full radius-small",
			backgroundStyle = UseTokensModuleResult.Color.Content.Emphasis,
			ref = WithDefaultsModuleResult.ref,
			testId = `{WithDefaultsModuleResult.testId}--fill`
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Color = ColorSequence.new(UseTokensModuleResult.Color.Content.Emphasis.Color3),
				Transparency = if UseProgressBindingModuleResult2 then UsePulseBindingModuleResult:map(function(p2): NumberSequence
					-- upvalues: UsePreferencesModuleResult (copy), UseTokensModuleResult (copy)
					return if UsePreferencesModuleResult.reducedMotion then NumberSequence.new(p2) else NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.2, 1),
						NumberSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Content.Emphasis.Transparency),
						NumberSequenceKeypoint.new(0.8, 1),
						NumberSequenceKeypoint.new(1, 1)
					})
				end) else MapResult,
				Offset = if UseProgressBindingModuleResult2 then UseRotationModuleResult:map(function(p2): Vector2
					-- upvalues: UsePreferencesModuleResult (copy), ConstantsModule (upval)
					return if UsePreferencesModuleResult.reducedMotion then Vector2.new(0, 0) else Vector2.new(p2 * ConstantsModule.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
				end) else nil
			})
		})
	})
end