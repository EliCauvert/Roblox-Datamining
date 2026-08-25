local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local numberLocalization = localizationModule.NumberLocalization
local useLocalization = localizationModule.Hooks.useLocalization
local fFlagBuildLocalization = require(parent.SharedFlags).FFlagBuildLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.StatsCardView)
local statsCardUnitModule = require(script.Parent.StatsCardUnit)
local statsCardValueFormatModule = require(script.Parent.StatsCardValueFormat)

local function formatNumber(p0, p1, p2)
	-- upvalues: statsCardValueFormatModule (ref), numberLocalization (ref)
	return if p1 == statsCardValueFormatModule.Regular then numberLocalization.localizeDecimal(p0, p2, 2) else numberLocalization.abbreviate(p0, p2)
end

local function computeNumberString(p3, p4, p5, p6)
	-- upvalues: statsCardUnitModule (ref), formatNumber (ref), numberLocalization (ref)
	if p4 == statsCardUnitModule.Percent then
		return formatNumber(p3 * 100, p5, p6)
	elseif p4 ~= statsCardUnitModule.Temporal then
		return formatNumber(p3, p5, p6)
	end
	local var9 = p3 / 60
	
	return if math.abs(var9) < 1 then numberLocalization.localizeDecimal(math.floor(var9 * 100 + 0.5) / 100, p6, 2) else formatNumber(math.floor(var9 * 10 + 0.5) / 10, p5, p6)
end

local function _(p7)
	-- upvalues: statsCardUnitModule (ref), localizationStringsModule (ref)
	return if p7 == statsCardUnitModule.Percent then localizationStringsModule.ANALYTICS_PERCENT_TEMPLATE elseif p7 == statsCardUnitModule.Temporal then localizationStringsModule.ANALYTICS_DURATION_TEMPLATE else nil
end

local _ = function(p8, p9)
	return string.gsub(p8, "{number}", function()
		-- upvalues: p9 (ref)
		return p9
	end)
end

return function(p10)
	-- upvalues: localizationService (ref), computeNumberString (ref), statsCardUnitModule (ref), localizationStringsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), reactModule (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var10 = computeNumberString(p10.statValue, p10.statUnit, p10.statValueFormat, robloxLocaleId)
	local statUnit = p10.statUnit
	local var11 = if statUnit == statsCardUnitModule.Percent then localizationStringsModule.ANALYTICS_PERCENT_TEMPLATE elseif statUnit == statsCardUnitModule.Temporal then localizationStringsModule.ANALYTICS_DURATION_TEMPLATE else nil
	local absValue = math.abs(p10.deltaValue)
	local var13 = absValue ~= 0
	local var14 = if var13 then computeNumberString(absValue, p10.deltaUnit, p10.deltaValueFormat, robloxLocaleId) else nil
	local deltaUnit = p10.deltaUnit
	local var15 = if deltaUnit == statsCardUnitModule.Percent then localizationStringsModule.ANALYTICS_PERCENT_TEMPLATE elseif deltaUnit == statsCardUnitModule.Temporal then localizationStringsModule.ANALYTICS_DURATION_TEMPLATE else nil
	local t = {}
	
	if fFlagBuildLocalization then
		if var11 ~= nil then
			t.statText = { var11, number = var10 }
		end
		if var13 and var15 ~= nil then
			t.deltaText = { var15, number = var14 }
		end
	end
	local var17 = if fFlagBuildLocalization then useLocalization(t) else nil
	local var18 = if var11 == nil then var10 elseif fFlagBuildLocalization then var17.statText else string.gsub(var11, "{number}", function()
		-- upvalues: var10 (ref)
		return var10
	end)
	local var19 = if var13 then if var15 == nil then var14 elseif fFlagBuildLocalization then var17.deltaText else string.gsub(var15, "{number}", function()
		-- upvalues: var14 (ref)
		return var14
	end) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: p10 (ref), var18 (write), var19 (write)
		return {
			title = p10.title,
			statText = var18,
			statIcon = p10.statIcon,
			statIconPosition = p10.statIconPosition,
			deltaText = var19,
			deltaIcon = p10.deltaIcon,
			deltaIconPosition = p10.deltaIconPosition,
			isDeltaPositive = p10.deltaValue > 0,
			onActivated = p10.onActivated,
			layoutOrder = p10.layoutOrder,
			testId = p10.testId
		}
	end, {
		p10.title, var18, p10.statIcon, p10.statIconPosition, var19, p10.deltaIcon,
		p10.deltaIconPosition, p10.deltaValue, p10.onActivated, p10.layoutOrder,
		p10.testId
	})
end