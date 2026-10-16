local CreateAdCampaignToolCallStatusStoreModule = require(script.Parent.createAdCampaignToolCallStatusStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 7 ]]
	-- upvalues: CreateAdCampaignToolCallStatusStoreModule (copy)
	return CreateAdCampaignToolCallStatusStoreModule()
end)