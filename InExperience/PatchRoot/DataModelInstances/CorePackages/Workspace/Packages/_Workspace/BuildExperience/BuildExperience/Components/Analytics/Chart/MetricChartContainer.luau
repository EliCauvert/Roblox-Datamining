local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local dataStatus = require(parent.DataHydration.ExperienceAnalytics).DataStatus
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local useExperienceMetricSeriesModule = require(buildExperience.Analytics.useExperienceMetricSeries)
local metricChartModule = require(script.Parent.MetricChart)
local PLOT_HEIGHT = require(script.Parent.chartLayout).PLOT_HEIGHT

local function MetricChartSkeleton(p1)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref), PLOT_HEIGHT (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "MetricChart.Skeleton",
		LayoutOrder = p1.layoutOrder
	}, {
		Title = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			radius = radius.Small,
			Size = UDim2.new(0.4, 0, 0, 22)
		}),
		Summary = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Small,
			Size = UDim2.new(0.6, 0, 0, 16)
		}),
		Value = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			radius = radius.Small,
			Size = UDim2.new(0.25, 0, 0, 32)
		}),
		Plot = reactModule.createElement(skeleton, {
			LayoutOrder = 4,
			radius = radius.Medium,
			Size = UDim2.new(1, 0, 0, PLOT_HEIGHT)
		})
	})
end

local function MetricChartEmpty(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "MetricChart.Empty",
		LayoutOrder = p1.layoutOrder
	}, {
		Message = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-align-x-left content-muted",
			Text = p1.message
		})
	})
end

return function(p1)
	-- upvalues: dataStatus (ref), useExperienceMetricSeriesModule (ref), useLocalization (ref), analyticsKeysModule (ref), reactModule (ref), MetricChartEmpty (ref), MetricChartSkeleton (ref), metricChartModule (ref)
	local var1 = if p1.metadataStatus == dataStatus.Failed then nil else p1.latestAvailableTime
	local var2 = useExperienceMetricSeriesModule(p1.universeId, p1.metric, p1.window, var1)
	local noData = useLocalization({ noData = analyticsKeysModule.ANALYTICS_NO_DATA }).noData
	
	return if if p1.metadataStatus ~= dataStatus.Failed then p1.metadataStatus == dataStatus.Ready and p1.latestAvailableTime == nil else true then reactModule.createElement(MetricChartEmpty, { layoutOrder = p1.layoutOrder, message = noData }) elseif var2.status == dataStatus.NotReady then reactModule.createElement(MetricChartSkeleton, { layoutOrder = p1.layoutOrder }) elseif var2.status == dataStatus.Failed or not var2.hasData then reactModule.createElement(MetricChartEmpty, { layoutOrder = p1.layoutOrder, message = noData }) else reactModule.createElement(metricChartModule, {
		series = var2.series,
		hasData = var2.hasData,
		latest = var2.latest,
		trendPct = var2.trendPct,
		priorValue = var2.priorValue,
		metric = p1.metric,
		window = p1.window,
		latestAvailableTime = var1,
		hideIcon = p1.hideIcon,
		summary = p1.summary,
		layoutOrder = p1.layoutOrder
	})
end