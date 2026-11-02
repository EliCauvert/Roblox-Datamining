local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local _ = require(Parent.AnalyticsMetricChart)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local _ = require(Parent.DataHydration.CreatorAnalytics)
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local FillMetricSeriesGapsModule = require(BuildExperience.Analytics.fillMetricSeriesGaps)
local FormatMetricValueModule = require(BuildExperience.Analytics.formatMetricValue)
local FormatMetricTimestampModule = require(BuildExperience.Analytics.formatMetricTimestamp)
local MetricValueRoundsToZeroModule = require(BuildExperience.Analytics.metricValueRoundsToZero)
local _ = require(BuildExperience.Analytics.metricUnitTemplate)
local ScaleValueToUnitModule = require(BuildExperience.Analytics.scaleValueToUnit)
local FFlagBuildAnalyticsGoalsModule = require(BuildExperience.Flags.FFlagBuildAnalyticsGoals)
local NoDataPlaceholderModule = require(BuildExperience.Components.Analytics.noDataPlaceholder)
local list = {
	AnalyticsKeysModule.ANALYTICS_MONTH_JAN,
	AnalyticsKeysModule.ANALYTICS_MONTH_FEB,
	AnalyticsKeysModule.ANALYTICS_MONTH_MAR,
	AnalyticsKeysModule.ANALYTICS_MONTH_APR,
	AnalyticsKeysModule.ANALYTICS_MONTH_MAY,
	AnalyticsKeysModule.ANALYTICS_MONTH_JUN,
	AnalyticsKeysModule.ANALYTICS_MONTH_JUL,
	AnalyticsKeysModule.ANALYTICS_MONTH_AUG,
	AnalyticsKeysModule.ANALYTICS_MONTH_SEP,
	AnalyticsKeysModule.ANALYTICS_MONTH_OCT,
	AnalyticsKeysModule.ANALYTICS_MONTH_NOV,
	AnalyticsKeysModule.ANALYTICS_MONTH_DEC
}

return function(p1)
	-- upvalues: LocalizationService (copy), AnalyticsKeysModule (copy), FFlagBuildAnalyticsGoalsModule (copy), AnalyticsUnitModule (copy), list (copy), UseLocalizationFunction (copy), ReactModule (copy), FillMetricSeriesGapsModule (copy), ScaleValueToUnitModule (copy), FormatMetricValueModule (copy), NoDataPlaceholderModule (copy), MetricValueRoundsToZeroModule (copy), FormatMetricTimestampModule (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local Metric = p1.metric
	local Unit = Metric.unit
	local config = {
		title = Metric.titleKey,
		percent = AnalyticsKeysModule.ANALYTICS_PERCENT_TEMPLATE,
		duration = if FFlagBuildAnalyticsGoalsModule and Unit == AnalyticsUnitModule.Minutes then AnalyticsKeysModule.ANALYTICS_DURATION_MINUTES_TEMPLATE else AnalyticsKeysModule.ANALYTICS_DURATION_TEMPLATE
	}
	
	for i, value in list do
		config["month" .. i] = value
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Title = UseLocalizationResult.title
	local t = {}
	
	for i1, _ in list do
		t[i1] = UseLocalizationResult["month" .. i1]
	end
	local config1 = {
		percent = UseLocalizationResult.percent,
		duration = UseLocalizationResult.duration
	}
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FillMetricSeriesGapsModule (upval)
		local v1 = nil
		
		if p1.window ~= nil and p1.latestAvailableTime ~= nil then
			local _DateTime = DateTime.fromIsoDate(p1.latestAvailableTime)
			
			if _DateTime ~= nil then
				v1 = {
					lookbackSeconds = p1.window.lookbackSeconds,
					endUnix = _DateTime.UnixTimestamp
				}
			end
		end
		return FillMetricSeriesGapsModule(p1.series, v1)
	end, { p1.series, p1.window, p1.latestAvailableTime })
	local DataPoints = if UseMemoResult == nil then nil else UseMemoResult.dataPoints
	local None = if UseMemoResult == nil then "None" else UseMemoResult.granularity
	local ScaleValueToUnitModuleResult: number = ScaleValueToUnitModule(p1.latest or 0, Unit)
	local FormatMetricValueModuleResult = if p1.hasData and p1.latest ~= nil then FormatMetricValueModule(ScaleValueToUnitModuleResult, Unit, RobloxLocaleId, config1) else NoDataPlaceholderModule
	local ScaleValueToUnitModuleResult1 = if p1.priorValue == nil then nil else ScaleValueToUnitModule(p1.priorValue, Unit)
	local NoScaleValueToUnitModuleResult: boolean = ScaleValueToUnitModuleResult1 == nil or not MetricValueRoundsToZeroModule(ScaleValueToUnitModuleResult1, Unit, nil, RobloxLocaleId)
	local DeltaText = nil
	local IsTrendPctAbove = false
	
	if p1.hasData then
		if NoScaleValueToUnitModuleResult then
			if not MetricValueRoundsToZeroModule(p1.trendPct, AnalyticsUnitModule.Percent, nil, RobloxLocaleId) then
				DeltaText = FormatMetricValueModule(math.abs(p1.trendPct), AnalyticsUnitModule.Percent, RobloxLocaleId, config1)
				IsTrendPctAbove = p1.trendPct > 0
			end
		elseif not MetricValueRoundsToZeroModule(ScaleValueToUnitModuleResult, Unit, nil, RobloxLocaleId) then
			DeltaText = FormatMetricValueModule(ScaleValueToUnitModuleResult, Unit, RobloxLocaleId, config1)
			IsTrendPctAbove = ScaleValueToUnitModuleResult > 0
		end
	end
	return {
		layoutOrder = p1.layoutOrder,
		plotId = Metric.id,
		series = if DataPoints == nil then nil else { { id = Metric.id, name = Title, points = DataPoints } },
		hasData = p1.hasData,
		title = Title,
		summary = p1.summary,
		valueText = FormatMetricValueModuleResult,
		icon = if p1.hideIcon then nil else Metric.chartIcon or Metric.icon,
		deltaText = DeltaText,
		isDeltaPositive = IsTrendPctAbove,
		yAxisFormatter = function(p2)
			-- upvalues: FormatMetricValueModule (upval), ScaleValueToUnitModule (upval), Unit (copy), RobloxLocaleId (copy), config1 (copy)
			return FormatMetricValueModule(ScaleValueToUnitModule(p2.value, Unit), Unit, RobloxLocaleId, config1)
		end,
		xAxisFormatter = function(p2)
			-- upvalues: FormatMetricTimestampModule (upval), None (copy), t (copy)
			return FormatMetricTimestampModule(p2.value, None, t)
		end,
		tooltipFormatters = {
			formatXForPoint = function(p2)
				-- upvalues: FormatMetricTimestampModule (upval), None (copy), t (copy)
				return FormatMetricTimestampModule(p2, None, t)
			end,
			formatSeriesValueForPoint = function(p2)
				-- upvalues: FormatMetricValueModule (upval), ScaleValueToUnitModule (upval), Unit (copy), RobloxLocaleId (copy), config1 (copy)
				return FormatMetricValueModule(ScaleValueToUnitModule(p2.y, Unit), Unit, RobloxLocaleId, config1, "Full")
			end
		}
	}
end