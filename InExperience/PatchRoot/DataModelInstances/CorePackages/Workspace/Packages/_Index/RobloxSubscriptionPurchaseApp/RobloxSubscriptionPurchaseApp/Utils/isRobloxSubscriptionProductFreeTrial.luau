return function(p1)
	if not p1 then
		return false
	end
	local eligibleOffers = p1.EligibleOffers
	local var1 = eligibleOffers and eligibleOffers[1]
	
	return var1 ~= nil and var1.OfferType == "FreeTrial"
end