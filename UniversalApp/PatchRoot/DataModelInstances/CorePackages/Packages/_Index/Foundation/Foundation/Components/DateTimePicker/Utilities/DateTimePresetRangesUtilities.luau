local DateTimeCalendarViewUtilitiesModule = require(script.Parent.DateTimeCalendarViewUtilities)
local DateTimePickerDateRangePresetModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerDateRangePreset)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function toStartOfDay(p1)
	-- upvalues: DateTimeUtilitiesModule (copy)
	local LocalTime = DateTimeUtilitiesModule.toLocalTime(p1)
	
	return DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day)
end

local function _(p1, p2: number)
	-- upvalues: DateTimeUtilitiesModule (copy), toStartOfDay (copy)
	local LocalTime = DateTimeUtilitiesModule.toLocalTime(p1)
	
	return toStartOfDay(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day, 12, 0, 0).UnixTimestamp + p2 * 86400))
end

return {
	resolvePresetRange = function(LastWeek, p1)
		-- upvalues: DateTimeUtilitiesModule (copy), DateTimePickerDateRangePresetModule (copy), DateTimeCalendarViewUtilitiesModule (copy)
		local P4 = p1 or DateTime.now()
		local LocalTime = DateTimeUtilitiesModule.toLocalTime(P4)
		local LocalTime1 = DateTimeUtilitiesModule.toLocalTime(P4)
		local _DateTime = DateTime.fromLocalTime(LocalTime1.Year, LocalTime1.Month, LocalTime1.Day)
		
		if LastWeek == DateTimePickerDateRangePresetModule.Today then
			return { startDate = _DateTime, endDate = _DateTime }
		elseif LastWeek == DateTimePickerDateRangePresetModule.ThisWeek then
			local LocalTime2 = DateTimeUtilitiesModule.toLocalTime(_DateTime)
			local LocalTime3 = DateTimeUtilitiesModule.toLocalTime((DateTime.fromUnixTimestamp(DateTime.fromLocalTime(LocalTime2.Year, LocalTime2.Month, LocalTime2.Day, 12, 0, 0).UnixTimestamp + -DateTimeCalendarViewUtilitiesModule.getDayOfWeek(P4) * 86400)))
			local _DateTime1 = DateTime.fromLocalTime(LocalTime3.Year, LocalTime3.Month, LocalTime3.Day)
			local LocalTime4 = DateTimeUtilitiesModule.toLocalTime(_DateTime1)
			local LocalTime5 = DateTimeUtilitiesModule.toLocalTime((DateTime.fromUnixTimestamp(DateTime.fromLocalTime(LocalTime4.Year, LocalTime4.Month, LocalTime4.Day, 12, 0, 0).UnixTimestamp + 518400)))
			
			return {
				startDate = _DateTime1,
				endDate = DateTime.fromLocalTime(LocalTime5.Year, LocalTime5.Month, LocalTime5.Day)
			}
		elseif LastWeek == DateTimePickerDateRangePresetModule.LastWeek then
			local LocalTime6 = DateTimeUtilitiesModule.toLocalTime(_DateTime)
			local LocalTime7 = DateTimeUtilitiesModule.toLocalTime((DateTime.fromUnixTimestamp(DateTime.fromLocalTime(LocalTime6.Year, LocalTime6.Month, LocalTime6.Day, 12, 0, 0).UnixTimestamp + (-DateTimeCalendarViewUtilitiesModule.getDayOfWeek(P4) - 7) * 86400)))
			local _DateTime2 = DateTime.fromLocalTime(LocalTime7.Year, LocalTime7.Month, LocalTime7.Day)
			local LocalTime8 = DateTimeUtilitiesModule.toLocalTime(_DateTime2)
			local LocalTime9 = DateTimeUtilitiesModule.toLocalTime((DateTime.fromUnixTimestamp(DateTime.fromLocalTime(LocalTime8.Year, LocalTime8.Month, LocalTime8.Day, 12, 0, 0).UnixTimestamp + 518400)))
			
			return {
				startDate = _DateTime2,
				endDate = DateTime.fromLocalTime(LocalTime9.Year, LocalTime9.Month, LocalTime9.Day)
			}
		else
			return if LastWeek == DateTimePickerDateRangePresetModule.ThisMonth then {
				startDate = DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, 1),
				endDate = DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, DateTimeUtilitiesModule.getDaysInMonth(LocalTime.Month, LocalTime.Year))
			} elseif LastWeek == DateTimePickerDateRangePresetModule.ThisYear then {
				startDate = DateTime.fromLocalTime(LocalTime.Year, 1, 1),
				endDate = DateTime.fromLocalTime(LocalTime.Year, 12, 31)
			} else {
				startDate = DateTime.fromLocalTime(LocalTime.Year - 1, 1, 1),
				endDate = DateTime.fromLocalTime(LocalTime.Year - 1, 12, 31)
			}
		end
	end
}