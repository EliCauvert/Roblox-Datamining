local _ = require(script:FindFirstAncestor("InExperienceOffers").Types)
local inExperienceOffersNotificationMaxExposureCount = game:DefineFastInt("InExperienceOffersNotificationMaxExposureCount", 3)
local inExperienceOffersNotificationCooldownSeconds = game:DefineFastInt("InExperienceOffersNotificationCooldownSeconds", 86400)

return function(p1, p2)
	-- upvalues: inExperienceOffersNotificationMaxExposureCount (ref), inExperienceOffersNotificationCooldownSeconds (ref)
	if p1.offerStatus ~= "AVAILABLE" then
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