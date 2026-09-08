local createExperienceAnalyticsStoreModule = require(script.Parent.createExperienceAnalyticsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createExperienceAnalyticsStoreModule (ref)
	return createExperienceAnalyticsStoreModule()
end)