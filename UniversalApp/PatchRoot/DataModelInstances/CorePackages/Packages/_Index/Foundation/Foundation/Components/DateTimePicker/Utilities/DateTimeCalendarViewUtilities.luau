local Foundation = script:FindFirstAncestor("Foundation")
local DateTimePickerRangeBandRoleModule = require(Foundation.Enums.DateTimePickerRangeBandRole)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local LocalizationService = require(Foundation.Utility.Wrappers).Services.LocalizationService

local function roundUpToNearestHalfHour(p1)
	-- upvalues: DateTimeUtilitiesModule (copy)
	local LocalTime = DateTimeUtilitiesModule.toLocalTime(p1)
	
	if LocalTime.Second == 0 and (LocalTime.Minute == 0 or LocalTime.Minute == 30) then
		return DateTimeUtilitiesModule.roundDownToNearestMinute(p1)
	else
		local RoundToStartOfDayResult = DateTimeUtilitiesModule.roundToStartOfDay(p1)
		
		return DateTime.fromUnixTimestamp(RoundToStartOfDayResult + math.min(math.ceil((p1.UnixTimestamp - RoundToStartOfDayResult) / 1800) * 1800, 84600))
	end
end

return {
	getDayOfWeek = function(p1): number
		return tonumber((p1:FormatLocalTime("d", "en-us"))) or 0
	end,
	getRangeBandRadiusTag = function(p1, p2, End): string
		-- upvalues: DateTimeUtilitiesModule (copy), DateTimePickerRangeBandRoleModule (copy)
		local RoundToStartOfDayResult: number = DateTimeUtilitiesModule.roundToStartOfDay(p2.startDate)
		local RoundToStartOfDayResult1: number = DateTimeUtilitiesModule.roundToStartOfDay(p2.endDate)
		local Smallest = math.min(RoundToStartOfDayResult, RoundToStartOfDayResult1)
		local Largest = math.max(RoundToStartOfDayResult, RoundToStartOfDayResult1)
		local RoundToStartOfDayResult2 = DateTimeUtilitiesModule.roundToStartOfDay(p1)
		local Number: number = tonumber((p1:FormatLocalTime("d", "en-us"))) or 0
		local IsNumberMatch: boolean = End ~= DateTimePickerRangeBandRoleModule.Start and (Number == 0 or not (Smallest < RoundToStartOfDayResult2))
		local IsNumberMatch1: boolean = End ~= DateTimePickerRangeBandRoleModule.End and (Number == 6 or not (RoundToStartOfDayResult2 < Largest))
		
		return if IsNumberMatch and IsNumberMatch1 then "radius-circle" elseif IsNumberMatch then "radius-left-circle" elseif IsNumberMatch1 then "radius-right-circle" else ""
	end,
	getRangeDayBounds = function(p1)
		-- upvalues: DateTimeUtilitiesModule (copy)
		local RoundToStartOfDayResult: number = DateTimeUtilitiesModule.roundToStartOfDay(p1.startDate)
		local RoundToStartOfDayResult1: number = DateTimeUtilitiesModule.roundToStartOfDay(p1.endDate)
		
		return math.min(RoundToStartOfDayResult, RoundToStartOfDayResult1), (math.max(RoundToStartOfDayResult, RoundToStartOfDayResult1))
	end,
	getTimeSlotIndex = function(List, Id)
		if Id == nil then
			return nil
		end
		for i, value in List do
			if value.id == Id then
				return i
			end
		end
		return nil
	end,
	getTimeSlotsForDay = function(p1)
		-- upvalues: roundUpToNearestHalfHour (copy), DateTimeUtilitiesModule (copy), LocalizationService (copy)
		local LocalTime = DateTimeUtilitiesModule.toLocalTime((roundUpToNearestHalfHour(p1)))
		local UnixTimestamp = DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day, LocalTime.Hour, LocalTime.Minute, 0).UnixTimestamp
		local List = {}
		
		for i = 0, 47 do
			local _DateTime = DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day, math.floor(i / 2), i % 2 * 30, 0)
			table.insert(List, {
				id = _DateTime.UnixTimestamp,
				text = _DateTime:FormatLocalTime("LT", LocalizationService.RobloxLocaleId)
			})
		end
		return List, UnixTimestamp
	end,
	resolveAnchorDate = function(Entry, p2)
		return if Entry and Entry[1] then Entry[1] elseif p2 then p2 else DateTime.now()
	end,
	roundUpToNearestHalfHour = roundUpToNearestHalfHour,
	toViewDate = function(p2)
		-- upvalues: DateTimeUtilitiesModule (copy)
		local LocalTime = DateTimeUtilitiesModule.toLocalTime(p2)
		
		return { month = LocalTime.Month, year = LocalTime.Year }
	end
}