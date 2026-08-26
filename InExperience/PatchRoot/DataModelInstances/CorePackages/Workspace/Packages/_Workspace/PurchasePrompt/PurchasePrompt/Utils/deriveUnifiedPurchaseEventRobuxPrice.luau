local parent = script:FindFirstAncestor("PurchasePrompt").Parent
local deriveCartPricingView = require(parent.IAPExperience).deriveCartPricingView
local fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice = require(parent.SharedFlags).FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice

return function(p1, p2)
	-- upvalues: fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (ref), deriveCartPricingView (ref)
	if not fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice then
		return p2
	end
	local var1 = deriveCartPricingView(p1)
	
	return if var1 == nil then p2 else var1.priceAfterDiscount
end