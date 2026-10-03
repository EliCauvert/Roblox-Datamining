local createAdCampaignToolCallStatusStoreModule = require(script.Parent.createAdCampaignToolCallStatusStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createAdCampaignToolCallStatusStoreModule (ref)
	return createAdCampaignToolCallStatusStoreModule()
end)