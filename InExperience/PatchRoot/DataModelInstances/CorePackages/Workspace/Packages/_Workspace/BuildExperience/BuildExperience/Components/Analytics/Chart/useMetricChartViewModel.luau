local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local _ = require(Parent.DataHydration.ExperienceAnalytics)
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local DeriveChartAxesModule = require(BuildExperience.Analytics.deriveChartAxes)
local FillMetricSeriesGapsModule = require(BuildExperience.Analytics.fillMetricSeriesGaps)
local FormatMetricValueModule = require(BuildExperience.Analytics.formatMetricValue)
local FormatMetricTimestampModule = require(BuildExperience.Analytics.formatMetricTimestamp)
local MetricValueRoundsToZeroModule = require(BuildExperience.Analytics.metricValueRoundsToZero)
local _ = require(BuildExperience.Analytics.metricUnitTemplate)
local ScaleValueToUnitModule = require(BuildExperience.Analytics.scaleValueToUnit)
local _ = require(script.Parent.MetricChartView)
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
	-- upvalues: FoundationModule (copy), LocalizationService (copy), FoundationFontFaceMigration (copy), ReactModule (copy), AnalyticsKeysModule (copy), FFlagBuildAnalyticsGoalsModule (copy), AnalyticsUnitModule (copy), list (copy), UseLocalizationFunction (copy), FillMetricSeriesGapsModule (copy), DeriveChartAxesModule (copy), FormatMetricValueModule (copy), ScaleValueToUnitModule (copy), FormatMetricTimestampModule (copy), NoDataPlaceholderModule (copy), MetricValueRoundsToZeroModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local Metric = p1.metric
	local Unit = Metric.unit
	local BodySmall = UseTokensResult.Typography.BodySmall
	local BodySmallFont = BodySmall.Font
	local BodySmallFont1 = if FoundationFontFaceMigration then BodySmallFont elseif typeof(BodySmallFont) == "EnumItem" then BodySmallFont else Enum.Font.BuilderSans
	local NewFontSize = BodySmall.FontSize + (FoundationModule.Hooks.useTextSizeOffset() or 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
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
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: DeriveChartAxesModule (upval), UseMemoResult (copy)
		return DeriveChartAxesModule(UseMemoResult)
	end, { UseMemoResult })
	local CountPoints = #UseMemoResult1.points
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: CountPoints (copy), UseStateResult2 (copy)
		if CountPoints ~= 0 then
			UseStateResult2((math.clamp(math.round(p2.X) + 1, 1, CountPoints)))
			
			return
		end
	end, { CountPoints })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult1 then
			UseStateResult2(nil)
		end
	end, { UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy), UseResult (copy)
		UseStateResult2_1(true)
		UseResult(p2)
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
		UseStateResult2_1(false)
		UseStateResult2(nil)
	end, {})
	local DataPoints = if UseMemoResult == nil then nil else UseMemoResult.dataPoints
	local None = if UseMemoResult == nil then "None" else UseMemoResult.granularity
	local List = { Metric.id }
	
	if DataPoints ~= nil then
		for _, dataPoint in DataPoints do
			table.insert(List, `{dataPoint.time}:{dataPoint.value}`)
		end
	end
	local Joined = table.concat(List, "|")
	local YTicks = {}
	
	for i2, yTick in UseMemoResult1.yTicks do
		YTicks[i2] = {
			position = yTick,
			label = FormatMetricValueModule(ScaleValueToUnitModule(yTick, Unit), Unit, RobloxLocaleId, config1)
		}
	end
	local XAxisLabels = {}
	
	if DataPoints ~= nil then
		for i3, dataPoint1 in DataPoints do
			XAxisLabels[i3] = FormatMetricTimestampModule(dataPoint1.time, None, t)
		end
	end
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
	local Tooltip = nil
	
	if UseStateResult ~= nil and DataPoints ~= nil and UseStateResult >= 1 and UseStateResult <= #DataPoints then
		local DataPoint = DataPoints[UseStateResult]
		Tooltip = {
			date = FormatMetricTimestampModule(DataPoint.time, None, t),
			valueText = FormatMetricValueModule(ScaleValueToUnitModule(DataPoint.value, Unit), Unit, RobloxLocaleId, config1, "Full")
		}
	end
	local Success = UseTokensResult.Color.System.Success
	
	return {
		layoutOrder = p1.layoutOrder,
		plotKey = Joined,
		title = Title,
		summary = p1.summary,
		valueText = FormatMetricValueModuleResult,
		icon = if p1.hideIcon then nil else Metric.chartIcon or Metric.icon,
		deltaText = DeltaText,
		isDeltaPositive = IsTrendPctAbove,
		hasData = p1.hasData,
		points = UseMemoResult1.points,
		minX = UseMemoResult1.minX,
		maxX = UseMemoResult1.maxX,
		minY = UseMemoResult1.minY,
		maxY = UseMemoResult1.maxY,
		yTicks = YTicks,
		xAxisLabels = XAxisLabels,
		labelFont = BodySmallFont1,
		labelFontSize = NewFontSize,
		inspectedIndex = UseStateResult,
		tooltip = Tooltip,
		onHoverStart = UseResult,
		onHoverMoved = UseResult,
		onHoverEnded = UseResult1,
		onPress = UseResult,
		onDragStart = UseResult2,
		onDragMoved = UseResult,
		onDragEnded = UseResult3,
		colors = {
			line = UseTokensResult.Color.System.Emphasis,
			grid = UseTokensResult.Color.Stroke.Default,
			axisLabel = UseTokensResult.Color.Content.Default,
			muted = UseTokensResult.Color.Content.Muted,
			emphasis = UseTokensResult.Color.Content.Emphasis,
			surface = UseTokensResult.Color.Surface.Surface_100,
			positive = Success,
			positiveBackground = {
				Color3 = Success.Color3,
				Transparency = UseTokensResult.Color.Shift.Shift_300.Transparency
			},
			tooltipBackground = UseTokensResult.Color.System.Contrast,
			tooltipContent = UseTokensResult.Inverse.Content.Emphasis
		}
	}
end