local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local AnalyticsMetricModule = require(BuildExperience.Analytics.AnalyticsMetric)
local GoalLockedActionIdModule = require(BuildExperience.Analytics.Goals.GoalLockedActionId)
local GoalMetricSummarySourcesModule = require(BuildExperience.Analytics.Goals.GoalMetricSummarySources)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local MetricId = require(Parent.DataHydration.ExperienceAnalytics).MetricId
local config = {
	Charts = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_CHARTS,
	ContinueToPlay = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_CONTINUE_TO_PLAY,
	CrossGame = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_CROSS_GAME,
	Curation = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_CURATION,
	Friends = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_FRIENDS,
	HomeNonRecommendation = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_HOME_NON_RECOMMENDATION,
	HomeRecommendation = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_HOME_RECOMMENDATION,
	Moments = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_MOMENTS,
	Others = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_OTHERS,
	PortalAds = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_PORTAL_ADS,
	Search = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_SEARCH,
	SearchAds = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_SEARCH_ADS,
	SponsoredAds = AnalyticsKeysModule.ANALYTICS_ACQUISITION_SOURCE_SPONSORED_ADS
}

return {
	Goals = {
		{
			id = "GetMorePlayers",
			unlockMilestone = "universe_dau_5_achieved",
			titleKey = AnalyticsKeysModule.ANALYTICS_GOAL_TITLE_GET_MORE_PLAYERS,
			charts = { AnalyticsMetricModule.DailyActiveUsers },
			metricSummaries = {
				{
					kind = "number",
					id = "DailyActiveUsers",
					titleKey = AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_DAILY_ACTIVE_USERS,
					source = GoalMetricSummarySourcesModule.summary({ metric = MetricId.DailyActiveUsers }),
					format = { unit = AnalyticsUnitModule.Scalar }
				},
				{
					kind = "breakdown",
					id = "TopAcquisitionSource",
					titleKey = AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_TOP_ACQUISITION_SOURCE,
					source = GoalMetricSummarySourcesModule.topBreakdown({
						dimension = "SessionAcquisitionSource",
						metric = MetricId.UniqueUsersWithPlaySessions
					}),
					format = {
						type = "translated",
						translationKeyFor = function(_, p1) --[[ Line: 58 ]]
							-- upvalues: config (copy)
							return config[p1.value]
						end
					}
				}
			},
			locked = {
				messageKey = AnalyticsKeysModule.ANALYTICS_GOAL_LOCKED_GET_MORE_PLAYERS,
				actions = {
					primary = {
						id = GoalLockedActionIdModule.CreateAd,
						textKey = AnalyticsKeysModule.ANALYTICS_GOAL_ACTION_CREATE_AD
					},
					secondary = {
						id = GoalLockedActionIdModule.ShareWithFriends,
						textKey = AnalyticsKeysModule.ANALYTICS_GOAL_ACTION_SHARE_WITH_FRIENDS
					}
				}
			}
		},
		{
			id = "FirstImpression",
			unlockMilestone = "universe_dau_5_achieved",
			titleKey = AnalyticsKeysModule.ANALYTICS_GOAL_TITLE_FIRST_IMPRESSION,
			charts = { AnalyticsMetricModule.NewUserSessionTime },
			metricSummaries = {
				{
					kind = "number",
					id = "NewUserSessionTime",
					titleKey = AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_NEW_USER_SESSION_TIME,
					source = GoalMetricSummarySourcesModule.summary({
						metric = MetricId.AveragePlayTimeMinutesPerDAU,
						filters = {
							{
								dimension = "IsNewUser",
								operation = "Equals",
								values = { "New" }
							}
						}
					}),
					format = { unit = AnalyticsUnitModule.Minutes }
				},
				{
					kind = "breakdown",
					id = "TopDropOffStep",
					titleKey = AnalyticsKeysModule.ANALYTICS_METRIC_TITLE_TOP_DROP_OFF_STEP,
					source = GoalMetricSummarySourcesModule.topBreakdown({
						dimension = "FunnelStep",
						metric = MetricId.FunnelUserChurnRate,
						filters = {
							{
								dimension = "FunnelName",
								operation = "Equals",
								values = { "FUNNEL_TYPE_ONBOARDING" }
							}
						}
					}),
					format = {
						type = "custom",
						formatter = function(_, p1) --[[ Line: 108 ]]
							local DisplayValue = p1.displayValue
							
							return if DisplayValue == nil or DisplayValue == "" then p1.value else `{p1.value}. {DisplayValue}`
						end
					}
				}
			},
			locked = {
				messageKey = AnalyticsKeysModule.ANALYTICS_GOAL_LOCKED_FIRST_IMPRESSION
			}
		},
		{
			id = "KeepPlayersComingBack",
			unlockMilestone = "universe_first_returning_user_achieved",
			titleKey = AnalyticsKeysModule.ANALYTICS_GOAL_TITLE_KEEP_PLAYERS_COMING_BACK,
			charts = {
				AnalyticsMetricModule.D1Retention,
				AnalyticsMetricModule.D7Retention
			},
			metricSummaries = {
				{
					kind = "number",
					id = "ForwardD1Retention",
					titleKey = AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D1_RETENTION,
					source = GoalMetricSummarySourcesModule.summary({ endOffsetDays = 1, metric = MetricId.ForwardD1Retention }),
					format = { unit = AnalyticsUnitModule.Percent }
				},
				{
					kind = "number",
					id = "ForwardD7Retention",
					titleKey = AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_D7_RETENTION,
					source = GoalMetricSummarySourcesModule.summary({ endOffsetDays = 7, metric = MetricId.ForwardD7Retention }),
					format = { unit = AnalyticsUnitModule.Percent }
				}
			},
			locked = {
				messageKey = AnalyticsKeysModule.ANALYTICS_GOAL_LOCKED_KEEP_PLAYERS_COMING_BACK
			}
		},
		{
			id = "EarnRobux",
			unlockMilestone = "universe_first_robux_spent_achieved",
			titleKey = AnalyticsKeysModule.ANALYTICS_GOAL_TITLE_EARN_ROBUX,
			charts = {
				AnalyticsMetricModule.RobuxSpent,
				AnalyticsMetricModule.PayerConversion
			},
			metricSummaries = {
				{
					kind = "number",
					id = "DailyRevenue",
					titleKey = AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_ROBUX_SPENT,
					icon = require(Parent.Foundation).Enums.IconName.Robux,
					source = GoalMetricSummarySourcesModule.summary({ metric = MetricId.DailyRevenue }),
					format = { unit = AnalyticsUnitModule.Scalar }
				},
				{
					kind = "number",
					id = "PayingUsersCVR",
					titleKey = AnalyticsKeysModule.ANALYTICS_OVERVIEW_METRIC_TITLE_PAYER_CONVERSION,
					source = GoalMetricSummarySourcesModule.summary({ metric = MetricId.PayingUsersCVR }),
					format = { unit = AnalyticsUnitModule.Percent }
				}
			},
			locked = {
				messageKey = AnalyticsKeysModule.ANALYTICS_GOAL_LOCKED_EARN_ROBUX,
				actions = {
					primary = {
						id = GoalLockedActionIdModule.SellItems,
						textKey = AnalyticsKeysModule.ANALYTICS_GOAL_ACTION_SELL_ITEMS
					}
				}
			}
		}
	}
}