local Foundation = script:FindFirstAncestor("Foundation")
local RbxDesignFoundationsModule = require(Foundation.Parent.RbxDesignFoundations)
local DeviceModule = require(Foundation.Enums.Device)
local FlagsModule = require(Foundation.Utility.Flags)
local ThemeModule = require(Foundation.Enums.Theme)
local TokenProcessingUtilitiesModule = require(script.TokenProcessingUtilities)
local _ = require(Foundation.Components.Types)

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
	-- upvalues: FlagsModule (copy), TokenProcessingUtilitiesModule (copy)
	if not FlagsModule.FoundationTokenOverrides then
		return p1
	end
	for i, value in List do
		local ResolveTokenOverrideResult = TokenProcessingUtilitiesModule.resolveTokenOverride(p1, i, value)
		
		if ResolveTokenOverrideResult ~= nil then
			TokenProcessingUtilitiesModule.setTokenValue(p1, i, ResolveTokenOverrideResult)
		end
	end
	return p1
end

local function getTokens(Dark, Desktop, p2, p3)
	-- upvalues: RbxDesignFoundationsModule (copy), DeviceModule (copy), FlagsModule (copy), ThemeModule (copy), applyTokenOverrides (copy)
	local Tokens = RbxDesignFoundationsModule.Tokens
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
	local v1 = (if Dark == ThemeModule.Dark then Tokens.Dark else Tokens.Light)(ScaledClampedValue)
	local config = {
		Color = v1.Color,
		Config = v1.Config,
		DarkMode = v1.DarkMode,
		Ease = v1.Ease,
		LightMode = v1.LightMode,
		Inverse = v1.Inverse,
		Semantic = v1.Semantic,
		Size = v1.Size,
		Padding = v1.Padding,
		Margin = v1.Margin,
		Gap = v1.Gap,
		Gutter = v1.Gutter,
		Radius = v1.Radius,
		Stroke = v1.Stroke,
		LineHeight = v1.LineHeight,
		FontSize = v1.FontSize,
		FontWeight = v1.FontWeight,
		Time = v1.Time,
		Typography = v1.Typography
	}
	
	if p3 then
		applyTokenOverrides(config, p3)
	end
	return config
end

return {
	getTokens = getTokens,
	defaultTokens = getTokens(ThemeModule.Dark, DeviceModule.Desktop)
}