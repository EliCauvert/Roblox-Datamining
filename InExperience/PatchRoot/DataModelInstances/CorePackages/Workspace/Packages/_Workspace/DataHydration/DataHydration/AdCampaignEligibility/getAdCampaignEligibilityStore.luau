local createAdCampaignEligibilityStoreModule = require(script.Parent.createAdCampaignEligibilityStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createAdCampaignEligibilityStoreModule (ref)
	return createAdCampaignEligibilityStoreModule()
end)