local GetFreeTrialOfferModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Utils.getFreeTrialOffer)

return function(p1): boolean
	-- upvalues: GetFreeTrialOfferModule (copy)
	return GetFreeTrialOfferModule(p1) ~= nil
end