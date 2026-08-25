local parent = script:FindFirstAncestor("PurchasePrompt").Parent
local deriveCartPricingView = require(parent.IAPExperience).deriveCartPricingView
local fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice = require(parent.SharedFlags).FFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice

return function(p0, p1)
	-- upvalues: fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice (ref), deriveCartPricingView (ref)
	if not fFlagPurchasePromptUnifiedEventsUseOfferAdjustedPrice then
		return p1
	end
	local var0 = deriveCartPricingView(p0)
	
	return if var0 == nil then p1 else var0.priceAfterDiscount
end