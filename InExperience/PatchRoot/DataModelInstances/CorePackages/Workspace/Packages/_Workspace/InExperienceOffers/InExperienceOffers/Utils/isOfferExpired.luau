local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local OffersDebugLoggerModule = require(InExperienceOffers.Internal.OffersDebugLogger)
local _ = require(InExperienceOffers.Types)

return function(p1): boolean
	-- upvalues: OffersDebugLoggerModule (copy)
	local ExpirationTimeInUTC = p1.expirationTimeInUTC
	local _DateTime = if ExpirationTimeInUTC == nil then nil else DateTime.fromIsoDate(ExpirationTimeInUTC)
	OffersDebugLoggerModule.logLazy(function(): string
		-- upvalues: p1 (copy), ExpirationTimeInUTC (copy), _DateTime (copy)
		return string.format("isOfferExpired parse offerId=%s expirationTimeInUTC=%s parsedUnixMillis=%s", tostring(p1.offerId), tostring(ExpirationTimeInUTC), if _DateTime == nil then "nil" else tostring(_DateTime.UnixTimestampMillis))
	end)
	
	if _DateTime == nil then
		OffersDebugLoggerModule.log("isOfferExpired return false (unparsed or missing expiry)")
		
		return false
	else
		local IsUnixTimestampMillisBelow = _DateTime.UnixTimestampMillis <= DateTime.now().UnixTimestampMillis
		OffersDebugLoggerModule.logLazy(function(): string
			-- upvalues: IsUnixTimestampMillisBelow (copy)
			return string.format("isOfferExpired return %s", (tostring(IsUnixTimestampMillisBelow)))
		end)
		
		return IsUnixTimestampMillisBelow
	end
end