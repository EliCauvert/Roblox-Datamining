local adCampaignEligibilityModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.AdCampaignEligibility)
local adCampaignEligibilityUtilsModule = require(script.Parent.adCampaignEligibilityUtils)
local t = {
	isEligible = false,
	freePromotionsRemaining = 0,
	isResolved = true
}
local t_1 = {
	isEligible = false,
	freePromotionsRemaining = 0,
	isResolved = false
}

return function(p1, p2)
	-- upvalues: t (ref), adCampaignEligibilityModule (ref), t_1 (ref), adCampaignEligibilityUtilsModule (ref)
	if p1 == nil or p1 == 0 then
		return t
	end
	local andFetchEligibility = (p2 or adCampaignEligibilityModule.getAdCampaignEligibilityStore(false)).getAndFetchEligibility(p1)
	
	if andFetchEligibility.status(false) ~= "Ready" then
		return t_1
	end
	local var1 = andFetchEligibility.data(false)
	
	return if adCampaignEligibilityUtilsModule.isEligibleForFreePromotion(var1) then {
		isEligible = true,
		isResolved = true,
		freePromotionsRemaining = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var1)
	} else t
end