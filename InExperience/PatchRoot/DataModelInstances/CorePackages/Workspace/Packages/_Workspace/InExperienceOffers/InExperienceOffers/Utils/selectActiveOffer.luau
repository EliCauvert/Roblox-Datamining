local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local FFlagOffersRespectExpirationModule = require(InExperienceOffers.Flags.FFlagOffersRespectExpiration)
local IsOfferExpiredModule = require(InExperienceOffers.Utils.isOfferExpired)
local _ = require(InExperienceOffers.Types)

return function(List, p1)
	-- upvalues: FFlagOffersRespectExpirationModule (copy), IsOfferExpiredModule (copy)
	if List == nil then
		return nil
	end
	local PresentationData = nil
	for _, value in List do
		PresentationData = value.presentationData
		
		if value.offerStatus == "AVAILABLE" and PresentationData ~= nil and PresentationData[p1] ~= nil and (not FFlagOffersRespectExpirationModule or not IsOfferExpiredModule(value)) then
			return {
				offerId = value.offerId,
				offerStatus = value.offerStatus,
				featureKeys = value.featureKeys,
				expirationTimeInUTC = value.expirationTimeInUTC,
				presentationData = PresentationData
			}
		end
	end
	return nil
end