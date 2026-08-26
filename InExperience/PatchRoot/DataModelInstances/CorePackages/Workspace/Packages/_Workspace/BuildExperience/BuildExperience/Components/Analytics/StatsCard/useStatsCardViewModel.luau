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

local function formatNumber(p1, p2, p3)
	-- upvalues: statsCardValueFormatModule (ref), numberLocalization (ref)
	return if p2 == statsCardValueFormatModule.Regular then numberLocalization.localizeDecimal(p1, p3, 2) else numberLocalization.abbreviate(p1, p3)
end

local function computeNumberString(p1, p2, p3, p4)
	-- upvalues: statsCardUnitModule (ref), formatNumber (ref), numberLocalization (ref)
	if p2 == statsCardUnitModule.Percent then
		return formatNumber(p1 * 100, p3, p4)
	elseif p2 ~= statsCardUnitModule.Temporal then
		return formatNumber(p1, p3, p4)
	end
	local var1 = p1 / 60
	
	return if math.abs(var1) < 1 then numberLocalization.localizeDecimal(math.floor(var1 * 100 + 0.5) / 100, p4, 2) else formatNumber(math.floor(var1 * 10 + 0.5) / 10, p3, p4)
end

local function _(p1)
	-- upvalues: statsCardUnitModule (ref), localizationStringsModule (ref)
	return if p1 == statsCardUnitModule.Percent then localizationStringsModule.ANALYTICS_PERCENT_TEMPLATE elseif p1 == statsCardUnitModule.Temporal then localizationStringsModule.ANALYTICS_DURATION_TEMPLATE else nil
end

local _ = function(p1, p2)
	return string.gsub(p1, "{number}", function()
		-- upvalues: p2 (ref)
		return p2
	end)
end

return function(p1)
	-- upvalues: localizationService (ref), computeNumberString (ref), statsCardUnitModule (ref), localizationStringsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), reactModule (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var1 = computeNumberString(p1.statValue, p1.statUnit, p1.statValueFormat, robloxLocaleId)
	local statUnit = p1.statUnit
	local var2 = if statUnit == statsCardUnitModule.Percent then localizationStringsModule.ANALYTICS_PERCENT_TEMPLATE elseif statUnit == statsCardUnitModule.Temporal then localizationStringsModule.ANALYTICS_DURATION_TEMPLATE else nil
	local absValue = math.abs(p1.deltaValue)
	local var3 = absValue ~= 0
	local var4 = if var3 then computeNumberString(absValue, p1.deltaUnit, p1.deltaValueFormat, robloxLocaleId) else nil
	local deltaUnit = p1.deltaUnit
	local var5 = if deltaUnit == statsCardUnitModule.Percent then localizationStringsModule.ANALYTICS_PERCENT_TEMPLATE elseif deltaUnit == statsCardUnitModule.Temporal then localizationStringsModule.ANALYTICS_DURATION_TEMPLATE else nil
	local t = {}
	
	if fFlagBuildLocalization then
		if var2 ~= nil then
			t.statText = { var2, number = var1 }
		end
		if var3 and var5 ~= nil then
			t.deltaText = { var5, number = var4 }
		end
	end
	local var6 = if fFlagBuildLocalization then useLocalization(t) else nil
	local var7 = if var2 == nil then var1 elseif fFlagBuildLocalization then var6.statText else string.gsub(var2, "{number}", function()
		-- upvalues: var1 (ref)
		return var1
	end)
	local var8 = if var3 then if var5 == nil then var4 elseif fFlagBuildLocalization then var6.deltaText else string.gsub(var5, "{number}", function()
		-- upvalues: var4 (ref)
		return var4
	end) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), var7 (write), var8 (write)
		return {
			title = p1.title,
			statText = var7,
			statIcon = p1.statIcon,
			statIconPosition = p1.statIconPosition,
			deltaText = var8,
			deltaIcon = p1.deltaIcon,
			deltaIconPosition = p1.deltaIconPosition,
			isDeltaPositive = p1.deltaValue > 0,
			onActivated = p1.onActivated,
			layoutOrder = p1.layoutOrder,
			testId = p1.testId
		}
	end, {
		p1.title, var7, p1.statIcon, p1.statIconPosition, var8, p1.deltaIcon,
		p1.deltaIconPosition, p1.deltaValue, p1.onActivated, p1.layoutOrder,
		p1.testId
	})
end