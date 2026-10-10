local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent.Localization).Hooks.useLocalization
local dataStatus = require(parent.DataHydration.ExperienceAnalytics).DataStatus
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)
local useGoalMetricSummaryModule = require(buildExperience.Analytics.Goals.useGoalMetricSummary)
local formatStatNumberModule = require(buildExperience.Analytics.formatStatNumber)
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

local function buildLocalizationRequest(p1)
	local t = {}
	
	if p1.type == "translationTemplate" then
		local list = { p1.template }
		
		for i, v in p1.values do
			list[i] = v
		end
		t.valueText = list
		
		return t
	elseif p1.type == "translationKey" then
		t.valueText = p1.key
	end
	return t
end

return function(p2)
	-- upvalues: useGoalMetricSummaryModule (ref), dataStatus (ref), getNumberValueText (ref), getBreakdownValueText (ref), useLocalization (ref), buildLocalizationRequest (ref), noDataPlaceholderModule (ref)
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
	return {
		title = p2.title,
		valueText = if var3.type == "empty" then noDataPlaceholderModule elseif var3.type == "raw" then var3.value else useLocalization(buildLocalizationRequest(var3)).valueText,
		isLoading = var2,
		layoutOrder = p2.layoutOrder,
		testId = p2.testId
	}
end