local _ = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Models.GetRobloxSubscriptionProductsModel)

return function(p1)
	if not p1 then
		return nil
	end
	local eligibleOffers = p1.EligibleOffers
	local var1 = eligibleOffers and eligibleOffers[1]
	
	return if var1 == nil or var1.OfferType ~= "FreeTrial" then nil else var1
end