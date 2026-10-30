local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local NumberLocalization = LocalizationModule.NumberLocalization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local IconName = require(Parent.Foundation).Enums.IconName
local DataStatus = require(Parent.DataHydration.CreatorAnalytics).DataStatus
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local AnalyticsMetricModule = require(BuildExperience.Analytics.AnalyticsMetric)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local AnalyticsWindowModule = require(BuildExperience.Analytics.AnalyticsWindow)
local UseMetricMetadataModule = require(BuildExperience.Analytics.useMetricMetadata)
local UseOverviewStatsModule = require(BuildExperience.Analytics.useOverviewStats)
local UseInstantStatsModule = require(BuildExperience.Analytics.useInstantStats)
local _ = require(BuildExperience.Components.Analytics.StatsCard.StatsCard)
local _ = require(script.Parent.InstantStatCard)
local _ = require(script.Parent.AnalyticsOverviewView)
local MetricValueRoundsToZeroModule = require(BuildExperience.Analytics.metricValueRoundsToZero)
local ScaleValueToUnitModule = require(BuildExperience.Analytics.scaleValueToUnit)
local Ids = {}

for _, overviewMetric in AnalyticsMetricModule.OverviewMetrics do
	table.insert(Ids, overviewMetric.id)
end
local NoDataPlaceholderModule = require(BuildExperience.Components.Analytics.noDataPlaceholder)

