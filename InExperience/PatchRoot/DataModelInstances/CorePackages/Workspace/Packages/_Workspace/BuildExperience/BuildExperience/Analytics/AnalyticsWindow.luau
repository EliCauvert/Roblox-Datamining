local buildExperience = script:FindFirstAncestor("BuildExperience")
local analyticsKeysModule = require(buildExperience.Analytics.AnalyticsKeys)
local metricGranularity = require(buildExperience.Parent.DataHydration.ExperienceAnalytics).MetricGranularity
local t = { LastWeek = "LastWeek", LastMonth = "LastMonth" }

local function _(p1, p2, p3)
	-- upvalues: metricGranularity (ref)
	return {
		id = p1,
		labelKey = p2,
		lookbackSeconds = p3 * 86400,
		days = p3,
		granularity = metricGranularity.OneDay
	}
end

local t_1 = {
	lookbackSeconds = 604800,
	days = 7,
	id = t.LastWeek,
	labelKey = analyticsKeysModule.ANALYTICS_WINDOW_LAST_WEEK,
	granularity = metricGranularity.OneDay
}
local t_2 = {
	lookbackSeconds = 2419200,
	days = 28,
	id = t.LastMonth,
	labelKey = analyticsKeysModule.ANALYTICS_WINDOW_LAST_MONTH,
	granularity = metricGranularity.OneDay
}
local list = { t_2, t_1 }
local t_3 = {}

for i, v in list do
	t_3[v.id] = v
end
return {
	Windows = list,
	WindowById = t_3,
	WindowId = t,
	LastWeek = t_1,
	LastMonth = t_2,
	DEFAULT_WINDOW_ID = t.LastWeek
}