local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent.Localization).Hooks.useLocalization
local dataStatus = require(parent.DataHydration.ExperienceAnalytics).DataStatus
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)
local useGoalMetricSummaryModule = require(buildExperience.Analytics.Goals.useGoalMetricSummary)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local formatStatNumberModule = require(buildExperience.Analytics.formatStatNumber)
local metricValueRoundsToZeroModule = require(buildExperience.Analytics.metricValueRoundsToZero)
local roundToDecimalsModule = require(buildExperience.Analytics.roundToDecimals)
local scaleValueToUnitModule = require(buildExperience.Analytics.scaleValueToUnit)
local metricUnitTemplateModule = require(buildExperience.Analytics.metricUnitTemplate)
local noDataPlaceholderModule = require(buildExperience.Components.Analytics.noDataPlaceholder)
local _ = require(script.Parent.GoalMetricRowView)

local function getNumberValueText(p1, p2)
	-- upvalues: localizationService (ref), formatStatNumberModule (ref), metricUnitTemplateModule (ref)
	local var1 = formatStatNumberModule(p2.value, p1.format.unit, "Regular", localizationService.RobloxLocaleId)
	local var2 = metricUnitTemplateModule.templateFor(p1.format.unit)
	
	return if var2 == nil then { type = "raw", value = var1 } else {
		type = "translationTemplate",
		template = var2,
		values = { number = var1 }
	}
end

local function getBreakdownValueText(p1, p2)
	local translationKeyFor = p1.format.translationKeyFor
	
	if translationKeyFor == nil then
		return { type = "raw", value = p2.breakdown.value }
	end
	local var1 = translationKeyFor(p2.metric, p2.breakdown)
	
	return if var1 == nil then { type = "empty" } else { type = "translationKey", key = var1 }
end

local function getNumberDelta(p1, p2)
	-- upvalues: localizationService (ref), metricValueRoundsToZeroModule (ref), scaleValueToUnitModule (ref), analyticsUnitModule (ref), roundToDecimalsModule (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local priorValue = p2.priorValue
	local trendPct = p2.trendPct
	
	if priorValue == nil or trendPct == nil then
		return nil
	elseif metricValueRoundsToZeroModule(scaleValueToUnitModule(priorValue, p1.format.unit), p1.format.unit, nil, robloxLocaleId) or metricValueRoundsToZeroModule(trendPct, analyticsUnitModule.Percent, nil, robloxLocaleId) then
		return nil
	end
	local var1 = roundToDecimalsModule(math.abs(trendPct) * 100, 1) / 100
	
	return if var1 == 0 then nil else { magnitude = var1, isPositive = trendPct > 0 }
end

local function getDeltaValueText(p1)
	-- upvalues: localizationService (ref), formatStatNumberModule (ref), analyticsUnitModule (ref), metricUnitTemplateModule (ref)
	local var1 = formatStatNumberModule(p1.magnitude, analyticsUnitModule.Percent, "Regular", localizationService.RobloxLocaleId)
	local var2 = metricUnitTemplateModule.templateFor(analyticsUnitModule.Percent)
	
	return if var2 == nil then { type = "raw", value = var1 } else {
		type = "translationTemplate",
		template = var2,
		values = { number = var1 }
	}
end

local function buildLocalizationRequest(p1)
	local t = {}
	
	for i, v in p1 do
		if v.type ~= "translationTemplate" then
			if v.type == "translationKey" then
				t[i] = v.key
			end
		end
		local list = { v.template }
		
		for i_1, v_1 in v.values do
			list[i_1] = v_1
		end
		t[i] = list
	end
	return t
end

return function(p2)
	-- upvalues: useGoalMetricSummaryModule (ref), dataStatus (ref), getNumberValueText (ref), getBreakdownValueText (ref), getNumberDelta (ref), getDeltaValueText (ref), useLocalization (ref), buildLocalizationRequest (ref), noDataPlaceholderModule (ref)
	local summary = p2.summary
	local var1 = useGoalMetricSummaryModule(p2.universeId, summary.source, p2.window, p2.latestAvailableTime)
	local value = var1.value
	local var2 = if p2.metadataStatus ~= dataStatus.NotReady then p2.metadataStatus == dataStatus.Ready and (p2.latestAvailableTime ~= nil and var1.status == dataStatus.NotReady) else true
	local var3 = nil
	
	if value == nil then
		var3 = { type = "empty" }
	elseif summary.kind == "number" then
		var3 = getNumberValueText(summary, value)
	elseif summary.kind == "breakdown" then
		var3 = getBreakdownValueText(summary, value)
	end
	local var4 = if not (value == nil or summary.kind ~= "number") then getNumberDelta(summary, value) else nil
	local var5 = if var4 ~= nil then { type = "empty" } else getDeltaValueText(var4)
	local var6 = useLocalization(buildLocalizationRequest({ valueText = var3, deltaText = var5 }))
	local var7 = if var3.type == "empty" then noDataPlaceholderModule elseif var3.type == "raw" then var3.value else var6.valueText
	local deltaText = nil
	
	if var5.type == "raw" then
		deltaText = var5.value
	elseif var5.type ~= "empty" then
		deltaText = var6.deltaText
	end
	return {
		title = p2.title,
		valueText = var7,
		deltaText = deltaText,
		isDeltaPositive = var4 ~= nil and var4.isPositive,
		isLoading = var2,
		layoutOrder = p2.layoutOrder,
		testId = p2.testId
	}
end