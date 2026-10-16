local CreateAdCampaignsStoreModule = require(script.Parent.createAdCampaignsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateAdCampaignsStoreModule (copy)
	return CreateAdCampaignsStoreModule()
end)