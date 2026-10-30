local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DataStatus = require(Parent.DataHydration.CreatorAnalytics).DataStatus
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local UseGoalMetricSummaryModule = require(BuildExperience.Analytics.Goals.useGoalMetricSummary)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local FormatStatNumberModule = require(BuildExperience.Analytics.formatStatNumber)
local MetricValueRoundsToZeroModule = require(BuildExperience.Analytics.metricValueRoundsToZero)
local RoundToDecimalsModule = require(BuildExperience.Analytics.roundToDecimals)
local ScaleValueToUnitModule = require(BuildExperience.Analytics.scaleValueToUnit)
local MetricUnitTemplateModule = require(BuildExperience.Analytics.metricUnitTemplate)
local NoDataPlaceholderModule = require(BuildExperience.Components.Analytics.noDataPlaceholder)
local _ = require(script.Parent.GoalMetricRowView)

local function getNumberValueText(Summary, p1)
	-- upvalues: LocalizationService (copy), FormatStatNumberModule (copy), MetricUnitTemplateModule (copy)
	local Regular = FormatStatNumberModule(p1.value, Summary.format.unit, "Regular", LocalizationService.RobloxLocaleId)
	local TemplateForResult = MetricUnitTemplateModule.templateFor(Summary.format.unit)
	
	return if TemplateForResult == nil then { type = "raw", value = Regular } else {
		type = "translationTemplate",
		template = TemplateForResult,
		values = { number = Regular }
	}
end

local function getBreakdownValueText(Summary, p1)
	local Format = Summary.format
	
	if Format.type == "custom" then
		return {
			type = "raw",
			value = Format.formatter(p1.metric, p1.breakdown)
		}
	else
		local TranslationKeyForResult = Format.translationKeyFor(p1.metric, p1.breakdown)
		
		return if TranslationKeyForResult == nil then { type = "empty" } else { type = "translationKey", key = TranslationKeyForResult }
	end
end

local function getNumberDelta(Summary, p1)
	-- upvalues: LocalizationService (copy), MetricValueRoundsToZeroModule (copy), ScaleValueToUnitModule (copy), AnalyticsUnitModule (copy), RoundToDecimalsModule (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local PriorValue = p1.priorValue
	local TrendPct: number = p1.trendPct
	
	if PriorValue == nil or TrendPct == nil then
		return nil
	elseif MetricValueRoundsToZeroModule(ScaleValueToUnitModule(PriorValue, Summary.format.unit), Summary.format.unit, nil, RobloxLocaleId) or MetricValueRoundsToZeroModule(TrendPct, AnalyticsUnitModule.Percent, nil, RobloxLocaleId) then
		return nil
	else
		local RoundToDecimalsModuleResultRatio = RoundToDecimalsModule(math.abs(TrendPct) * 100, 1) / 100
		
		return if RoundToDecimalsModuleResultRatio == 0 then nil else {
			magnitude = RoundToDecimalsModuleResultRatio,
			isPositive = TrendPct > 0
		}
	end
end

local function getDeltaValueText(p1)
	-- upvalues: LocalizationService (copy), FormatStatNumberModule (copy), AnalyticsUnitModule (copy), MetricUnitTemplateModule (copy)
	local Regular = FormatStatNumberModule(p1.magnitude, AnalyticsUnitModule.Percent, "Regular", LocalizationService.RobloxLocaleId)
	local TemplateForResult = MetricUnitTemplateModule.templateFor(AnalyticsUnitModule.Percent)
	
	return if TemplateForResult == nil then { type = "raw", value = Regular } else {
		type = "translationTemplate",
		template = TemplateForResult,
		values = { number = Regular }
	}
end

local function buildLocalizationRequest(List)
	local Keys = {}
	
	for i, value in List do
		if value.type ~= "translationTemplate" then
			if value.type == "translationKey" then
				Keys[i] = value.key
				continue
			end
			continue
		end
		local list = { value.template }
		
		for i1, value1 in value.values do
			list[i1] = value1
		end
		Keys[i] = list
	end
	return Keys
end

return function(p1)
	-- upvalues: UseGoalMetricSummaryModule (copy), DataStatus (copy), getNumberValueText (copy), getBreakdownValueText (copy), getNumberDelta (copy), getDeltaValueText (copy), UseLocalizationFunction (copy), buildLocalizationRequest (copy), NoDataPlaceholderModule (copy)
	local Summary = p1.summary
	local UseGoalMetricSummaryModuleResult = UseGoalMetricSummaryModule(p1.universeId, Summary.source, p1.window, p1.latestAvailableTime)
	local Value = UseGoalMetricSummaryModuleResult.value
	local HasLatestAvailableTime = p1.latestAvailableTime ~= nil
	local IsMetadataStatusMatch: boolean = p1.metadataStatus == DataStatus.NotReady or p1.metadataStatus == DataStatus.Ready and (HasLatestAvailableTime and UseGoalMetricSummaryModuleResult.status == DataStatus.NotReady)
	local Config = if Value == nil then { type = "empty" } elseif Summary.kind == "number" then getNumberValueText(Summary, Value) elseif Summary.kind == "breakdown" then getBreakdownValueText(Summary, Value) else nil
	local NumberDelta = if Value == nil or Summary.kind ~= "number" then nil else getNumberDelta(Summary, Value)
	local Config1 = if NumberDelta == nil then { type = "empty" } else getDeltaValueText(NumberDelta)
	local UseLocalizationResult = UseLocalizationFunction((buildLocalizationRequest({ valueText = Config, deltaText = Config1 })))
	
	return {
		title = p1.title,
		valueText = if Config.type == "empty" then NoDataPlaceholderModule elseif Config.type == "raw" then Config.value else UseLocalizationResult.valueText,
		icon = if Summary.kind == "number" then Summary.icon else nil,
		deltaText = if Config1.type == "raw" then Config1.value elseif Config1.type == "empty" then nil else UseLocalizationResult.deltaText,
		isDeltaPositive = NumberDelta ~= nil and NumberDelta.isPositive,
		isLoading = IsMetadataStatusMatch,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end