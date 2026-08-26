local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Parent.RbxDesignFoundations)
local colorModeModule = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local themeNameModule = require(foundation.Enums.ThemeName)
local tokenProcessingUtilitiesModule = require(script.TokenProcessingUtilities)
local _ = require(foundation.Components.Types)
local themeGeneratorsModule = require(script.themeGenerators)

local function _(p1, p2)
	-- upvalues: flagsModule (ref), deviceModule (ref)
	if flagsModule.FoundationDisableTokenScaling then
		return 1
	elseif p2 == nil then
		p2 = 1
	end
	return (if p1 == deviceModule.Console then 1.5 else 1) * u155
end

local function applyTokenOverrides(p1, p2)
	-- upvalues: flagsModule (ref), tokenProcessingUtilitiesModule (ref)
	if not flagsModule.FoundationTokenOverrides then
		return p1
	end
	for i, v in p2 do
		local var1 = tokenProcessingUtilitiesModule.resolveTokenOverride(p1, i, v)
		
		if var1 ~= nil then
			tokenProcessingUtilitiesModule.setTokenValue(p1, i, var1)
		end
	end
	return p1
end

local function buildTokens(p3, p4, p5)
	-- upvalues: applyTokenOverrides (ref)
	local var2 = p3(p4)
	local t = {
		Color = var2.Color,
		Config = var2.Config,
		DarkMode = var2.DarkMode,
		Ease = var2.Ease,
		LightMode = var2.LightMode,
		Inverse = var2.Inverse,
		Semantic = var2.Semantic,
		Size = var2.Size,
		Padding = var2.Padding,
		Margin = var2.Margin,
		Gap = var2.Gap,
		Gutter = var2.Gutter,
		Radius = var2.Radius,
		Stroke = var2.Stroke,
		LineHeight = var2.LineHeight,
		FontSize = var2.FontSize,
		FontWeight = var2.FontWeight,
		Time = var2.Time,
		Typography = var2.Typography
	}
	
	if p5 then
		applyTokenOverrides(t, p5)
	end
	return t
end

local function getTokens(p3, p4, p5, p6, p7)
	-- upvalues: deviceModule (ref), flagsModule (ref), themeGeneratorsModule (ref), themeNameModule (ref), buildTokens (ref)
	local var2
	p4 = p4 or deviceModule.Desktop
	local var3 = p5
	
	if flagsModule.FoundationDisableTokenScaling then
		var2 = 1
	elseif var3 == nil then
		var3 = 1
	end
	var2 = (if p4 == deviceModule.Console then 1.5 else 1) * math.clamp(var3, 0, 1e999)
	local getGenerator
	if flagsModule.FoundationThemeName then
		getGenerator = themeGeneratorsModule.getGenerator
		getGenerator = getGenerator(p7 or themeNameModule.Default, p3)
	else
		getGenerator = themeGeneratorsModule.getLegacyGenerator(p3)
	end
	return buildTokens(getGenerator, var2, p6)
end

return {
	getTokens = getTokens,
	getThemedTokens = function(p3, p4, p5, p6, p7)
		-- upvalues: deviceModule (ref), flagsModule (ref), themeGeneratorsModule (ref), themeNameModule (ref), buildTokens (ref)
		local var2
		p5 = p5 or deviceModule.Desktop
		local var3 = p6
		
		if flagsModule.FoundationDisableTokenScaling then
			var2 = 1
		elseif var3 == nil then
			var3 = 1
		end
		var2 = (if p5 == deviceModule.Console then 1.5 else 1) * math.clamp(var3, 0, 1e999)
		return buildTokens(themeGeneratorsModule.getGenerator(p3 or themeNameModule.Default, p4), var2, p7)
	end,
	getLegacyTokens = function(p3, p4, p5)
		-- upvalues: deviceModule (ref), flagsModule (ref), themeGeneratorsModule (ref), buildTokens (ref)
		local var2
		p4 = p4 or deviceModule.Desktop
		local var3 = p5
		
		if flagsModule.FoundationDisableTokenScaling then
			var2 = 1
		elseif var3 == nil then
			var3 = 1
		end
		var2 = (if p4 == deviceModule.Console then 1.5 else 1) * math.clamp(var3, 0, 1e999)
		return buildTokens(themeGeneratorsModule.getLegacyGenerator(p3), var2, nil)
	end,
	defaultTokens = getTokens(colorModeModule.Dark, deviceModule.Desktop)
}