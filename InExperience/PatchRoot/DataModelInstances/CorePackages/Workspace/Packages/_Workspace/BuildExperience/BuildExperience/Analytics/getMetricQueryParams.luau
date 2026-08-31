local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.ExperienceAnalytics)
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)

return function(p1, p2, p3, p4)
	return {
		universeId = p1,
		metric = p2.id,
		granularity = p3.granularity,
		lookbackSeconds = p3.lookbackSeconds * 2,
		endTime = p4
	}
end