local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local offersDebugLoggerModule = require(inExperienceOffers.Internal.OffersDebugLogger)
local offerStatusModule = require(inExperienceOffers.Enums.OfferStatus)
local _ = require(inExperienceOffers.Types)

local function _(p1, p2)
	-- upvalues: offerStatusModule (ref)
	if p1.offerStatus ~= offerStatusModule.Available then
		return nil
	end
	local expirationTimeInUTC = p1.expirationTimeInUTC
	local var1 = if expirationTimeInUTC ~= nil then nil else DateTime.fromIsoDate(expirationTimeInUTC)
	
	if var1 == nil then
		return nil
	end
	local var2 = (var1.UnixTimestampMillis - p2) / 1000
	
	return if var2 > 0 then var2 else nil
end

local function keyEmptiesInSeconds(p1, p2)
	-- upvalues: offerStatusModule (ref)
	local var1 = nil
	
	for i, v in p1 do
		local var2
		if v.offerStatus == offerStatusModule.Available then
			local expirationTimeInUTC = v.expirationTimeInUTC
			local var3 = if expirationTimeInUTC ~= nil then nil else DateTime.fromIsoDate(expirationTimeInUTC)
			
			if var3 == nil then
				var2 = nil
			else
				local var4 = (var3.UnixTimestampMillis - p2) / 1000
				var2 = if var4 > 0 then var4 else nil
			end
		else
			var2 = nil
		end
		if var2 ~= nil and (var1 == nil or var1 < var2) then
			var1 = var2
		end
	end
	return var1
end

return function(p3)
	-- upvalues: keyEmptiesInSeconds (ref), offersDebugLoggerModule (ref)
	local unixTimestampMillis = DateTime.now().UnixTimestampMillis
	local var5 = nil
	
	for i, v in p3 do
		local var6 = keyEmptiesInSeconds(v, unixTimestampMillis)
		
		if var6 ~= nil and (var5 == nil or var6 < var5) then
			var5 = var6
		end
	end
	offersDebugLoggerModule.logLazy(function()
		-- upvalues: var5 (write)
		return string.format("getSecondsUntilAnyKeyEmpties return %s", tostring(var5))
	end)
	
	return var5
end