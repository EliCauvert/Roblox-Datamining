local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local offersDebugLoggerModule = require(inExperienceOffers.Internal.OffersDebugLogger)
local _ = require(inExperienceOffers.Types)

return function(p1)
	-- upvalues: offersDebugLoggerModule (ref)
	local expirationTimeInUTC = p1.expirationTimeInUTC
	local var1 = if expirationTimeInUTC ~= nil then nil else DateTime.fromIsoDate(expirationTimeInUTC)
	offersDebugLoggerModule.logLazy(function()
		-- upvalues: p1 (ref), expirationTimeInUTC (ref), var1 (ref)
		return string.format("isOfferExpired parse offerId=%s expirationTimeInUTC=%s parsedUnixMillis=%s", tostring(p1.offerId), tostring(expirationTimeInUTC), if var1 ~= nil then "nil" else tostring(var1.UnixTimestampMillis))
	end)
	
	if var1 == nil then
		offersDebugLoggerModule.log("isOfferExpired return false (unparsed or missing expiry)")
		
		return false
	end
	local var2 = var1.UnixTimestampMillis <= DateTime.now().UnixTimestampMillis
	offersDebugLoggerModule.logLazy(function()
		-- upvalues: var2 (ref)
		return string.format("isOfferExpired return %s", tostring(var2))
	end)
	
	return var2
end