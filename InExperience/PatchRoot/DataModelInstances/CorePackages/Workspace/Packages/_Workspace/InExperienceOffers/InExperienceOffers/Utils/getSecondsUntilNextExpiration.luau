local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local OffersDebugLoggerModule = require(InExperienceOffers.Internal.OffersDebugLogger)
local FeatureKeyModule = require(InExperienceOffers.Enums.FeatureKey)
local OfferStatusModule = require(InExperienceOffers.Enums.OfferStatus)
local _ = require(InExperienceOffers.Types)

return function(p1): number? --[[ Line: 16 | Named "getSecondsUntilNextExpiration" ]]
	-- upvalues: FeatureKeyModule (copy), OfferStatusModule (copy), OffersDebugLoggerModule (copy)
	local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
	local v1: number? = nil
	local v2 = p1[FeatureKeyModule.RobloxShop]
	
	if v2 == nil then
		return nil
	end
	for _, value in v2 do
		if value.offerStatus == OfferStatusModule.Available then
			local ExpirationTimeInUTC = value.expirationTimeInUTC
			local _DateTime = if ExpirationTimeInUTC == nil then nil else DateTime.fromIsoDate(ExpirationTimeInUTC)
			OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 32 ]]
				-- upvalues: value (copy), ExpirationTimeInUTC (copy), _DateTime (copy)
				return string.format("getSecondsUntilNextExpiration parse offerId=%s expirationTimeInUTC=%s parsedUnixMillis=%s", tostring(value.offerId), tostring(ExpirationTimeInUTC), if _DateTime == nil then "nil" else tostring(_DateTime.UnixTimestampMillis))
			end)
			
			if _DateTime ~= nil then
				local UnixTimestampMillisRatio = (_DateTime.UnixTimestampMillis - UnixTimestampMillis) / 1000
				
				if UnixTimestampMillisRatio > 0 and (v1 == nil or v1 < UnixTimestampMillisRatio) then
					v1 = UnixTimestampMillisRatio
				end
			end
		end
	end
	OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 50 ]]
		-- upvalues: v1 (ref)
		return string.format("getSecondsUntilNextExpiration return %s", (tostring(v1)))
	end)
	
	return v1
end