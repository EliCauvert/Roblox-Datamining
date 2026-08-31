local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.AdCampaignEligibility)

return {
	isEligibleForFreePromotion = function(p1)
		return p1 ~= nil and (p1.userEligible == true and (p1.universeEligible == true and p1.cardType == "promote_free"))
	end,
	freeCreditsRemaining = function(p1)
		return if p1 == nil then 0 else p1.freeCreditsRemaining
	end,
	hasFreeCredit = function(p1)
		return (if p1 ~= nil then 0 else p1.freeCreditsRemaining) > 0
	end,
	hasUsableOffer = function(p1)
		local var1 = if p1 ~= nil then nil else p1.offer
		
		return var1 ~= nil and var1.durationDays > 0
	end
}