return function(UniverseId, Window, Id, MetricId, Callback)
	-- upvalues: LocalizationService (copy), UseMetricMetadataModule (copy), Ids (copy), UseOverviewStatsModule (copy), UseInstantStatsModule (copy), AnalyticsKeysModule (copy), AnalyticsWindowModule (copy), AnalyticsMetricModule (copy), UseLocalizationFunction (copy), ScaleValueToUnitModule (copy), DataStatus (copy), MetricValueRoundsToZeroModule (copy), AnalyticsUnitModule (copy), ReactModule (copy), IconName (copy), NumberLocalization (copy), NoDataPlaceholderModule (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local UseMetricMetadataModuleResult = UseMetricMetadataModule(Ids)
	local UseOverviewStatsModuleResult = UseOverviewStatsModule(UniverseId, Window, UseMetricMetadataModuleResult.latestByMetric)
	local UseInstantStatsModuleResult = UseInstantStatsModule(UniverseId)
	local Copy = table.clone({
		overviewTitle = AnalyticsKeysModule.ANALYTICS_OVERVIEW_TITLE,
		keyStatsTitle = AnalyticsKeysModule.ANALYTICS_KEY_STATS_TITLE,
		visits = AnalyticsKeysModule.ANALYTICS_INSTANT_VISITS,
		players = AnalyticsKeysModule.ANALYTICS_INSTANT_PLAYERS,
		likes = AnalyticsKeysModule.ANALYTICS_INSTANT_LIKES,
		[AnalyticsWindowModule.LastWeek.id] = AnalyticsWindowModule.LastWeek.labelKey,
		[AnalyticsWindowModule.LastMonth.id] = AnalyticsWindowModule.LastMonth.labelKey
	})
	
	for _, overviewMetric in AnalyticsMetricModule.OverviewMetrics do
		Copy[overviewMetric.id] = overviewMetric.titleKey
	end
	local UseLocalizationResult = UseLocalizationFunction(Copy)
	
	local function _(p1)
		-- upvalues: UseLocalizationResult (copy)
		return UseLocalizationResult[p1]
	end
	
	local _ = function(p1)
		-- upvalues: UseLocalizationResult (copy)
		return UseLocalizationResult[p1.id]
	end
	
	local StatsCards = {}
	
	for LayoutOrder, overviewMetric1 in AnalyticsMetricModule.OverviewMetrics do
		local UseOverviewStatsModuleResultEntry = UseOverviewStatsModuleResult[overviewMetric1.id]
		local ScaleValueToUnitModuleResult = ScaleValueToUnitModule(UseOverviewStatsModuleResultEntry.latest or 0, overviewMetric1.unit)
		local HasLatestByMetricEntry: boolean = UseMetricMetadataModuleResult.latestByMetric ~= nil and UseMetricMetadataModuleResult.latestByMetric[overviewMetric1.id] ~= nil
		local IsStatusMatch: boolean = UseMetricMetadataModuleResult.status == DataStatus.NotReady or UseMetricMetadataModuleResult.status == DataStatus.Ready and (HasLatestByMetricEntry and UseOverviewStatsModuleResultEntry.status == DataStatus.NotReady)
		local ScaleValueToUnitModuleResult1 = if UseOverviewStatsModuleResultEntry.priorValue == nil then nil else ScaleValueToUnitModule(UseOverviewStatsModuleResultEntry.priorValue, overviewMetric1.unit)
		local NoScaleValueToUnitModuleResult: boolean = ScaleValueToUnitModuleResult1 == nil or not MetricValueRoundsToZeroModule(ScaleValueToUnitModuleResult1, overviewMetric1.unit, nil, RobloxLocaleId)
		StatsCards[LayoutOrder] = {
			title = UseLocalizationResult[overviewMetric1.id],
			statValue = ScaleValueToUnitModuleResult,
			statUnit = overviewMetric1.unit,
			statIcon = overviewMetric1.icon,
			deltaValue = if NoScaleValueToUnitModuleResult then UseOverviewStatsModuleResultEntry.trendPct else ScaleValueToUnitModuleResult,
			deltaUnit = if NoScaleValueToUnitModuleResult then AnalyticsUnitModule.Percent else overviewMetric1.unit,
			hasData = UseOverviewStatsModuleResultEntry.hasData,
			isLoading = IsStatusMatch,
			isSelected = overviewMetric1.id == Id,
			onActivated = if UseOverviewStatsModuleResultEntry.hasData then function()
				-- upvalues: Callback (copy), overviewMetric1 (copy)
				Callback(overviewMetric1.id)
			end else nil,
			layoutOrder = LayoutOrder,
			testId = "stat-" .. overviewMetric1.id
		}
	end
	local Visits = UseLocalizationResult.visits
	local Players = UseLocalizationResult.players
	local Likes = UseLocalizationResult.likes
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Visits (copy), IconName (upval), UseInstantStatsModuleResult (copy), Players (copy), Likes (copy), NumberLocalization (upval), RobloxLocaleId (copy), NoDataPlaceholderModule (upval)
		local t = {}
		
		for i, value in {
			{
				key = "visits",
				label = Visits,
				icon = IconName.Eye,
				value = UseInstantStatsModuleResult.visits,
				isLoading = UseInstantStatsModuleResult.visitsLoading
			},
			{
				key = "players",
				label = Players,
				icon = IconName.ThreePeople,
				value = UseInstantStatsModuleResult.players,
				isLoading = UseInstantStatsModuleResult.playersLoading
			},
			{
				key = "likes",
				label = Likes,
				icon = IconName.ThumbUp,
				value = UseInstantStatsModuleResult.likes,
				isLoading = UseInstantStatsModuleResult.likesLoading
			}
		} do
			t[i] = {
				label = value.label,
				valueText = if value.value == nil then NoDataPlaceholderModule else NumberLocalization.localize(value.value, RobloxLocaleId),
				icon = value.icon,
				isLoading = value.isLoading,
				testId = "instant-" .. value.key
			}
		end
		return t
	end, {
		UseInstantStatsModuleResult,
		RobloxLocaleId,
		Visits,
		Players,
		Likes
	})
	local Windows = {}
	
	for i, window in AnalyticsWindowModule.Windows do
		Windows[i] = { id = window.id, label = UseLocalizationResult[window.id] }
	end
	return {
		overviewTitle = UseLocalizationResult.overviewTitle,
		keyStatsTitle = UseLocalizationResult.keyStatsTitle,
		instantStats = UseMemoResult,
		statsCards = StatsCards,
		windows = Windows,
		sheet = if MetricId == nil or AnalyticsMetricModule.MetricById[MetricId] == nil then nil else {
			metricId = MetricId,
			universeId = UniverseId,
			window = Window,
			latestAvailableTime = if UseMetricMetadataModuleResult.latestByMetric == nil then nil else UseMetricMetadataModuleResult.latestByMetric[MetricId],
			metadataStatus = UseMetricMetadataModuleResult.status
		}
	}
end