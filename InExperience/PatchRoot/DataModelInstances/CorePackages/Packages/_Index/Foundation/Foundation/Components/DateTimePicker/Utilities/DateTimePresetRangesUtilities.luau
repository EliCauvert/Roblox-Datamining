local dateTimeCalendarViewUtilitiesModule = require(script.Parent.DateTimeCalendarViewUtilities)
local dateTimePickerDateRangePresetModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerDateRangePreset)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function toStartOfDay(p0)
	-- upvalues: dateTimeUtilitiesModule (ref)
	local var4 = dateTimeUtilitiesModule.toLocalTime(p0)
	
	return DateTime.fromLocalTime(var4.Year, var4.Month, var4.Day)
end

local function _(p1, p2)
	-- upvalues: dateTimeUtilitiesModule (ref), toStartOfDay (ref)
	local var5 = dateTimeUtilitiesModule.toLocalTime(p1)
	
	return toStartOfDay(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var5.Year, var5.Month, var5.Day, 12, 0, 0).UnixTimestamp + p2 * 86400))
end

return {
	resolvePresetRange = function(value, p3)
		-- upvalues: dateTimeUtilitiesModule (ref), dateTimePickerDateRangePresetModule (ref), dateTimeCalendarViewUtilitiesModule (ref)
		p3 = p3 or DateTime.now()
		local var7 = dateTimeUtilitiesModule.toLocalTime(p3)
		local var8 = dateTimeUtilitiesModule.toLocalTime(p3)
		local dateTime = DateTime.fromLocalTime(var8.Year, var8.Month, var8.Day)
		
		if value == dateTimePickerDateRangePresetModule.Today then
			return { startDate = dateTime, endDate = dateTime }
		elseif value == dateTimePickerDateRangePresetModule.ThisWeek then
			local var10 = dateTimeUtilitiesModule.toLocalTime(dateTime)
			local var11 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var10.Year, var10.Month, var10.Day, 12, 0, 0).UnixTimestamp + -dateTimeCalendarViewUtilitiesModule.getDayOfWeek(p3) * 86400))
			local dateTime_1 = DateTime.fromLocalTime(var11.Year, var11.Month, var11.Day)
			local t = { startDate = dateTime_1 }
			local var14 = dateTimeUtilitiesModule.toLocalTime(dateTime_1)
			local var15 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var14.Year, var14.Month, var14.Day, 12, 0, 0).UnixTimestamp + 518400))
			t.endDate = DateTime.fromLocalTime(var15.Year, var15.Month, var15.Day)
			
			return t
		elseif value == dateTimePickerDateRangePresetModule.LastWeek then
			local var16 = dateTimeUtilitiesModule.toLocalTime(dateTime)
			local var17 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var16.Year, var16.Month, var16.Day, 12, 0, 0).UnixTimestamp + ((-dateTimeCalendarViewUtilitiesModule.getDayOfWeek(p3)) - 7) * 86400))
			local dateTime_1 = DateTime.fromLocalTime(var17.Year, var17.Month, var17.Day)
			local t = { startDate = dateTime_1 }
			local var20 = dateTimeUtilitiesModule.toLocalTime(dateTime_1)
			local var21 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var20.Year, var20.Month, var20.Day, 12, 0, 0).UnixTimestamp + 518400))
			t.endDate = DateTime.fromLocalTime(var21.Year, var21.Month, var21.Day)
			
			return t
		end
		return if value == dateTimePickerDateRangePresetModule.ThisMonth then {
			startDate = DateTime.fromLocalTime(var7.Year, var7.Month, 1),
			endDate = DateTime.fromLocalTime(var7.Year, var7.Month, dateTimeUtilitiesModule.getDaysInMonth(var7.Month, var7.Year))
		} elseif value == dateTimePickerDateRangePresetModule.ThisYear then {
			startDate = DateTime.fromLocalTime(var7.Year, 1, 1),
			endDate = DateTime.fromLocalTime(var7.Year, 12, 31)
		} else {
			startDate = DateTime.fromLocalTime(var7.Year - 1, 1, 1),
			endDate = DateTime.fromLocalTime(var7.Year - 1, 12, 31)
		}
	end
}