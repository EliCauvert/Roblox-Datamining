local CreatorAnalyticsStoreTypesModule = require(script.CreatorAnalyticsStoreTypes)
local _ = require(script.GoalMilestonesTypes)

return {
	createCreatorAnalyticsStore = require(script.createCreatorAnalyticsStore),
	getCreatorAnalyticsStore = require(script.getCreatorAnalyticsStore),
	createExperienceAnalyticsStore = require(script.createCreatorAnalyticsStore),
	getExperienceAnalyticsStore = require(script.getCreatorAnalyticsStore),
	createGoalMilestonesStore = require(script.createGoalMilestonesStore),
	getGoalMilestonesStore = require(script.getGoalMilestonesStore),
	MetricId = CreatorAnalyticsStoreTypesModule.MetricId,
	MetricGranularity = CreatorAnalyticsStoreTypesModule.MetricGranularity,
	FilterOperation = CreatorAnalyticsStoreTypesModule.FilterOperation,
	ResourceType = CreatorAnalyticsStoreTypesModule.ResourceType,
	DataStatus = CreatorAnalyticsStoreTypesModule.DataStatus
}