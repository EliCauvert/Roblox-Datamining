local dateTimeCalendarViewUtilitiesModule = require(script.Parent.DateTimeCalendarViewUtilities)
local dateTimePickerDateRangePresetModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerDateRangePreset)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function toStartOfDay(p1)
	-- upvalues: dateTimeUtilitiesModule (ref)
	local var1 = dateTimeUtilitiesModule.toLocalTime(p1)
	
	return DateTime.fromLocalTime(var1.Year, var1.Month, var1.Day)
end

local function _(p1, p2)
	-- upvalues: dateTimeUtilitiesModule (ref), toStartOfDay (ref)
	local var1 = dateTimeUtilitiesModule.toLocalTime(p1)
	
	return toStartOfDay(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var1.Year, var1.Month, var1.Day, 12, 0, 0).UnixTimestamp + p2 * 86400))
end

return {
	resolvePresetRange = function(value, p1)
		-- upvalues: dateTimeUtilitiesModule (ref), dateTimePickerDateRangePresetModule (ref), dateTimeCalendarViewUtilitiesModule (ref)
		p1 = p1 or DateTime.now()
		local var1 = dateTimeUtilitiesModule.toLocalTime(p1)
		local var2 = dateTimeUtilitiesModule.toLocalTime(p1)
		local dateTime = DateTime.fromLocalTime(var2.Year, var2.Month, var2.Day)
		
		if value == dateTimePickerDateRangePresetModule.Today then
			return { startDate = dateTime, endDate = dateTime }
		elseif value == dateTimePickerDateRangePresetModule.ThisWeek then
			local var3 = dateTimeUtilitiesModule.toLocalTime(dateTime)
			local var4 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var3.Year, var3.Month, var3.Day, 12, 0, 0).UnixTimestamp + -dateTimeCalendarViewUtilitiesModule.getDayOfWeek(p1) * 86400))
			local dateTime_1 = DateTime.fromLocalTime(var4.Year, var4.Month, var4.Day)
			local t = { startDate = dateTime_1 }
			local var5 = dateTimeUtilitiesModule.toLocalTime(dateTime_1)
			local var6 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var5.Year, var5.Month, var5.Day, 12, 0, 0).UnixTimestamp + 518400))
			t.endDate = DateTime.fromLocalTime(var6.Year, var6.Month, var6.Day)
			
			return t
		elseif value == dateTimePickerDateRangePresetModule.LastWeek then
			local var7 = dateTimeUtilitiesModule.toLocalTime(dateTime)
			local var8 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var7.Year, var7.Month, var7.Day, 12, 0, 0).UnixTimestamp + ((-dateTimeCalendarViewUtilitiesModule.getDayOfWeek(p1)) - 7) * 86400))
			local dateTime_1 = DateTime.fromLocalTime(var8.Year, var8.Month, var8.Day)
			local t = { startDate = dateTime_1 }
			local var9 = dateTimeUtilitiesModule.toLocalTime(dateTime_1)
			local var10 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(DateTime.fromLocalTime(var9.Year, var9.Month, var9.Day, 12, 0, 0).UnixTimestamp + 518400))
			t.endDate = DateTime.fromLocalTime(var10.Year, var10.Month, var10.Day)
			
			return t
		end
		return if value == dateTimePickerDateRangePresetModule.ThisMonth then {
			startDate = DateTime.fromLocalTime(var1.Year, var1.Month, 1),
			endDate = DateTime.fromLocalTime(var1.Year, var1.Month, dateTimeUtilitiesModule.getDaysInMonth(var1.Month, var1.Year))
		} elseif value == dateTimePickerDateRangePresetModule.ThisYear then {
			startDate = DateTime.fromLocalTime(var1.Year, 1, 1),
			endDate = DateTime.fromLocalTime(var1.Year, 12, 31)
		} else {
			startDate = DateTime.fromLocalTime(var1.Year - 1, 1, 1),
			endDate = DateTime.fromLocalTime(var1.Year - 1, 12, 31)
		}
	end
}