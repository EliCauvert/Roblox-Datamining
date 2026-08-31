local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local adCampaignEligibilityModule = require(parent.DataHydration.AdCampaignEligibility)

return function(p1, p2, p3)
	-- upvalues: adCampaignEligibilityModule (ref), signalsModule (ref)
	local andFetchEligibility = (p3 or adCampaignEligibilityModule.getAdCampaignEligibilityStore(false)).getAndFetchEligibility(p1)
	
	return signalsModule.createEffect(function(p4)
		-- upvalues: andFetchEligibility (ref), p2 (ref)
		andFetchEligibility.data(p4)
		andFetchEligibility.status(p4)
		p2()
	end)
end