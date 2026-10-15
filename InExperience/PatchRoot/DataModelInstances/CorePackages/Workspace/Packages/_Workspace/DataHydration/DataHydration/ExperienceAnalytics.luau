local experienceAnalyticsStoreTypesModule = require(script.ExperienceAnalyticsStoreTypes)
local _ = require(script.GoalMilestonesTypes)

return {
	createExperienceAnalyticsStore = require(script.createExperienceAnalyticsStore),
	getExperienceAnalyticsStore = require(script.getExperienceAnalyticsStore),
	createGoalMilestonesStore = require(script.createGoalMilestonesStore),
	getGoalMilestonesStore = require(script.getGoalMilestonesStore),
	MetricId = experienceAnalyticsStoreTypesModule.MetricId,
	MetricGranularity = experienceAnalyticsStoreTypesModule.MetricGranularity,
	FilterOperation = experienceAnalyticsStoreTypesModule.FilterOperation,
	DataStatus = experienceAnalyticsStoreTypesModule.DataStatus
}