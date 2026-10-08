local buildExperience = script:FindFirstAncestor("BuildExperience")
local experienceAnalyticsModule = require(buildExperience.Parent.DataHydration.ExperienceAnalytics)
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local goalMetricSummarySourcesModule = require(buildExperience.Analytics.Goals.GoalMetricSummarySources)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)
local metricId = experienceAnalyticsModule.MetricId

return {
	Goals = {
		{
			id = "GetMorePlayers",
			titleKey = analyticsKeysModule.ANALYTICS_GOAL_TITLE_GET_MORE_PLAYERS,
			metricSummaries = {
				{
					kind = "number",
					id = "DailyActiveUsers",
					titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_DAILY_ACTIVE_USERS,
					source = goalMetricSummarySourcesModule.summary({ metric = metricId.DailyActiveUsers }),
					format = { unit = analyticsUnitModule.Scalar }
				}
			}
		},
		{
			id = "FirstImpression",
			titleKey = analyticsKeysModule.ANALYTICS_GOAL_TITLE_FIRST_IMPRESSION,
			metricSummaries = {
				{
					kind = "number",
					id = "NewUserSessionTime",
					titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_NEW_USER_SESSION_TIME,
					source = goalMetricSummarySourcesModule.summary({
						metric = metricId.AveragePlayTimeMinutesPerDAU,
						filters = {
							{
								dimension = "IsNewUser",
								operation = "Equals",
								values = { "New" }
							}
						}
					}),
					format = { unit = analyticsUnitModule.Temporal }
				}
			}
		},
		{
			id = "KeepPlayersComingBack",
			titleKey = analyticsKeysModule.ANALYTICS_GOAL_TITLE_KEEP_PLAYERS_COMING_BACK,
			metricSummaries = {
				{
					kind = "number",
					id = "ForwardD1Retention",
					titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_D1_RETENTION,
					source = goalMetricSummarySourcesModule.summary({ metric = metricId.ForwardD1Retention }),
					format = { unit = analyticsUnitModule.Percent }
				},
				{
					kind = "number",
					id = "ForwardD7Retention",
					titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_D7_RETENTION,
					source = goalMetricSummarySourcesModule.summary({ metric = metricId.ForwardD7Retention }),
					format = { unit = analyticsUnitModule.Percent }
				}
			}
		},
		{
			id = "EarnRobux",
			titleKey = analyticsKeysModule.ANALYTICS_GOAL_TITLE_EARN_ROBUX,
			metricSummaries = {
				{
					kind = "number",
					id = "DailyRevenue",
					titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_ROBUX_SPENT,
					source = goalMetricSummarySourcesModule.summary({ metric = metricId.DailyRevenue }),
					format = { unit = analyticsUnitModule.Scalar }
				},
				{
					kind = "number",
					id = "PayingUsersCVR",
					titleKey = analyticsKeysModule.ANALYTICS_METRIC_TITLE_PAYER_CONVERSION,
					source = goalMetricSummarySourcesModule.summary({ metric = metricId.PayingUsersCVR }),
					format = { unit = analyticsUnitModule.Percent }
				}
			}
		}
	}
}