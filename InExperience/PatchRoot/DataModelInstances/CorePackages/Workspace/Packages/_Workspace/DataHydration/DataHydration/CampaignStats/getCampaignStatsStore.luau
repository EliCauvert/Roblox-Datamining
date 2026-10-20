local CreateCampaignStatsStoreModule = require(script.Parent.createCampaignStatsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateCampaignStatsStoreModule (copy)
	return CreateCampaignStatsStoreModule()
end)