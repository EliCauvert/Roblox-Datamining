local _ = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Models.GetRobloxSubscriptionProductsModel)

return function(p1)
	if p1 then
		local EligibleOffers = p1.EligibleOffers
		local EligibleOffer = EligibleOffers and EligibleOffers[1]
		
		return if EligibleOffer == nil or EligibleOffer.OfferType ~= "FreeTrial" then nil else EligibleOffer
	else
		return nil
	end
end