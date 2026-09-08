local experienceAnalyticsStoreTypesModule = require(script.ExperienceAnalyticsStoreTypes)

return {
	createExperienceAnalyticsStore = require(script.createExperienceAnalyticsStore),
	getExperienceAnalyticsStore = require(script.getExperienceAnalyticsStore),
	MetricId = experienceAnalyticsStoreTypesModule.MetricId,
	MetricGranularity = experienceAnalyticsStoreTypesModule.MetricGranularity,
	DataStatus = experienceAnalyticsStoreTypesModule.DataStatus
}