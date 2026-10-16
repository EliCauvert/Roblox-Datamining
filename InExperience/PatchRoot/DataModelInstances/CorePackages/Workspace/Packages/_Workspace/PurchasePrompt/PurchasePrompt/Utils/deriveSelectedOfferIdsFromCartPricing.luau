local DeriveCartPricingViewFunction = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience).deriveCartPricingView

return function(p1) --[[ Line: 14 | Named "deriveSelectedOfferIdsFromCartPricing" ]]
	-- upvalues: DeriveCartPricingViewFunction (copy)
	local DeriveCartPricingViewResult = DeriveCartPricingViewFunction(p1)
	
	return if DeriveCartPricingViewResult == nil then {} else DeriveCartPricingViewResult.selectedOfferIds
end