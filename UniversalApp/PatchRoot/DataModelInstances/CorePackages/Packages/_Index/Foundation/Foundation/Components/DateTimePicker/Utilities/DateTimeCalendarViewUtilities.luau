local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local localizationService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers).Services.LocalizationService

local function roundUpToNearestHalfHour(value) --[[ line: 35 ]]
	-- upvalues: dateTimeUtilitiesModule (ref)
	local var2 = dateTimeUtilitiesModule.toLocalTime(value)
	
	if var2.Second == 0 and (var2.Minute == 0 or var2.Minute == 30) then
		return dateTimeUtilitiesModule.roundDownToNearestMinute(value)
	end
	local var3 = dateTimeUtilitiesModule.roundToStartOfDay(value)
	
	return DateTime.fromUnixTimestamp(var3 + math.min(math.ceil((value.UnixTimestamp - var3) / 1800) * 1800, 84600))
end

return {
	getDayOfWeek = function(p0) --[[ line: 117 ]]
		return tonumber(p0:FormatLocalTime("d", "en-us")) or 0
	end,
	getRangeBandRadiusTag = function(p1, p2, p3) --[[ line: 130 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		local var4 = dateTimeUtilitiesModule.roundToStartOfDay(p2.startDate)
		local var5 = dateTimeUtilitiesModule.roundToStartOfDay(p2.endDate)
		local minValue = math.min(var4, var5)
		local maxValue = math.max(var4, var5)
		local var8 = dateTimeUtilitiesModule.roundToStartOfDay(p1)
		local var9 = minValue < var8
		maxValue = var8 < maxValue
		local d = tonumber(p1:FormatLocalTime("d", "en-us")) or 0
		local var11 = if p3 == "start" then false elseif d ~= 0 then not var9 else true
		local var12 = if p3 == "end" then false elseif d ~= 6 then not maxValue else true
		
		return if var11 and var12 then "radius-circle" elseif var11 then "radius-left-circle" elseif var12 then "radius-right-circle" else ""
	end,
	getRangeDayBounds = function(p4) --[[ line: 123 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		local var13 = dateTimeUtilitiesModule.roundToStartOfDay(p4.startDate)
		local var14 = dateTimeUtilitiesModule.roundToStartOfDay(p4.endDate)
		
		return math.min(var13, var14), math.max(var13, var14)
	end,
	getTimeSlotIndex = function(p5, p6) --[[ line: 104 ]]
		if p6 == nil then
			return nil
		end
		for i, v in p5 do
			if v.id == p6 then
				return i
			end
		end
		return nil
	end,
	getTimeSlotsForDay = function(p7) --[[ line: 73 ]]
		-- upvalues: roundUpToNearestHalfHour (ref), dateTimeUtilitiesModule (ref), localizationService (ref)
		local var15 = dateTimeUtilitiesModule.toLocalTime(roundUpToNearestHalfHour(p7))
		local unixTimestamp = DateTime.fromLocalTime(var15.Year, var15.Month, var15.Day, var15.Hour, var15.Minute, 0).UnixTimestamp
		local t = {}
		
		for i = 0, 47 do
			local dateTime = DateTime.fromLocalTime(var15.Year, var15.Month, var15.Day, math.floor(i / 2), i % 2 * 30, 0)
			table.insert(t, {
				id = dateTime.UnixTimestamp,
				text = dateTime:FormatLocalTime("LT", localizationService.RobloxLocaleId)
			})
		end
		return t, unixTimestamp
	end,
	resolveAnchorDate = function(p8, p9) --[[ line: 53 ]]
		return if p8 and p8[1] then p8[1] else p9 or DateTime.now()
	end,
	roundUpToNearestHalfHour = roundUpToNearestHalfHour,
	toViewDate = function(p10) --[[ line: 29 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		local var18 = dateTimeUtilitiesModule.toLocalTime(p10)
		
		return { month = var18.Month, year = var18.Year }
	end
}