local createAdCampaignsStoreModule = require(script.Parent.createAdCampaignsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createAdCampaignsStoreModule (ref)
	return createAdCampaignsStoreModule()
end)