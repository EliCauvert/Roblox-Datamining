local CreateCreatorAnalyticsStoreModule = require(script.Parent.createCreatorAnalyticsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateCreatorAnalyticsStoreModule (copy)
	return CreateCreatorAnalyticsStoreModule()
end)