local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local experienceAnalyticsModule = require(parent.DataHydration.ExperienceAnalytics)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local fFlagBuildAnalyticsGoalsModule = require(buildExperience.Flags.FFlagBuildAnalyticsGoals)
local metricId = experienceAnalyticsModule.MetricId
local iconName = foundationModule.Enums.IconName
local t = {
	overviewPath = "analytics/engagement",
	id = metricId.DailyActiveUsers,
	titleKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_DAILY_ACTIVE_USERS else analyticsKeysModule.ANALYTICS_METRIC_TITLE_DAILY_ACTIVE_USERS,
	unit = analyticsUnitModule.Scalar,
	chartIcon = iconName.ThreePeople,
	summaryKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD else analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_DAILY_ACTIVE_USERS,
	descriptionKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_DESC_DAILY_ACTIVE_USERS else analyticsKeysModule.ANALYTICS_METRIC_DESC_DAILY_ACTIVE_USERS,
	improvementKey = analyticsKeysModule.ANALYTICS_IMPROVE_DAILY_ACTIVE_USERS,
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
	titleKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D1_RETENTION else analyticsKeysModule.ANALYTICS_METRIC_TITLE_D1_RETENTION,
	unit = analyticsUnitModule.Percent,
	chartIcon = iconName.ArrowRotateRight,
	summaryKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD else analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_D1_RETENTION,
	descriptionKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_DESC_D1_RETENTION else analyticsKeysModule.ANALYTICS_METRIC_DESC_D1_RETENTION,
	improvementKey = analyticsKeysModule.ANALYTICS_IMPROVE_D1_RETENTION,
	analyzeNameKey = analyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_D1_RETENTION
}
local t_4 = {
	overviewPath = "analytics/monetization",
	id = metricId.PayingUsersCVR,
	titleKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_PAYER_CONVERSION else analyticsKeysModule.ANALYTICS_METRIC_TITLE_PAYER_CONVERSION,
	unit = analyticsUnitModule.Percent,
	chartIcon = iconName.PersonCheck,
	summaryKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD else analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_PAYER_CONVERSION,
	descriptionKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_DESC_PAYER_CONVERSION else analyticsKeysModule.ANALYTICS_METRIC_DESC_PAYER_CONVERSION,
	improvementKey = analyticsKeysModule.ANALYTICS_IMPROVE_PAYER_CONVERSION,
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
local t_6 = {
	overviewPath = "analytics/engagement",
	id = metricId.AveragePlayTimeMinutesPerDAU,
	titleKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_NEW_USER_SESSION_TIME else analyticsKeysModule.ANALYTICS_METRIC_TITLE_NEW_USER_SESSION_TIME,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD,
	unit = analyticsUnitModule.Minutes,
	analyzeNameKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_NEW_USER_SESSION_TIME else analyticsKeysModule.ANALYTICS_METRIC_TITLE_NEW_USER_SESSION_TIME,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_NEW_USER_SESSION_TIME,
	improvementKey = analyticsKeysModule.ANALYTICS_IMPROVE_NEW_USER_SESSION_TIME,
	filters = {
		{
			dimension = "IsNewUser",
			operation = "Equals",
			values = { "New" }
		}
	}
}
local t_7 = {
	overviewPath = "analytics/retention",
	id = metricId.ForwardD7Retention,
	titleKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D7_RETENTION else analyticsKeysModule.ANALYTICS_METRIC_TITLE_D7_RETENTION,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD,
	unit = analyticsUnitModule.Percent,
	analyzeNameKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D7_RETENTION else analyticsKeysModule.ANALYTICS_METRIC_TITLE_D7_RETENTION,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_D7_RETENTION,
	improvementKey = analyticsKeysModule.ANALYTICS_IMPROVE_D7_RETENTION
}
local t_8 = {
	overviewPath = "analytics/monetization",
	id = metricId.DailyRevenue,
	titleKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_ROBUX_SPENT else analyticsKeysModule.ANALYTICS_METRIC_TITLE_ROBUX_SPENT,
	summaryKey = analyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD,
	unit = analyticsUnitModule.Scalar,
	analyzeNameKey = if fFlagBuildAnalyticsGoalsModule then analyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_ROBUX_SPENT else analyticsKeysModule.ANALYTICS_METRIC_TITLE_ROBUX_SPENT,
	descriptionKey = analyticsKeysModule.ANALYTICS_METRIC_DESC_ROBUX_SPENT,
	improvementKey = analyticsKeysModule.ANALYTICS_IMPROVE_ROBUX_SPENT
}
local list = {
	t, t_1, t_2, t_3, t_4, t_5
}
local t_9 = {}

for i, v in list do
	t_9[v.id] = v
end
return {
	OverviewMetrics = list,
	MetricById = t_9,
	DailyActiveUsers = t,
	TotalPlaytime = t_1,
	PlaythroughRate = t_2,
	D1Retention = t_3,
	PayerConversion = t_4,
	Arppu = t_5,
	NewUserSessionTime = t_6,
	D7Retention = t_7,
	RobuxSpent = t_8
}