local foundation = script:FindFirstAncestor("Foundation")
local dateTimeCalendarConstantsModule = require(script.Parent.DateTimeCalendarConstants)
local _ = require(script.Parent.DateTimeCalendarViewUtilities)
local dateTimePickerCalendarDayKeyPrefixModule = require(foundation.Enums.DateTimePickerCalendarDayKeyPrefix)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local DAYS_PER_WEEK = dateTimeCalendarConstantsModule.DAYS_PER_WEEK
local NUM_ELEMENTS_IN_DATES_GRID = dateTimeCalendarConstantsModule.NUM_ELEMENTS_IN_DATES_GRID
local NUM_NON_DAY_ELEMENTS = dateTimeCalendarConstantsModule.NUM_NON_DAY_ELEMENTS
local NUM_WEEKDAY_HEADERS = dateTimeCalendarConstantsModule.NUM_WEEKDAY_HEADERS

local function _(p1, p2)
	-- upvalues: dateTimeUtilitiesModule (ref), DAYS_PER_WEEK (ref)
	local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(p1, p2)
	
	return if firstDayOfWeek == 0 then DAYS_PER_WEEK else firstDayOfWeek
end

local _ = function(p1, p2)
	-- upvalues: DAYS_PER_WEEK (ref)
	return (DAYS_PER_WEEK - (p1 + p2) % DAYS_PER_WEEK) % DAYS_PER_WEEK
end

return {
	buildCalendarDayConfigs = function(p1)
		-- upvalues: NUM_WEEKDAY_HEADERS (ref), dateTimeUtilitiesModule (ref), DAYS_PER_WEEK (ref), dateTimePickerCalendarDayKeyPrefixModule (ref), NUM_NON_DAY_ELEMENTS (ref), NUM_ELEMENTS_IN_DATES_GRID (ref)
		local t = {}
		local var1 = NUM_WEEKDAY_HEADERS + 1
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(p1.month, p1.year)
		local daysInMonth = dateTimeUtilitiesModule.getDaysInMonth(prevMonthInfo, prevMonthInfo_1)
		local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(p1.month, p1.year)
		local var2 = if firstDayOfWeek == 0 then DAYS_PER_WEEK else firstDayOfWeek
		
		for i = 1, var2 do
			table.insert(t, {
				day = daysInMonth - var2 + i,
				keyPrefix = dateTimePickerCalendarDayKeyPrefixModule.PrevMonth,
				LayoutOrder = var1,
				month = prevMonthInfo,
				year = prevMonthInfo_1
			})
			var1 += 1
		end
		for i_1 = 1, dateTimeUtilitiesModule.getDaysInMonth(p1.month, p1.year) do
			table.insert(t, {
				applyEmphasis = true,
				day = i_1,
				keyPrefix = dateTimePickerCalendarDayKeyPrefixModule.CurrentMonth,
				LayoutOrder = var1,
				month = p1.month,
				year = p1.year
			})
			var1 += 1
		end
		local lastDayOfWeek = dateTimeUtilitiesModule.getLastDayOfWeek(p1.month, p1.year)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(p1.month, p1.year)
		local var3 = DAYS_PER_WEEK - (lastDayOfWeek + 1)
		local var4 = NUM_NON_DAY_ELEMENTS + #t
		
		if var3 + var4 < NUM_ELEMENTS_IN_DATES_GRID then
			var3 += NUM_ELEMENTS_IN_DATES_GRID - var4 - var3
		end
		for i_2 = 1, var3 do
			table.insert(t, {
				day = i_2,
				keyPrefix = dateTimePickerCalendarDayKeyPrefixModule.NextMonth,
				LayoutOrder = var1,
				month = nextMonthInfo,
				year = nextMonthInfo_1
			})
			var1 += 1
		end
		return t
	end,
	buildTwoMonthPaneCellConfigs = function(p2, p3)
		-- upvalues: NUM_WEEKDAY_HEADERS (ref), dateTimeUtilitiesModule (ref), DAYS_PER_WEEK (ref)
		local t = {}
		local var5 = NUM_WEEKDAY_HEADERS + 1
		local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(p2, p3)
		
		for i = 1, firstDayOfWeek do
			table.insert(t, { key = `lead-{i}`, LayoutOrder = var5 })
			var5 += 1
		end
		local daysInMonth = dateTimeUtilitiesModule.getDaysInMonth(p2, p3)
		
		for i_1 = 1, daysInMonth do
			table.insert(t, {
				day = i_1,
				key = `day-{i_1}`,
				LayoutOrder = var5,
				month = p2,
				year = p3
			})
			var5 += 1
		end
		for i_2 = 1, (DAYS_PER_WEEK - (firstDayOfWeek + daysInMonth) % DAYS_PER_WEEK) % DAYS_PER_WEEK do
			table.insert(t, { key = `trail-{i_2}`, LayoutOrder = var5 })
			var5 += 1
		end
		return t
	end
}