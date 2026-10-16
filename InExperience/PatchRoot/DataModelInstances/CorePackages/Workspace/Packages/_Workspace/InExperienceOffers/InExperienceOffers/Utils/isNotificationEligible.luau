local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local _ = require(InExperienceOffers.Types)
local FFlagOffersRespectExpirationModule = require(InExperienceOffers.Flags.FFlagOffersRespectExpiration)
local IsOfferExpiredModule = require(InExperienceOffers.Utils.isOfferExpired)
local InExperienceOffersNotificationMaxExposureCount = game:DefineFastInt("InExperienceOffersNotificationMaxExposureCount", 3)
local InExperienceOffersNotificationCooldownSeconds = game:DefineFastInt("InExperienceOffersNotificationCooldownSeconds", 86400)

return function(p1, p2): boolean --[[ Line: 24 | Named "isNotificationEligible" ]]
	-- upvalues: FFlagOffersRespectExpirationModule (copy), IsOfferExpiredModule (copy), InExperienceOffersNotificationMaxExposureCount (copy), InExperienceOffersNotificationCooldownSeconds (copy)
	if p1.offerStatus ~= "AVAILABLE" then
		return false
	elseif FFlagOffersRespectExpirationModule and IsOfferExpiredModule(p1) then
		return false
	else
		local v1 = p2[p1.offerId]
		
		if v1 == nil then
			return true
		elseif InExperienceOffersNotificationMaxExposureCount <= v1.exposureCount then
			return false
		else
			local _DateTime = DateTime.fromIsoDate(v1.lastExposureUTCTime)
			
			return _DateTime ~= nil and InExperienceOffersNotificationCooldownSeconds <= DateTime.now().UnixTimestamp - _DateTime.UnixTimestamp
		end
	end
end