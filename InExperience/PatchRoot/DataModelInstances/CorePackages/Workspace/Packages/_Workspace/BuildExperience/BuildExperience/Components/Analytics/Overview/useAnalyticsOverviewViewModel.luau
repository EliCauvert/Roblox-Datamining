local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local numberLocalization = localizationModule.NumberLocalization
local useLocalization = localizationModule.Hooks.useLocalization
local iconName = foundationModule.Enums.IconName
local dataStatus = require(parent.DataHydration.ExperienceAnalytics).DataStatus
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local analyticsMetricModule = require(buildExperience.Analytics.AnalyticsMetric)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local analyticsWindowModule = require(buildExperience.Analytics.AnalyticsWindow)
local useMetricMetadataModule = require(buildExperience.Analytics.useMetricMetadata)
local useOverviewStatsModule = require(buildExperience.Analytics.useOverviewStats)
local useInstantStatsModule = require(buildExperience.Analytics.useInstantStats)
local _ = require(buildExperience.Components.Analytics.StatsCard.StatsCard)
local _ = require(script.Parent.InstantStatCard)
local _ = require(script.Parent.AnalyticsOverviewView)
local metricValueRoundsToZeroModule = require(buildExperience.Analytics.metricValueRoundsToZero)
local scaleValueToUnitModule = require(buildExperience.Analytics.scaleValueToUnit)
local noDataPlaceholderModule = require(buildExperience.Components.Analytics.noDataPlaceholder)

return function(p1, p2, p3, p4, p5)
	-- upvalues: localizationService (ref), useMetricMetadataModule (ref), analyticsMetricModule (ref), useOverviewStatsModule (ref), useInstantStatsModule (ref), analyticsKeysModule (ref), analyticsWindowModule (ref), useLocalization (ref), scaleValueToUnitModule (ref), dataStatus (ref), metricValueRoundsToZeroModule (ref), analyticsUnitModule (ref), reactModule (ref), iconName (ref), numberLocalization (ref), noDataPlaceholderModule (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var1 = useMetricMetadataModule(analyticsMetricModule.OverviewMetrics)
	local var2 = useOverviewStatsModule(p1, p2, var1.latestByMetric)
	local var3 = useInstantStatsModule(p1)
	local cloned = table.clone({
		overviewTitle = analyticsKeysModule.ANALYTICS_OVERVIEW_TITLE,
		keyStatsTitle = analyticsKeysModule.ANALYTICS_KEY_STATS_TITLE,
		visits = analyticsKeysModule.ANALYTICS_INSTANT_VISITS,
		players = analyticsKeysModule.ANALYTICS_INSTANT_PLAYERS,
		likes = analyticsKeysModule.ANALYTICS_INSTANT_LIKES,
		[analyticsWindowModule.LastWeek.id] = analyticsWindowModule.LastWeek.labelKey,
		[analyticsWindowModule.LastMonth.id] = analyticsWindowModule.LastMonth.labelKey
	})
	
	for i, v in analyticsMetricModule.OverviewMetrics do
		cloned[v.id] = v.titleKey
	end
	local var4 = useLocalization(cloned)
	
	local function _(p6)
		-- upvalues: var4 (ref)
		return var4[p6]
	end
	
	local _ = function(p6)
		-- upvalues: var4 (ref)
		return var4[p6.id]
	end
	
	local t = {}
	
	for i_1, v_1 in analyticsMetricModule.OverviewMetrics do
		local id = var2[v_1.id]
		local var5 = scaleValueToUnitModule(id.latest or 0, v_1.unit)
		local var6 = if var1.status ~= dataStatus.NotReady then var1.status == dataStatus.Ready and ((var1.latestByMetric ~= nil and var1.latestByMetric[v_1.id] ~= nil) and id.status == dataStatus.NotReady) else true
		local var7 = if id.priorValue ~= nil then nil else scaleValueToUnitModule(id.priorValue, v_1.unit)
		local var8 = if var7 ~= nil then not metricValueRoundsToZeroModule(var7, v_1.unit, nil, robloxLocaleId) else true
		t[i_1] = {
			title = var4[v_1.id],
			statValue = var5,
			statUnit = v_1.unit,
			statIcon = v_1.icon,
			deltaValue = if var8 then id.trendPct else var5,
			deltaUnit = if var8 then analyticsUnitModule.Percent else v_1.unit,
			hasData = id.hasData,
			isLoading = var6,
			isSelected = v_1.id == p3,
			onActivated = if id.hasData then function()
				-- upvalues: p5 (ref), v_1 (ref)
				p5(v_1.id)
			end else nil,
			layoutOrder = i_1,
			testId = "stat-" .. v_1.id
		}
	end
	local visits = var4.visits
	local players = var4.players
	local likes = var4.likes
	local var9 = reactModule.useMemo(function()
		-- upvalues: visits (ref), iconName (copy), var3 (ref), players (ref), likes (ref), numberLocalization (copy), robloxLocaleId (ref), noDataPlaceholderModule (copy)
		local t = {}
		
		for i, v in {
			{
				key = "visits",
				label = visits,
				icon = iconName.Eye,
				value = var3.visits,
				isLoading = var3.visitsLoading
			},
			{
				key = "players",
				label = players,
				icon = iconName.ThreePeople,
				value = var3.players,
				isLoading = var3.playersLoading
			},
			{
				key = "likes",
				label = likes,
				icon = iconName.ThumbUp,
				value = var3.likes,
				isLoading = var3.likesLoading
			}
		} do
			t[i] = {
				label = v.label,
				valueText = if v.value ~= nil then noDataPlaceholderModule else numberLocalization.localize(v.value, robloxLocaleId),
				icon = v.icon,
				isLoading = v.isLoading,
				testId = "instant-" .. v.key
			}
		end
		return t
	end, {
		var3,
		robloxLocaleId,
		visits,
		players,
		likes
	})
	local t_1 = {}
	
	for i_2, v_2 in analyticsWindowModule.Windows do
		t_1[i_2] = { id = v_2.id, label = var4[v_2.id] }
	end
	return {
		overviewTitle = var4.overviewTitle,
		keyStatsTitle = var4.keyStatsTitle,
		instantStats = var9,
		statsCards = t,
		windows = t_1,
		sheet = if not (p4 == nil or analyticsMetricModule.MetricById[p4] == nil) then {
			metricId = p4,
			universeId = p1,
			window = p2,
			latestAvailableTime = if var1.latestByMetric ~= nil then nil else var1.latestByMetric[p4],
			metadataStatus = var1.status
		} else nil
	}
end