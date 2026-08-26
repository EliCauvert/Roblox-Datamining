local foundation = script:FindFirstAncestor("Foundation")
local dateTimePickerRangeBandRoleModule = require(foundation.Enums.DateTimePickerRangeBandRole)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local localizationService = require(foundation.Utility.Wrappers).Services.LocalizationService

local function roundUpToNearestHalfHour(value)
	-- upvalues: dateTimeUtilitiesModule (ref)
	local var1 = dateTimeUtilitiesModule.toLocalTime(value)
	
	if var1.Second == 0 and (var1.Minute == 0 or var1.Minute == 30) then
		return dateTimeUtilitiesModule.roundDownToNearestMinute(value)
	end
	local var2 = dateTimeUtilitiesModule.roundToStartOfDay(value)
	
	return DateTime.fromUnixTimestamp(var2 + math.min(math.ceil((value.UnixTimestamp - var2) / 1800) * 1800, 84600))
end

return {
	getDayOfWeek = function(p1)
		return tonumber(p1:FormatLocalTime("d", "en-us")) or 0
	end,
	getRangeBandRadiusTag = function(p1, p2, p3)
		-- upvalues: dateTimeUtilitiesModule (ref), dateTimePickerRangeBandRoleModule (ref)
		local var1 = dateTimeUtilitiesModule.roundToStartOfDay(p2.startDate)
		local var2 = dateTimeUtilitiesModule.roundToStartOfDay(p2.endDate)
		local minValue = math.min(var1, var2)
		local maxValue = math.max(var1, var2)
		local var3 = dateTimeUtilitiesModule.roundToStartOfDay(p1)
		local var4 = minValue < var3
		maxValue = var3 < maxValue
		local d = tonumber(p1:FormatLocalTime("d", "en-us")) or 0
		local var5 = if p3 == dateTimePickerRangeBandRoleModule.Start then false elseif d ~= 0 then not var4 else true
		local var6 = if p3 == dateTimePickerRangeBandRoleModule.End then false elseif d ~= 6 then not maxValue else true
		
		return if var5 and var6 then "radius-circle" elseif var5 then "radius-left-circle" elseif var6 then "radius-right-circle" else ""
	end,
	getRangeDayBounds = function(p1)
		-- upvalues: dateTimeUtilitiesModule (ref)
		local var1 = dateTimeUtilitiesModule.roundToStartOfDay(p1.startDate)
		local var2 = dateTimeUtilitiesModule.roundToStartOfDay(p1.endDate)
		
		return math.min(var1, var2), math.max(var1, var2)
	end,
	getTimeSlotIndex = function(p1, p2)
		if p2 == nil then
			return nil
		end
		for i, v in p1 do
			if v.id == p2 then
				return i
			end
		end
		return nil
	end,
	getTimeSlotsForDay = function(p3)
		-- upvalues: roundUpToNearestHalfHour (ref), dateTimeUtilitiesModule (ref), localizationService (ref)
		local var1 = dateTimeUtilitiesModule.toLocalTime(roundUpToNearestHalfHour(p3))
		local unixTimestamp = DateTime.fromLocalTime(var1.Year, var1.Month, var1.Day, var1.Hour, var1.Minute, 0).UnixTimestamp
		local t = {}
		
		for i = 0, 47 do
			local dateTime = DateTime.fromLocalTime(var1.Year, var1.Month, var1.Day, math.floor(i / 2), i % 2 * 30, 0)
			table.insert(t, {
				id = dateTime.UnixTimestamp,
				text = dateTime:FormatLocalTime("LT", localizationService.RobloxLocaleId)
			})
		end
		return t, unixTimestamp
	end,
	resolveAnchorDate = function(p4, p5)
		return if p4 and p4[1] then p4[1] else p5 or DateTime.now()
	end,
	roundUpToNearestHalfHour = roundUpToNearestHalfHour,
	toViewDate = function(p4)
		-- upvalues: dateTimeUtilitiesModule (ref)
		local var2 = dateTimeUtilitiesModule.toLocalTime(p4)
		
		return { month = var2.Month, year = var2.Year }
	end
}