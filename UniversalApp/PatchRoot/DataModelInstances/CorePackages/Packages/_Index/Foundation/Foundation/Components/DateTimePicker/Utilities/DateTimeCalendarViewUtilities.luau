local foundation = script:FindFirstAncestor("Foundation")
local dateTimePickerRangeBandRoleModule = require(foundation.Enums.DateTimePickerRangeBandRole)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local localizationService = require(foundation.Utility.Wrappers).Services.LocalizationService

local function roundUpToNearestHalfHour(value) --[[ line: 35 ]]
	-- upvalues: dateTimeUtilitiesModule (ref)
	local var4 = dateTimeUtilitiesModule.toLocalTime(value)
	
	if var4.Second == 0 and (var4.Minute == 0 or var4.Minute == 30) then
		return dateTimeUtilitiesModule.roundDownToNearestMinute(value)
	end
	local var5 = dateTimeUtilitiesModule.roundToStartOfDay(value)
	
	return DateTime.fromUnixTimestamp(var5 + math.min(math.ceil((value.UnixTimestamp - var5) / 1800) * 1800, 84600))
end

return {
	getDayOfWeek = function(p0) --[[ line: 117 ]]
		return tonumber(p0:FormatLocalTime("d", "en-us")) or 0
	end,
	getRangeBandRadiusTag = function(p1, p2, p3) --[[ line: 130 ]]
		-- upvalues: dateTimeUtilitiesModule (ref), dateTimePickerRangeBandRoleModule (ref)
		local var6 = dateTimeUtilitiesModule.roundToStartOfDay(p2.startDate)
		local var7 = dateTimeUtilitiesModule.roundToStartOfDay(p2.endDate)
		local minValue = math.min(var6, var7)
		local maxValue = math.max(var6, var7)
		local var10 = dateTimeUtilitiesModule.roundToStartOfDay(p1)
		local var11 = minValue < var10
		maxValue = var10 < maxValue
		local d = tonumber(p1:FormatLocalTime("d", "en-us")) or 0
		local var13 = if p3 == dateTimePickerRangeBandRoleModule.Start then false elseif d ~= 0 then not var11 else true
		local var14 = if p3 == dateTimePickerRangeBandRoleModule.End then false elseif d ~= 6 then not maxValue else true
		
		return if var13 and var14 then "radius-circle" elseif var13 then "radius-left-circle" elseif var14 then "radius-right-circle" else ""
	end,
	getRangeDayBounds = function(p4) --[[ line: 123 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		local var15 = dateTimeUtilitiesModule.roundToStartOfDay(p4.startDate)
		local var16 = dateTimeUtilitiesModule.roundToStartOfDay(p4.endDate)
		
		return math.min(var15, var16), math.max(var15, var16)
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
		local var17 = dateTimeUtilitiesModule.toLocalTime(roundUpToNearestHalfHour(p7))
		local unixTimestamp = DateTime.fromLocalTime(var17.Year, var17.Month, var17.Day, var17.Hour, var17.Minute, 0).UnixTimestamp
		local t = {}
		
		for i = 0, 47 do
			local dateTime = DateTime.fromLocalTime(var17.Year, var17.Month, var17.Day, math.floor(i / 2), i % 2 * 30, 0)
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
		local var20 = dateTimeUtilitiesModule.toLocalTime(p10)
		
		return { month = var20.Month, year = var20.Year }
	end
}