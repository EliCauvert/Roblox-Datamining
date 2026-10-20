local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local DeriveCartPricingViewFunction = require(Parent.IAPExperience).deriveCartPricingView
local FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice = require(Parent.SharedFlags).FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice

return function(p1, p2)
	-- upvalues: FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (copy), DeriveCartPricingViewFunction (copy)
	if FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice then
		local DeriveCartPricingViewResult = DeriveCartPricingViewFunction(p1)
		
		return if DeriveCartPricingViewResult == nil then p2 else DeriveCartPricingViewResult.priceAfterDiscount
	else
		return p2
	end
end