local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Parent.RbxDesignFoundations)
local colorModeModule = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local themeNameModule = require(foundation.Enums.ThemeName)
local tokenProcessingUtilitiesModule = require(script.TokenProcessingUtilities)
local _ = require(foundation.Components.Types)
local themeGeneratorsModule = require(script.themeGenerators)

local function _(p0, p1) --[[ line: 23 | named "getPlatformScale" ]]
	-- upvalues: flagsModule (ref), deviceModule (ref)
	if flagsModule.FoundationDisableTokenScaling then
		return 1
	elseif p1 == nil then
		p1 = 1
	end
	return (if p0 == deviceModule.Console then 1.5 else 1) * u155
end

local function applyTokenOverrides(p2, p3) --[[ line: 38 ]]
	-- upvalues: flagsModule (ref), tokenProcessingUtilitiesModule (ref)
	if not flagsModule.FoundationTokenOverrides then
		return p2
	end
	for i, v in p3 do
		local var10 = tokenProcessingUtilitiesModule.resolveTokenOverride(p2, i, v)
		
		if var10 ~= nil then
			tokenProcessingUtilitiesModule.setTokenValue(p2, i, var10)
		end
	end
	return p2
end

local function buildTokens(p4, p5, p6) --[[ line: 53 ]]
	-- upvalues: applyTokenOverrides (ref)
	local var11 = p4(p5)
	local t = {
		Color = var11.Color,
		Config = var11.Config,
		DarkMode = var11.DarkMode,
		Ease = var11.Ease,
		LightMode = var11.LightMode,
		Inverse = var11.Inverse,
		Semantic = var11.Semantic,
		Size = var11.Size,
		Padding = var11.Padding,
		Margin = var11.Margin,
		Gap = var11.Gap,
		Gutter = var11.Gutter,
		Radius = var11.Radius,
		Stroke = var11.Stroke,
		LineHeight = var11.LineHeight,
		FontSize = var11.FontSize,
		FontWeight = var11.FontWeight,
		Time = var11.Time,
		Typography = var11.Typography
	}
	
	if p6 then
		applyTokenOverrides(t, p6)
	end
	return t
end

local function getTokens(p7, p8, p9, p10, p11) --[[ line: 85 ]]
	-- upvalues: deviceModule (ref), flagsModule (ref), themeGeneratorsModule (ref), themeNameModule (ref), buildTokens (ref)
	local var15
	p8 = p8 or deviceModule.Desktop
	local var14 = p9
	
	if flagsModule.FoundationDisableTokenScaling then
		var15 = 1
	elseif var14 == nil then
		var14 = 1
	end
	var15 = (if p8 == deviceModule.Console then 1.5 else 1) * math.clamp(var14, 0, 1e999)
	local getGenerator
	if flagsModule.FoundationThemeName then
		getGenerator = themeGeneratorsModule.getGenerator
		getGenerator = getGenerator(p11 or themeNameModule.Default, p7)
	else
		getGenerator = themeGeneratorsModule.getLegacyGenerator(p7)
	end
	return buildTokens(getGenerator, var15, p10)
end

return {
	getTokens = getTokens,
	getThemedTokens = function(p12, p13, p14, p15, p16) --[[ line: 108 ]]
		-- upvalues: deviceModule (ref), flagsModule (ref), themeGeneratorsModule (ref), themeNameModule (ref), buildTokens (ref)
		local var18
		p14 = p14 or deviceModule.Desktop
		local var17 = p15
		
		if flagsModule.FoundationDisableTokenScaling then
			var18 = 1
		elseif var17 == nil then
			var17 = 1
		end
		var18 = (if p14 == deviceModule.Console then 1.5 else 1) * math.clamp(var17, 0, 1e999)
		return buildTokens(themeGeneratorsModule.getGenerator(p12 or themeNameModule.Default, p13), var18, p16)
	end,
	getLegacyTokens = function(p17, p18, p19) --[[ line: 121 ]]
		-- upvalues: deviceModule (ref), flagsModule (ref), themeGeneratorsModule (ref), buildTokens (ref)
		local var21
		p18 = p18 or deviceModule.Desktop
		local var20 = p19
		
		if flagsModule.FoundationDisableTokenScaling then
			var21 = 1
		elseif var20 == nil then
			var20 = 1
		end
		var21 = (if p18 == deviceModule.Console then 1.5 else 1) * math.clamp(var20, 0, 1e999)
		return buildTokens(themeGeneratorsModule.getLegacyGenerator(p17), var21, nil)
	end,
	defaultTokens = getTokens(colorModeModule.Dark, deviceModule.Desktop)
}