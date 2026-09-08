local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local deriveChartAxesModule = require(buildExperience.Analytics.deriveChartAxes)
local fillMetricSeriesGapsModule = require(buildExperience.Analytics.fillMetricSeriesGaps)
local formatMetricValueModule = require(buildExperience.Analytics.formatMetricValue)
local formatMetricTimestampModule = require(buildExperience.Analytics.formatMetricTimestamp)
local metricValueRoundsToZeroModule = require(buildExperience.Analytics.metricValueRoundsToZero)
local _ = require(buildExperience.Analytics.metricUnitTemplate)
local scaleValueToUnitModule = require(buildExperience.Analytics.scaleValueToUnit)
local _ = require(script.Parent.MetricChartView)
local noDataPlaceholderModule = require(buildExperience.Components.Analytics.noDataPlaceholder)
local list = {
	analyticsKeysModule.ANALYTICS_MONTH_JAN,
	analyticsKeysModule.ANALYTICS_MONTH_FEB,
	analyticsKeysModule.ANALYTICS_MONTH_MAR,
	analyticsKeysModule.ANALYTICS_MONTH_APR,
	analyticsKeysModule.ANALYTICS_MONTH_MAY,
	analyticsKeysModule.ANALYTICS_MONTH_JUN,
	analyticsKeysModule.ANALYTICS_MONTH_JUL,
	analyticsKeysModule.ANALYTICS_MONTH_AUG,
	analyticsKeysModule.ANALYTICS_MONTH_SEP,
	analyticsKeysModule.ANALYTICS_MONTH_OCT,
	analyticsKeysModule.ANALYTICS_MONTH_NOV,
	analyticsKeysModule.ANALYTICS_MONTH_DEC
}

