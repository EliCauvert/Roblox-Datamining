local CreateExperienceAnalyticsStoreModule = require(script.Parent.createExperienceAnalyticsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateExperienceAnalyticsStoreModule (copy)
	return CreateExperienceAnalyticsStoreModule()
end)