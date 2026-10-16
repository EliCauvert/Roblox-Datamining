local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local OffersDebugLoggerModule = require(InExperienceOffers.Internal.OffersDebugLogger)
local OfferStatusModule = require(InExperienceOffers.Enums.OfferStatus)
local _ = require(InExperienceOffers.Types)

local function _(p1, p2) --[[ Line: 11 | Named "secondsUntilExpiry" ]]
	-- upvalues: OfferStatusModule (copy)
	if p1.offerStatus ~= OfferStatusModule.Available then
		return nil
	end
	local ExpirationTimeInUTC = p1.expirationTimeInUTC
	local _DateTime = if ExpirationTimeInUTC == nil then nil else DateTime.fromIsoDate(ExpirationTimeInUTC)
	
	if _DateTime == nil then
		return nil
	else
		local UnixTimestampMillisRatio = (_DateTime.UnixTimestampMillis - p2) / 1000
		
		return if UnixTimestampMillisRatio > 0 then UnixTimestampMillisRatio else nil
	end
end

local function keyEmptiesInSeconds(List, UnixTimestampMillis) --[[ Line: 26 ]]
	-- upvalues: OfferStatusModule (copy)
	local v1 = nil
	
	for _, value in List do
		local v2 = nil
		if value.offerStatus == OfferStatusModule.Available then
			local ExpirationTimeInUTC = value.expirationTimeInUTC
			local _DateTime = if ExpirationTimeInUTC == nil then nil else DateTime.fromIsoDate(ExpirationTimeInUTC)
			
			if _DateTime == nil then
				v2 = nil
			else
				local UnixTimestampMillisRatio = (_DateTime.UnixTimestampMillis - UnixTimestampMillis) / 1000
				v2 = if UnixTimestampMillisRatio > 0 then UnixTimestampMillisRatio else nil
			end
		else
			v2 = nil
		end
		if v2 ~= nil and (v1 == nil or v1 < v2) then
			v1 = v2
		end
	end
	return v1
end

return function(List) --[[ Line: 41 | Named "getSecondsUntilAnyKeyEmpties" ]]
	-- upvalues: keyEmptiesInSeconds (copy), OffersDebugLoggerModule (copy)
	local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
	local v3 = nil
	
	for _, value in List do
		local KeyEmptiesInSecondsResult = keyEmptiesInSeconds(value, UnixTimestampMillis)
		
		if KeyEmptiesInSecondsResult ~= nil and (v3 == nil or KeyEmptiesInSecondsResult < v3) then
			v3 = KeyEmptiesInSecondsResult
		end
	end
	OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 51 ]]
		-- upvalues: v3 (ref)
		return string.format("getSecondsUntilAnyKeyEmpties return %s", (tostring(v3)))
	end)
	
	return v3
end