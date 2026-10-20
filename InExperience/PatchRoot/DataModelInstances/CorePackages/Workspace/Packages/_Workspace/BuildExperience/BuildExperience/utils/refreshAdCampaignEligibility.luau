local AdCampaignEligibilityModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.AdCampaignEligibility)

return function(p1)
	-- upvalues: AdCampaignEligibilityModule (copy)
	AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false).fetchEligibility(p1)
end