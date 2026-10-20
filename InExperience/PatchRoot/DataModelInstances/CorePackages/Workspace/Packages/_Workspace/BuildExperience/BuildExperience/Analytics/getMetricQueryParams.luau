local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Parent.DataHydration.ExperienceAnalytics)
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local FFlagBuildAnalyticsGoalsModule = require(BuildExperience.Flags.FFlagBuildAnalyticsGoals)

return function(UniverseId, p1, p2, EndTime)
	-- upvalues: FFlagBuildAnalyticsGoalsModule (copy)
	return {
		universeId = UniverseId,
		metric = p1.id,
		granularity = p2.granularity,
		lookbackSeconds = p2.lookbackSeconds * 2,
		endTime = EndTime,
		filters = if FFlagBuildAnalyticsGoalsModule then p1.filters else nil
	}
end