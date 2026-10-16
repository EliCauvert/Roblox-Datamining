local GetFreeTrialOfferModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Utils.getFreeTrialOffer)

return function(p1): boolean --[[ Line: 5 | Named "isRobloxSubscriptionProductFreeTrial" ]]
	-- upvalues: GetFreeTrialOfferModule (copy)
	return GetFreeTrialOfferModule(p1) ~= nil
end