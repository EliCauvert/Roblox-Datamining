local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local DataStatus = require(Parent.DataHydration.CreatorAnalytics).DataStatus
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local UseExperienceMetricSeriesModule = require(BuildExperience.Analytics.useExperienceMetricSeries)
local FFlagBuildAnalyticsCreatorHubWindowFixModule = require(BuildExperience.Flags.FFlagBuildAnalyticsCreatorHubWindowFix)
local MetricChartModule = require(script.Parent.MetricChart)
local PLOTHEIGHT = require(script.Parent.chartLayout).PLOT_HEIGHT

local function MetricChartSkeleton(p1)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), PLOTHEIGHT (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "MetricChart.Skeleton",
		LayoutOrder = p1.layoutOrder
	}, {
		Title = ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			radius = Radius.Small,
			Size = UDim2.new(0.4, 0, 0, 22)
		}),
		Summary = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			radius = Radius.Small,
			Size = UDim2.new(0.6, 0, 0, 16)
		}),
		Value = ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			radius = Radius.Small,
			Size = UDim2.new(0.25, 0, 0, 32)
		}),
		Plot = ReactModule.createElement(Skeleton, {
			LayoutOrder = 4,
			radius = Radius.Medium,
			Size = UDim2.new(1, 0, 0, PLOTHEIGHT)
		})
	})
end

local function MetricChartEmpty(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "MetricChart.Empty",
		LayoutOrder = p1.layoutOrder
	}, {
		Message = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-align-x-left content-muted",
			Text = p1.message
		})
	})
end

return function(p1)
	-- upvalues: DataStatus (copy), UseExperienceMetricSeriesModule (copy), UseLocalizationFunction (copy), AnalyticsKeysModule (copy), ReactModule (copy), MetricChartEmpty (copy), MetricChartSkeleton (copy), FFlagBuildAnalyticsCreatorHubWindowFixModule (copy), MetricChartModule (copy)
	local LatestAvailableTime = if p1.metadataStatus == DataStatus.Failed then nil else p1.latestAvailableTime
	local UseExperienceMetricSeriesModuleResult = UseExperienceMetricSeriesModule(p1.universeId, p1.metric, p1.window, LatestAvailableTime)
	local NoData = UseLocalizationFunction({ noData = AnalyticsKeysModule.ANALYTICS_NO_DATA }).noData
	
	if p1.metadataStatus == DataStatus.Failed or p1.metadataStatus == DataStatus.Ready and p1.latestAvailableTime == nil then
		return ReactModule.createElement(MetricChartEmpty, { layoutOrder = p1.layoutOrder, message = NoData })
	elseif UseExperienceMetricSeriesModuleResult.status == DataStatus.NotReady then
		return ReactModule.createElement(MetricChartSkeleton, { layoutOrder = p1.layoutOrder })
	else
		local NoHasData: boolean = if FFlagBuildAnalyticsCreatorHubWindowFixModule then not UseExperienceMetricSeriesModuleResult.hasData else UseExperienceMetricSeriesModuleResult.status == DataStatus.Failed or not UseExperienceMetricSeriesModuleResult.hasData
		
		return if NoHasData then ReactModule.createElement(MetricChartEmpty, { layoutOrder = p1.layoutOrder, message = NoData }) else ReactModule.createElement(MetricChartModule, {
			series = UseExperienceMetricSeriesModuleResult.series,
			hasData = UseExperienceMetricSeriesModuleResult.hasData,
			latest = UseExperienceMetricSeriesModuleResult.latest,
			trendPct = UseExperienceMetricSeriesModuleResult.trendPct,
			priorValue = UseExperienceMetricSeriesModuleResult.priorValue,
			metric = p1.metric,
			window = p1.window,
			latestAvailableTime = LatestAvailableTime,
			hideIcon = p1.hideIcon,
			summary = p1.summary,
			layoutOrder = p1.layoutOrder
		})
	end
end