local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local _ = require(inExperienceOffers.Types)
local fFlagOffersRespectExpirationModule = require(inExperienceOffers.Flags.FFlagOffersRespectExpiration)
local isOfferExpiredModule = require(inExperienceOffers.Utils.isOfferExpired)
local inExperienceOffersNotificationMaxExposureCount = game:DefineFastInt("InExperienceOffersNotificationMaxExposureCount", 3)
local inExperienceOffersNotificationCooldownSeconds = game:DefineFastInt("InExperienceOffersNotificationCooldownSeconds", 86400)

return function(p1, p2)
	-- upvalues: fFlagOffersRespectExpirationModule (ref), isOfferExpiredModule (ref), inExperienceOffersNotificationMaxExposureCount (ref), inExperienceOffersNotificationCooldownSeconds (ref)
	if p1.offerStatus ~= "AVAILABLE" then
		return false
	elseif fFlagOffersRespectExpirationModule and isOfferExpiredModule(p1) then
		return false
	end
	local offerId = p2[p1.offerId]
	
	if offerId == nil then
		return true
	elseif inExperienceOffersNotificationMaxExposureCount <= offerId.exposureCount then
		return false
	end
	local dateTime = DateTime.fromIsoDate(offerId.lastExposureUTCTime)
	
	return if dateTime == nil then false else inExperienceOffersNotificationCooldownSeconds <= DateTime.now().UnixTimestamp - dateTime.UnixTimestamp
end