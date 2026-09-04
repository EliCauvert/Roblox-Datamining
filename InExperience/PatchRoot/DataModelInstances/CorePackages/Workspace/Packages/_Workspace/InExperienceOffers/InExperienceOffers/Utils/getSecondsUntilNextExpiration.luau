local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local offersDebugLoggerModule = require(inExperienceOffers.Internal.OffersDebugLogger)
local featureKeyModule = require(inExperienceOffers.Enums.FeatureKey)
local offerStatusModule = require(inExperienceOffers.Enums.OfferStatus)
local _ = require(inExperienceOffers.Types)

return function(p1)
	-- upvalues: featureKeyModule (ref), offerStatusModule (ref), offersDebugLoggerModule (ref)
	local unixTimestampMillis = DateTime.now().UnixTimestampMillis
	local var1 = nil
	local robloxShop = p1[featureKeyModule.RobloxShop]
	
	if robloxShop == nil then
		return nil
	end
	for i, v in robloxShop do
		if v.offerStatus == offerStatusModule.Available then
			local expirationTimeInUTC = v.expirationTimeInUTC
			local var2 = if expirationTimeInUTC ~= nil then nil else DateTime.fromIsoDate(expirationTimeInUTC)
			offersDebugLoggerModule.logLazy(function()
				-- upvalues: v (ref), expirationTimeInUTC (ref), var2 (ref)
				return string.format("getSecondsUntilNextExpiration parse offerId=%s expirationTimeInUTC=%s parsedUnixMillis=%s", tostring(v.offerId), tostring(expirationTimeInUTC), if var2 ~= nil then "nil" else tostring(var2.UnixTimestampMillis))
			end)
			
			if var2 ~= nil then
				local var3 = (var2.UnixTimestampMillis - unixTimestampMillis) / 1000
				
				if var3 > 0 and (var1 == nil or var1 < var3) then
					var1 = var3
				end
			end
		end
	end
	offersDebugLoggerModule.logLazy(function()
		-- upvalues: var1 (write)
		return string.format("getSecondsUntilNextExpiration return %s", tostring(var1))
	end)
	
	return var1
end