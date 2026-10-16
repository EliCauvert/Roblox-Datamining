local AdCampaignEligibilityModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.AdCampaignEligibility)
local AdCampaignEligibilityUtilsModule = require(script.Parent.adCampaignEligibilityUtils)
local config = {
	isEligible = false,
	freePromotionsRemaining = 0,
	isResolved = true
}
local config1 = {
	isEligible = false,
	freePromotionsRemaining = 0,
	isResolved = false
}

return function(p1, p2) --[[ Line: 47 | Named "getAdUpsellEligibility" ]]
	-- upvalues: config (copy), AdCampaignEligibilityModule (copy), config1 (copy), AdCampaignEligibilityUtilsModule (copy)
	if p1 == nil or p1 == 0 then
		return config
	end
	local AndFetchEligibility = (p2 or AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false)).getAndFetchEligibility(p1)
	
	if AndFetchEligibility.status(false) == "Ready" then
		local DataResult = AndFetchEligibility.data(false)
		
		return if AdCampaignEligibilityUtilsModule.isEligibleForFreePromotion(DataResult) then {
			isEligible = true,
			isResolved = true,
			freePromotionsRemaining = AdCampaignEligibilityUtilsModule.freeCreditsRemaining(DataResult)
		} else config
	else
		return config1
	end
end