local AdCampaignEligibilityModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.AdCampaignEligibility)

return function(p1) --[[ Line: 9 | Named "refreshAdCampaignEligibility" ]]
	-- upvalues: AdCampaignEligibilityModule (copy)
	AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false).fetchEligibility(p1)
end