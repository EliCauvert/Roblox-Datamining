local var1
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
	return (if p1 == deviceModule.Console then 1.5 else 1) * u160
end

local function applyTokenOverrides(p1, p2)
	-- upvalues: flagsModule (ref), tokenProcessingUtilitiesModule (ref)
	if not flagsModule.FoundationTokenOverrides then
		return p1
	end
	for i, v in p2 do
		local var2 = tokenProcessingUtilitiesModule.resolveTokenOverride(p1, i, v)
		
		if var2 ~= nil then
			tokenProcessingUtilitiesModule.setTokenValue(p1, i, var2)
		end
	end
	return p1
end

local function buildTokens(p3, p4, p5)
	-- upvalues: applyTokenOverrides (ref)
	local var3 = p3(p4)
	local t = {
		Color = var3.Color,
		Config = var3.Config,
		DarkMode = var3.DarkMode,
		Ease = var3.Ease,
		LightMode = var3.LightMode,
		Inverse = var3.Inverse,
		Semantic = var3.Semantic,
		Size = var3.Size,
		Padding = var3.Padding,
		Margin = var3.Margin,
		Gap = var3.Gap,
		Gutter = var3.Gutter,
		Radius = var3.Radius,
		Stroke = var3.Stroke,
		LineHeight = var3.LineHeight,
		FontSize = var3.FontSize,
		FontWeight = var3.FontWeight,
		Time = var3.Time,
		Typography = var3.Typography
	}
	
	if p5 then
		applyTokenOverrides(t, p5)
	end
	return t
end

local function getTokens(p3, p4, p5, p6, p7)
	-- upvalues: deviceModule (ref), flagsModule (ref), themeGeneratorsModule (ref), themeNameModule (ref), buildTokens (ref)
	local var3
	p4 = p4 or deviceModule.Desktop
	local var4 = p5
	
	if flagsModule.FoundationDisableTokenScaling then
		var3 = 1
	elseif var4 == nil then
		var4 = 1
	end
	var3 = (if p4 == deviceModule.Console then 1.5 else 1) * math.clamp(var4, 0, 1e999)
	return buildTokens(themeGeneratorsModule.getGenerator(p7 or themeNameModule.Default, p3), var3, p6)
end

local dark = colorModeModule.Dark
local desktop = deviceModule.Desktop or deviceModule.Desktop
local var3 = nil

if flagsModule.FoundationDisableTokenScaling then
	var1 = 1
elseif var3 == nil then
	var3 = 1
end
var1 = (if desktop == deviceModule.Console then 1.5 else 1) * math.clamp(var3, 0, 1e999)
return {
	getTokens = getTokens,
	defaultTokens = buildTokens(themeGeneratorsModule.getGenerator(themeNameModule.Default, dark), var1, nil)
}