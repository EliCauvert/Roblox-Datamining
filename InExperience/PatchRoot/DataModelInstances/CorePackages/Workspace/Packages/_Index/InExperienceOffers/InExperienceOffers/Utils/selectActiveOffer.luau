local _ = require(script:FindFirstAncestor("InExperienceOffers").Types)

return function(p1, p2)
	if p1 == nil then
		return nil
	end
	for i, v in p1 do
		local presentationData = v.presentationData
		
		if v.offerStatus == "AVAILABLE" and presentationData ~= nil and presentationData[p2] ~= nil then
			return {
				offerId = v.offerId,
				offerStatus = v.offerStatus,
				featureKeys = v.featureKeys,
				expirationTimeInUTC = v.expirationTimeInUTC,
				presentationData = presentationData
			}
		end
	end
	return nil
end