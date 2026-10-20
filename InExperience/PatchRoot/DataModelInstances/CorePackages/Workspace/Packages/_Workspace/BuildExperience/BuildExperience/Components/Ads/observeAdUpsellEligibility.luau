local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local AdCampaignEligibilityModule = require(Parent.DataHydration.AdCampaignEligibility)

return function(p1, Callback, p2)
	-- upvalues: AdCampaignEligibilityModule (copy), SignalsModule (copy)
	local AndFetchEligibility = (p2 or AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false)).getAndFetchEligibility(p1)
	
	return SignalsModule.createEffect(function(p3)
		-- upvalues: AndFetchEligibility (copy), Callback (copy)
		AndFetchEligibility.data(p3)
		AndFetchEligibility.status(p3)
		Callback()
	end)
end