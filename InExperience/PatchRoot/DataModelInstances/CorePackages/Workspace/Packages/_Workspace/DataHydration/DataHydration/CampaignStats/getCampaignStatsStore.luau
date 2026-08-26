local createCampaignStatsStoreModule = require(script.Parent.createCampaignStatsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createCampaignStatsStoreModule (ref)
	return createCampaignStatsStoreModule()
end)