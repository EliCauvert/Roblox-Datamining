local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Parent.RbxDesignFoundations)
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

local function getTokens(p2, p3, p4, p5, p6)
	-- upvalues: DeviceModule (copy), FlagsModule (copy), ThemeGeneratorsModule (copy), ThemeNameModule (copy), buildTokens (copy)
	local P6 = p3 or DeviceModule.Desktop
	local Value: number = p4
	local ScaledClampedValue = nil
	
	if FlagsModule.FoundationDisableTokenScaling then
		ScaledClampedValue = 1
	else
		if Value == nil then
			Value = 1
		end
		ScaledClampedValue = (if P6 == DeviceModule.Console then 1.5 else 1) * math.clamp(Value, 0, 1e999)
	end
	return (buildTokens(ThemeGeneratorsModule.getGenerator(p6 or ThemeNameModule.Default, p2), ScaledClampedValue, p5))
end

local Dark = require(Foundation.Enums.ColorMode).Dark
local Desktop = DeviceModule.Desktop or DeviceModule.Desktop
local Value: number? = nil
local ScaledClampedValue = nil

if FlagsModule.FoundationDisableTokenScaling then
	ScaledClampedValue = 1
else
	if Value == nil then
		Value = 1
	end
	ScaledClampedValue = (if Desktop == DeviceModule.Console then 1.5 else 1) * math.clamp(Value, 0, 1e999)
end
return {
	getTokens = getTokens,
	defaultTokens = buildTokens(ThemeGeneratorsModule.getGenerator(ThemeNameModule.Default, Dark), ScaledClampedValue, nil)
}