local CreateAdCampaignEligibilityStoreModule = require(script.Parent.createAdCampaignEligibilityStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateAdCampaignEligibilityStoreModule (copy)
	return CreateAdCampaignEligibilityStoreModule()
end)