local CreateAdCampaignsStoreModule = require(script.Parent.createAdCampaignsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateAdCampaignsStoreModule (copy)
	return CreateAdCampaignsStoreModule()
end)