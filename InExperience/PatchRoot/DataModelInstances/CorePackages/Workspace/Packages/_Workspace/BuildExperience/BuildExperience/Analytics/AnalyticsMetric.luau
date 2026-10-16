local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local FFlagBuildAnalyticsGoalsModule = require(BuildExperience.Flags.FFlagBuildAnalyticsGoals)
local MetricId = require(Parent.DataHydration.ExperienceAnalytics).MetricId
local IconName = require(Parent.Foundation).Enums.IconName
local DailyActiveUsers = {
	overviewPath = "analytics/engagement",
	id = MetricId.DailyActiveUsers,
	titleKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_DAILY_ACTIVE_USERS else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_DAILY_ACTIVE_USERS,
	unit = AnalyticsUnitModule.Scalar,
	chartIcon = IconName.ThreePeople,
	summaryKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD else AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_DAILY_ACTIVE_USERS,
	descriptionKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_DESC_DAILY_ACTIVE_USERS else AnalyticsKeysModule.ANALYTICS_METRIC_DESC_DAILY_ACTIVE_USERS,
	improvementKey = AnalyticsKeysModule.ANALYTICS_IMPROVE_DAILY_ACTIVE_USERS,
	analyzeNameKey = AnalyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_DAILY_ACTIVE_USERS
}
local TotalPlaytime = {
	overviewPath = "analytics/engagement",
	id = MetricId.TotalPlayTimeHours,
	titleKey = AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_TOTAL_PLAYTIME,
	unit = AnalyticsUnitModule.Temporal,
	chartIcon = IconName.Clock,
	summaryKey = AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_TOTAL_PLAYTIME,
	descriptionKey = AnalyticsKeysModule.ANALYTICS_METRIC_DESC_TOTAL_PLAYTIME,
	analyzeNameKey = AnalyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_TOTAL_PLAYTIME
}
local PlaythroughRate = {
	overviewPath = "analytics/acquisition",
	id = MetricId.RFYPlayThroughRate,
	titleKey = AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_PLAYTHROUGH_RATE,
	unit = AnalyticsUnitModule.Percent,
	chartIcon = IconName.CirclePlay,
	summaryKey = AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_PLAYTHROUGH_RATE,
	descriptionKey = AnalyticsKeysModule.ANALYTICS_METRIC_DESC_PLAYTHROUGH_RATE,
	analyzeNameKey = AnalyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_PLAYTHROUGH_RATE
}
local D1Retention = {
	overviewPath = "analytics/retention",
	id = MetricId.ForwardD1Retention,
	titleKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D1_RETENTION else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_D1_RETENTION,
	unit = AnalyticsUnitModule.Percent,
	chartIcon = IconName.ArrowRotateRight,
	summaryKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD else AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_D1_RETENTION,
	descriptionKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_DESC_D1_RETENTION else AnalyticsKeysModule.ANALYTICS_METRIC_DESC_D1_RETENTION,
	improvementKey = AnalyticsKeysModule.ANALYTICS_IMPROVE_D1_RETENTION,
	analyzeNameKey = AnalyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_D1_RETENTION
}
local PayerConversion = {
	overviewPath = "analytics/monetization",
	id = MetricId.PayingUsersCVR,
	titleKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_PAYER_CONVERSION else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_PAYER_CONVERSION,
	unit = AnalyticsUnitModule.Percent,
	chartIcon = IconName.PersonCheck,
	summaryKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD else AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_PAYER_CONVERSION,
	descriptionKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_DESC_PAYER_CONVERSION else AnalyticsKeysModule.ANALYTICS_METRIC_DESC_PAYER_CONVERSION,
	improvementKey = AnalyticsKeysModule.ANALYTICS_IMPROVE_PAYER_CONVERSION,
	analyzeNameKey = AnalyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_PAYER_CONVERSION
}
local Arppu = {
	overviewPath = "analytics/monetization",
	id = MetricId.AverageRevenuePerPayingUser,
	titleKey = AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_ARPPU,
	unit = AnalyticsUnitModule.Scalar,
	icon = IconName.Robux,
	chartIcon = IconName.Robux,
	summaryKey = AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_ARPPU,
	descriptionKey = AnalyticsKeysModule.ANALYTICS_METRIC_DESC_ARPPU,
	analyzeNameKey = AnalyticsKeysModule.ANALYTICS_METRIC_ANALYZE_NAME_ARPPU
}
local NewUserSessionTime = {
	overviewPath = "analytics/engagement",
	id = MetricId.AveragePlayTimeMinutesPerDAU,
	titleKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_NEW_USER_SESSION_TIME else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_NEW_USER_SESSION_TIME,
	summaryKey = AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD,
	unit = AnalyticsUnitModule.Minutes,
	analyzeNameKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_NEW_USER_SESSION_TIME else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_NEW_USER_SESSION_TIME,
	descriptionKey = AnalyticsKeysModule.ANALYTICS_METRIC_DESC_NEW_USER_SESSION_TIME,
	improvementKey = AnalyticsKeysModule.ANALYTICS_IMPROVE_NEW_USER_SESSION_TIME,
	filters = {
		{
			dimension = "IsNewUser",
			operation = "Equals",
			values = { "New" }
		}
	}
}
local D7Retention = {
	overviewPath = "analytics/retention",
	id = MetricId.ForwardD7Retention,
	titleKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D7_RETENTION else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_D7_RETENTION,
	summaryKey = AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD,
	unit = AnalyticsUnitModule.Percent,
	analyzeNameKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D7_RETENTION else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_D7_RETENTION,
	descriptionKey = AnalyticsKeysModule.ANALYTICS_METRIC_DESC_D7_RETENTION,
	improvementKey = AnalyticsKeysModule.ANALYTICS_IMPROVE_D7_RETENTION
}
local RobuxSpent = {
	overviewPath = "analytics/monetization",
	id = MetricId.DailyRevenue,
	titleKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_ROBUX_SPENT else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_ROBUX_SPENT,
	summaryKey = AnalyticsKeysModule.ANALYTICS_METRIC_SUMMARY_AVERAGE_OVER_SELECTED_PERIOD,
	unit = AnalyticsUnitModule.Scalar,
	analyzeNameKey = if FFlagBuildAnalyticsGoalsModule then AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_ROBUX_SPENT else AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_ROBUX_SPENT,
	descriptionKey = AnalyticsKeysModule.ANALYTICS_METRIC_DESC_ROBUX_SPENT,
	improvementKey = AnalyticsKeysModule.ANALYTICS_IMPROVE_ROBUX_SPENT
}
local OverviewMetrics = {
	DailyActiveUsers, TotalPlaytime, PlaythroughRate, D1Retention, PayerConversion,
	Arppu
}
local MetricById = {}

for _, overviewMetric in OverviewMetrics do
	MetricById[overviewMetric.id] = overviewMetric
end
return {
	OverviewMetrics = OverviewMetrics,
	MetricById = MetricById,
	DailyActiveUsers = DailyActiveUsers,
	TotalPlaytime = TotalPlaytime,
	PlaythroughRate = PlaythroughRate,
	D1Retention = D1Retention,
	PayerConversion = PayerConversion,
	Arppu = Arppu,
	NewUserSessionTime = NewUserSessionTime,
	D7Retention = D7Retention,
	RobuxSpent = RobuxSpent
}