return function(p1): boolean
	if p1 then
		local EligibleOffers = p1.EligibleOffers
		local EligibleOffer = EligibleOffers and EligibleOffers[1]
		
		return EligibleOffer ~= nil and EligibleOffer.OfferType == "FreeTrial"
	else
		return false
	end
end