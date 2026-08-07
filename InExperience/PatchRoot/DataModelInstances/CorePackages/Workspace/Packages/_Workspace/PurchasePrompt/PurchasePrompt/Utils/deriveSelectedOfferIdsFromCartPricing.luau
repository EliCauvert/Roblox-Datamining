local deriveCartPricingView = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience).deriveCartPricingView

return function(p0) --[[ line: 14 | named "deriveSelectedOfferIdsFromCartPricing" ]]
	-- upvalues: deriveCartPricingView (ref)
	local var0 = deriveCartPricingView(p0)
	
	return if var0 == nil then {} else var0.selectedOfferIds
end