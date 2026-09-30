local getFreeTrialOfferModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Utils.getFreeTrialOffer)

return function(p1)
	-- upvalues: getFreeTrialOfferModule (ref)
	return getFreeTrialOfferModule(p1) ~= nil
end