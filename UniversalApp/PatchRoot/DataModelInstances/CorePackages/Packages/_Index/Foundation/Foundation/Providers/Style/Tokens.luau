local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Parent.RbxDesignFoundations)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local DeprecatedTokenUtilitiesModule = require(script.DeprecatedTokenUtilities)
local DeviceModule = require(Foundation.Enums.Device)
local FlagsModule = require(Foundation.Utility.Flags)
local ThemeNameModule = require(Foundation.Enums.ThemeName)
local TokenProcessingUtilitiesModule = require(script.TokenProcessingUtilities)
local _ = require(Foundation.Components.Types)
local ThemeGeneratorsModule = require(script.themeGenerators)

local function _(Console, Value: number): number
	-- upvalues: FlagsModule (copy), DeviceModule (copy)
	if FlagsModule.FoundationDisableTokenScaling then
		return 1
	end
	if Value == nil then
		Value = 1
	end
	return (if Console == DeviceModule.Console then 1.5 else 1) * math.clamp(Value, 0, 1e999)
end

local function applyTokenOverrides(p1, List)
	-- upvalues: TokenProcessingUtilitiesModule (copy)
	for i, value in List do
		local ResolveTokenOverrideResult = TokenProcessingUtilitiesModule.resolveTokenOverride(p1, i, value)
		
		if ResolveTokenOverrideResult ~= nil then
			TokenProcessingUtilitiesModule.setTokenValue(p1, i, ResolveTokenOverrideResult)
		end
	end
	return p1
end

local function buildTokens(Callback, ScaledClampedValue, p2)
	-- upvalues: applyTokenOverrides (copy), FlagsModule (copy), DeprecatedTokenUtilitiesModule (copy)
	local CallbackResult = Callback(ScaledClampedValue)
	local config = {
		Assets = CallbackResult.Assets,
		Color = CallbackResult.Color,
		Config = CallbackResult.Config,
		DarkMode = CallbackResult.DarkMode,
		Ease = CallbackResult.Ease,
		LightMode = CallbackResult.LightMode,
		Inverse = CallbackResult.Inverse,
		Size = CallbackResult.Size,
		Padding = CallbackResult.Padding,
		Margin = CallbackResult.Margin,
		Gap = CallbackResult.Gap,
		Gutter = CallbackResult.Gutter,
		Radius = CallbackResult.Radius,
		Stroke = CallbackResult.Stroke,
		LineHeight = CallbackResult.LineHeight,
		FontSize = CallbackResult.FontSize,
		FontWeight = CallbackResult.FontWeight,
		Time = CallbackResult.Time,
		Typography = CallbackResult.Typography
	}
	
	if p2 then
		applyTokenOverrides(config, p2)
	end
	if FlagsModule.FoundationRemoveDeprecatedSemanticTokens then
		config.Semantic = nil
		
		return config
	else
		config.Semantic = DeprecatedTokenUtilitiesModule.getDeprecatedSemanticTokens(config, ScaledClampedValue)
		
		return config
	end
end

local t = {}

local function getTokens(Dark, Desktop, p2, p3, p4)
	-- upvalues: DeviceModule (copy), FlagsModule (copy), ThemeNameModule (copy), t (copy), buildTokens (copy), ThemeGeneratorsModule (copy)
	local Desktop1 = Desktop or DeviceModule.Desktop
	local Value: number = p2
	local ScaledClampedValue = nil
	
	if FlagsModule.FoundationDisableTokenScaling then
		ScaledClampedValue = 1
	else
		if Value == nil then
			Value = 1
		end
		ScaledClampedValue = (if Desktop1 == DeviceModule.Console then 1.5 else 1) * math.clamp(Value, 0, 1e999)
	end
	if not FlagsModule.FoundationShareTokenSets or p3 ~= nil then
		return (buildTokens(ThemeGeneratorsModule.getGenerator(p4 or ThemeNameModule.Default, Dark), ScaledClampedValue, p3))
	end
	local P9 = p4 or ThemeNameModule.Default
	local Text: string = `{P9}|{Dark}|{ScaledClampedValue}`
	local Entry = t[Text]
	
	if Entry == nil then
		Entry = buildTokens(ThemeGeneratorsModule.getGenerator(P9, Dark), ScaledClampedValue, nil)
		t[Text] = Entry
	end
	return Entry
end

return {
	getTokens = getTokens,
	defaultTokens = getTokens(ColorModeModule.Dark, DeviceModule.Desktop)
}