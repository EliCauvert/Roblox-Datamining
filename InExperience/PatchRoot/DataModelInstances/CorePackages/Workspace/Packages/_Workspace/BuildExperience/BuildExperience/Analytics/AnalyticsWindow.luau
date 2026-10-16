local BuildExperience = script:FindFirstAncestor("BuildExperience")
local AnalyticsKeysModule = require(BuildExperience.Analytics.AnalyticsKeys)
local MetricGranularity = require(BuildExperience.Parent.DataHydration.ExperienceAnalytics).MetricGranularity
local WindowId = { LastWeek = "LastWeek", LastMonth = "LastMonth" }

local function _(Id, LabelKey, Days: number, CreatorHubRangeType) --[[ Line: 35 | Named "dailyWindow" ]]
	-- upvalues: MetricGranularity (copy)
	return {
		id = Id,
		labelKey = LabelKey,
		lookbackSeconds = Days * 86400,
		days = Days,
		granularity = MetricGranularity.OneDay,
		creatorHubRangeType = CreatorHubRangeType
	}
end

local LastWeek = {
	lookbackSeconds = 604800,
	days = 7,
	creatorHubRangeType = "Last7Days",
	id = WindowId.LastWeek,
	labelKey = AnalyticsKeysModule.ANALYTICS_WINDOW_LAST_WEEK,
	granularity = MetricGranularity.OneDay
}
local LastMonth = {
	lookbackSeconds = 2419200,
	days = 28,
	creatorHubRangeType = "Last28Days",
	id = WindowId.LastMonth,
	labelKey = AnalyticsKeysModule.ANALYTICS_WINDOW_LAST_MONTH,
	granularity = MetricGranularity.OneDay
}
local Windows = { LastMonth, LastWeek }
local WindowById = {}

for _, window in Windows do
	WindowById[window.id] = window
end
return {
	Windows = Windows,
	WindowById = WindowById,
	WindowId = WindowId,
	LastWeek = LastWeek,
	LastMonth = LastMonth,
	DEFAULT_WINDOW_ID = WindowId.LastWeek
}