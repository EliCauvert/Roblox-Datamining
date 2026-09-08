local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local metricId = require(parent.DataHydration.ExperienceAnalytics).MetricId
local iconName = foundationModule.Enums.IconName
local t = {
	overviewPath = "analytics/engagement",
	id = metricId.DailyActiveUsers,
	titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_DAILY_ACTIVE_USERS,
	unit = analyticsUnitModule.Scalar,
	chartIcon = iconName.ThreePeople,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_DAILY_ACTIVE_USERS,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_DAILY_ACTIVE_USERS,
	analyzeNameKey = analyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_DAILY_ACTIVE_USERS
}
local t_1 = {
	overviewPath = "analytics/engagement",
	id = metricId.TotalPlayTimeHours,
	titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_TOTAL_PLAYTIME,
	unit = analyticsUnitModule.Temporal,
	chartIcon = iconName.Clock,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_TOTAL_PLAYTIME,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_TOTAL_PLAYTIME,
	analyzeNameKey = analyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_TOTAL_PLAYTIME
}
local t_2 = {
	overviewPath = "analytics/acquisition",
	id = metricId.RFYPlayThroughRate,
	titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_PLAYTHROUGH_RATE,
	unit = analyticsUnitModule.Percent,
	chartIcon = iconName.CirclePlay,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_PLAYTHROUGH_RATE,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_PLAYTHROUGH_RATE,
	analyzeNameKey = analyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_PLAYTHROUGH_RATE
}
local t_3 = {
	overviewPath = "analytics/retention",
	id = metricId.ForwardD1Retention,
	titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_D1_RETENTION,
	unit = analyticsUnitModule.Percent,
	chartIcon = iconName.ArrowRotateRight,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_D1_RETENTION,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_D1_RETENTION,
	analyzeNameKey = analyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_D1_RETENTION
}
local t_4 = {
	overviewPath = "analytics/monetization",
	id = metricId.PayingUsersCVR,
	titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_PAYER_CONVERSION,
	unit = analyticsUnitModule.Percent,
	chartIcon = iconName.PersonCheck,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_PAYER_CONVERSION,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_PAYER_CONVERSION,
	analyzeNameKey = analyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_PAYER_CONVERSION
}
local t_5 = {
	overviewPath = "analytics/monetization",
	id = metricId.AverageRevenuePerPayingUser,
	titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_ARPPU,
	unit = analyticsUnitModule.Scalar,
	icon = iconName.Robux,
	chartIcon = iconName.Robux,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_ARPPU,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_ARPPU,
	analyzeNameKey = analyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_ARPPU
}
local list = {
	t, t_1, t_2, t_3, t_4, t_5
}
local t_6 = {}

for i, v in list do
	t_6[v.id] = v
end
return {
	OverviewMetrics = list,
	MetricById = t_6,
	DailyActiveUsers = t,
	TotalPlaytime = t_1,
	PlaythroughRate = t_2,
	D1Retention = t_3,
	PayerConversion = t_4,
	Arppu = t_5
}