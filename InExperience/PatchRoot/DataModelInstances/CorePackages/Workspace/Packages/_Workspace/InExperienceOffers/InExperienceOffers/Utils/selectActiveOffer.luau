local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local fFlagOffersRespectExpirationModule = require(inExperienceOffers.Flags.FFlagOffersRespectExpiration)
local isOfferExpiredModule = require(inExperienceOffers.Utils.isOfferExpired)
local _ = require(inExperienceOffers.Types)

return function(p1, p2)
	-- upvalues: fFlagOffersRespectExpirationModule (ref), isOfferExpiredModule (ref)
	if p1 == nil then
		return nil
	end
	for i, v in p1 do
		local presentationData = v.presentationData
		
		if v.offerStatus == "AVAILABLE" and presentationData ~= nil and presentationData[p2] ~= nil and (not fFlagOffersRespectExpirationModule or not isOfferExpiredModule(v)) then
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