return function(p1)
	-- upvalues: foundationModule (ref), localizationService (ref), reactModule (ref), analyticsKeysModule (ref), list (ref), useLocalization (ref), fillMetricSeriesGapsModule (ref), deriveChartAxesModule (ref), formatMetricValueModule (ref), scaleValueToUnitModule (ref), formatMetricTimestampModule (ref), noDataPlaceholderModule (ref), metricValueRoundsToZeroModule (ref), analyticsUnitModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = foundationModule.Hooks.useTextSizeOffset()
	local robloxLocaleId = localizationService.RobloxLocaleId
	local metric = p1.metric
	local unit = metric.unit
	local bodySmall = var1.Typography.BodySmall
	local font = bodySmall.Font
	local var3 = if typeof(font) == "EnumItem" then font else Enum.Font.BuilderSans
	local var4 = bodySmall.FontSize + (var2 or 0)
	local var5, var6 = reactModule.useState(nil)
	local var7, var8 = reactModule.useState(false)
	local t = {
		title = metric.titleKey,
		percent = analyticsKeysModule.ANALYTICS_PERCENT_TEMPLATE,
		duration = analyticsKeysModule.ANALYTICS_DURATION_TEMPLATE
	}
	
	for i, v in list do
		t["month" .. i] = v
	end
	local var9 = useLocalization(t)
	local title = var9.title
	local t_1 = {}
	
	for i_1, v_1 in list do
		t_1[i_1] = var9["month" .. i_1]
	end
	local t_2 = { percent = var9.percent, duration = var9.duration }
	local var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fillMetricSeriesGapsModule (copy)
		local t = nil
		
		if p1.window ~= nil and p1.latestAvailableTime ~= nil then
			local dateTime = DateTime.fromIsoDate(p1.latestAvailableTime)
			
			if dateTime ~= nil then
				t = {
					lookbackSeconds = p1.window.lookbackSeconds,
					endUnix = dateTime.UnixTimestamp
				}
			end
		end
		return fillMetricSeriesGapsModule(p1.series, t)
	end, { p1.series, p1.window, p1.latestAvailableTime })
	local var11 = reactModule.useMemo(function()
		-- upvalues: deriveChartAxesModule (copy), var10 (ref)
		return deriveChartAxesModule(var10)
	end, { var10 })
	local pointsCount = #var11.points
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: pointsCount (ref), var6 (ref)
		if pointsCount == 0 then
			return
		end
		var6(math.clamp(math.round(p2.X) + 1, 1, pointsCount))
	end, { pointsCount })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var6 (ref)
		if not var7 then
			var6(nil)
		end
	end, { var7 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var12 (ref)
		var8(true)
		var12(p2)
	end, { var12 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var6 (ref)
		var8(false)
		var6(nil)
	end, {})
	local var16 = if var10 ~= nil then nil else var10.dataPoints
	local var17 = if var10 ~= nil then "None" else var10.granularity
	local list_1 = { metric.id }
	
	if var16 ~= nil then
		for i_2, v_2 in var16 do
			table.insert(list_1, `{v_2.time}:{v_2.value}`)
		end
	end
	local joined = table.concat(list_1, "|")
	local t_3 = {}
	
	for i_2, v_2 in var11.yTicks do
		t_3[i_2] = {
			position = v_2,
			label = formatMetricValueModule(scaleValueToUnitModule(v_2, unit), unit, robloxLocaleId, t_2)
		}
	end
	local t_4 = {}
	
	if var16 ~= nil then
		for i_3, v_3 in var16 do
			t_4[i_3] = formatMetricTimestampModule(v_3.time, var17, t_1)
		end
	end
	local var18 = scaleValueToUnitModule(p1.latest or 0, unit)
	local var19 = if p1.hasData and p1.latest ~= nil then formatMetricValueModule(var18, unit, robloxLocaleId, t_2) else noDataPlaceholderModule
	local var20 = if p1.priorValue ~= nil then nil else scaleValueToUnitModule(p1.priorValue, unit)
	local var21 = if var20 ~= nil then not metricValueRoundsToZeroModule(var20, unit, nil, robloxLocaleId) else true
	local var22 = nil
	local var23 = false
	
	if p1.hasData then
		if var21 then
			if not metricValueRoundsToZeroModule(p1.trendPct, analyticsUnitModule.Percent, nil, robloxLocaleId) then
				var22 = formatMetricValueModule(math.abs(p1.trendPct), analyticsUnitModule.Percent, robloxLocaleId, t_2)
				local _ = p1.trendPct > 0
			end
		elseif not metricValueRoundsToZeroModule(var18, unit, nil, robloxLocaleId) then
			var22 = formatMetricValueModule(var18, unit, robloxLocaleId, t_2)
			var23 = var18 > 0
		end
	end
	local t_5 = nil
	
	if var5 ~= nil and var16 ~= nil and (var5 >= 1 and var5 <= #var16) then
		local var24 = var16[var5]
		t_5 = {
			date = formatMetricTimestampModule(var24.time, var17, t_1),
			valueText = formatMetricValueModule(scaleValueToUnitModule(var24.value, unit), unit, robloxLocaleId, t_2, "Full")
		}
	end
	local success = var1.Color.System.Success
	
	return {
		layoutOrder = p1.layoutOrder,
		plotKey = joined,
		title = title,
		summary = p1.summary,
		valueText = var19,
		icon = if p1.hideIcon then nil else metric.chartIcon or metric.icon,
		deltaText = var22,
		isDeltaPositive = var23,
		hasData = p1.hasData,
		points = var11.points,
		minX = var11.minX,
		maxX = var11.maxX,
		minY = var11.minY,
		maxY = var11.maxY,
		yTicks = t_3,
		xAxisLabels = t_4,
		labelFont = var3,
		labelFontSize = var4,
		inspectedIndex = var5,
		tooltip = t_5,
		onHoverStart = var12,
		onHoverMoved = var12,
		onHoverEnded = var13,
		onPress = var12,
		onDragStart = var14,
		onDragMoved = var12,
		onDragEnded = var15,
		colors = {
			line = var1.Color.System.Emphasis,
			grid = var1.Color.Stroke.Default,
			axisLabel = var1.Color.Content.Default,
			muted = var1.Color.Content.Muted,
			emphasis = var1.Color.Content.Emphasis,
			surface = var1.Color.Surface.Surface_100,
			positive = success,
			positiveBackground = {
				Color3 = success.Color3,
				Transparency = var1.Color.Shift.Shift_300.Transparency
			},
			tooltipBackground = var1.Color.System.Contrast,
			tooltipContent = var1.Inverse.Content.Emphasis
		}
	}
end