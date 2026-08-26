local deriveCartPricingView = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience).deriveCartPricingView

return function(p1)
	-- upvalues: deriveCartPricingView (ref)
	local var1 = deriveCartPricingView(p1)
	
	return if var1 == nil then {} else var1.selectedOfferIds
end