return function(p0)
	if not p0 then
		return false
	end
	local eligibleOffers = p0.EligibleOffers
	local var0 = eligibleOffers and eligibleOffers[1]
	
	return var0 ~= nil and var0.OfferType == "FreeTrial"
end