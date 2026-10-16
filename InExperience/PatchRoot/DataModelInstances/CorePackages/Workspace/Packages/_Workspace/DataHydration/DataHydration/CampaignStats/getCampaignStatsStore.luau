local CreateCampaignStatsStoreModule = require(script.Parent.createCampaignStatsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateCampaignStatsStoreModule (copy)
	return CreateCampaignStatsStoreModule()
end)