local adCampaignEligibilityModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.AdCampaignEligibility)

return function(p1)
	-- upvalues: adCampaignEligibilityModule (ref)
	adCampaignEligibilityModule.getAdCampaignEligibilityStore(false).fetchEligibility(p1)
end