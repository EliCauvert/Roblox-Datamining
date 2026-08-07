-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local rbxDesignFoundationsModule = require(foundation.Parent.RbxDesignFoundations)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local themeModule = require(foundation.Enums.Theme)
local tokenProcessingUtilitiesModule = require(script.TokenProcessingUtilities)
local _ = require(foundation.Components.Types)

local function _(p0, p1) --[[ line: 20 | named "getPlatformScale" ]]
	-- upvalues: flagsModule (ref), deviceModule (ref)
	if flagsModule.FoundationDisableTokenScaling then
		return 1
	elseif p1 == nil then
		p1 = 1
	end
	return (if p0 == deviceModule.Console then 1.5 else 1) * u100
end

local function applyTokenOverrides(p2, p3) --[[ line: 35 ]]
	-- upvalues: flagsModule (ref), tokenProcessingUtilitiesModule (ref)
	if not flagsModule.FoundationTokenOverrides then
		return p2
	end
	for i, v in p3 do
		local var8 = tokenProcessingUtilitiesModule.resolveTokenOverride(p2, i, v)
		
		if var8 ~= nil then
			tokenProcessingUtilitiesModule.setTokenValue(p2, i, var8)
		end
	end
	return p2
end

local function getTokens(p4, p5, p6, p7) --[[ line: 50 ]]
	-- upvalues: rbxDesignFoundationsModule (ref), deviceModule (ref), flagsModule (ref), themeModule (ref), applyTokenOverrides (ref)
	local var11
	local tokens = rbxDesignFoundationsModule.Tokens
	p5 = p5 or deviceModule.Desktop
	local var10 = p6
	
	if flagsModule.FoundationDisableTokenScaling then
		var11 = 1
	elseif var10 == nil then
		var10 = 1
	end
	var11 = (if p5 == deviceModule.Console then 1.5 else 1) * math.clamp(var10, 0, 1e999)
	local var12 = (if p4 == themeModule.Dark then tokens.Dark else tokens.Light)(var11)
	local t = {
		Color = var12.Color,
		Config = var12.Config,
		DarkMode = var12.DarkMode,
		Ease = var12.Ease,
		LightMode = var12.LightMode,
		Inverse = var12.Inverse,
		Semantic = var12.Semantic,
		Size = var12.Size,
		Padding = var12.Padding,
		Margin = var12.Margin,
		Gap = var12.Gap,
		Gutter = var12.Gutter,
		Radius = var12.Radius,
		Stroke = var12.Stroke,
		LineHeight = var12.LineHeight,
		FontSize = var12.FontSize,
		FontWeight = var12.FontWeight,
		Time = var12.Time,
		Typography = var12.Typography
	}
	
	if p7 then
		applyTokenOverrides(t, p7)
	end
	return t
end

return {
	getTokens = getTokens,
	defaultTokens = getTokens(themeModule.Dark, deviceModule.Desktop)
}