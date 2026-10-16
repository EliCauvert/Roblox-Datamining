local ExperienceAnalyticsStoreTypesModule = require(script.ExperienceAnalyticsStoreTypes)
local _ = require(script.GoalMilestonesTypes)

return {
	createExperienceAnalyticsStore = require(script.createExperienceAnalyticsStore),
	getExperienceAnalyticsStore = require(script.getExperienceAnalyticsStore),
	createGoalMilestonesStore = require(script.createGoalMilestonesStore),
	getGoalMilestonesStore = require(script.getGoalMilestonesStore),
	MetricId = ExperienceAnalyticsStoreTypesModule.MetricId,
	MetricGranularity = ExperienceAnalyticsStoreTypesModule.MetricGranularity,
	FilterOperation = ExperienceAnalyticsStoreTypesModule.FilterOperation,
	DataStatus = ExperienceAnalyticsStoreTypesModule.DataStatus
}