local foundation = script:FindFirstAncestor("Foundation")
local dateTimeCalendarConstantsModule = require(script.Parent.DateTimeCalendarConstants)
local _ = require(script.Parent.DateTimeCalendarViewUtilities)
local dateTimePickerCalendarDayKeyPrefixModule = require(foundation.Enums.DateTimePickerCalendarDayKeyPrefix)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local DAYS_PER_WEEK = dateTimeCalendarConstantsModule.DAYS_PER_WEEK
local NUM_ELEMENTS_IN_DATES_GRID = dateTimeCalendarConstantsModule.NUM_ELEMENTS_IN_DATES_GRID
local NUM_NON_DAY_ELEMENTS = dateTimeCalendarConstantsModule.NUM_NON_DAY_ELEMENTS
local NUM_WEEKDAY_HEADERS = dateTimeCalendarConstantsModule.NUM_WEEKDAY_HEADERS

local function _(p0, p1)
	-- upvalues: dateTimeUtilitiesModule (ref), DAYS_PER_WEEK (ref)
	local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(p0, p1)
	
	return if firstDayOfWeek == 0 then DAYS_PER_WEEK else firstDayOfWeek
end

local _ = function(p2, p3)
	-- upvalues: DAYS_PER_WEEK (ref)
	return (DAYS_PER_WEEK - (p2 + p3) % DAYS_PER_WEEK) % DAYS_PER_WEEK
end

return {
	buildCalendarDayConfigs = function(p4)
		-- upvalues: NUM_WEEKDAY_HEADERS (ref), dateTimeUtilitiesModule (ref), DAYS_PER_WEEK (ref), dateTimePickerCalendarDayKeyPrefixModule (ref), NUM_NON_DAY_ELEMENTS (ref), NUM_ELEMENTS_IN_DATES_GRID (ref)
		local t = {}
		local var6 = NUM_WEEKDAY_HEADERS + 1
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(p4.month, p4.year)
		local daysInMonth = dateTimeUtilitiesModule.getDaysInMonth(prevMonthInfo, prevMonthInfo_1)
		local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(p4.month, p4.year)
		local var11 = if firstDayOfWeek == 0 then DAYS_PER_WEEK else firstDayOfWeek
		
		for i = 1, var11 do
			table.insert(t, {
				day = daysInMonth - var11 + i,
				keyPrefix = dateTimePickerCalendarDayKeyPrefixModule.PrevMonth,
				LayoutOrder = var6,
				month = prevMonthInfo,
				year = prevMonthInfo_1
			})
			var6 += 1
		end
		for i_1 = 1, dateTimeUtilitiesModule.getDaysInMonth(p4.month, p4.year) do
			table.insert(t, {
				applyEmphasis = true,
				day = i_1,
				keyPrefix = dateTimePickerCalendarDayKeyPrefixModule.CurrentMonth,
				LayoutOrder = var6,
				month = p4.month,
				year = p4.year
			})
			var6 += 1
		end
		local lastDayOfWeek = dateTimeUtilitiesModule.getLastDayOfWeek(p4.month, p4.year)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(p4.month, p4.year)
		local var15 = DAYS_PER_WEEK - (lastDayOfWeek + 1)
		local var16 = NUM_NON_DAY_ELEMENTS + #t
		
		if var15 + var16 < NUM_ELEMENTS_IN_DATES_GRID then
			var15 += NUM_ELEMENTS_IN_DATES_GRID - var16 - var15
		end
		for i_2 = 1, var15 do
			table.insert(t, {
				day = i_2,
				keyPrefix = dateTimePickerCalendarDayKeyPrefixModule.NextMonth,
				LayoutOrder = var6,
				month = nextMonthInfo,
				year = nextMonthInfo_1
			})
			var6 += 1
		end
		return t
	end,
	buildTwoMonthPaneCellConfigs = function(p5, p6)
		-- upvalues: NUM_WEEKDAY_HEADERS (ref), dateTimeUtilitiesModule (ref), DAYS_PER_WEEK (ref)
		local t = {}
		local var18 = NUM_WEEKDAY_HEADERS + 1
		local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(p5, p6)
		
		for i = 1, firstDayOfWeek do
			table.insert(t, { key = `lead-{i}`, LayoutOrder = var18 })
			var18 += 1
		end
		local daysInMonth = dateTimeUtilitiesModule.getDaysInMonth(p5, p6)
		
		for i_1 = 1, daysInMonth do
			table.insert(t, {
				day = i_1,
				key = `day-{i_1}`,
				LayoutOrder = var18,
				month = p5,
				year = p6
			})
			var18 += 1
		end
		for i_2 = 1, (DAYS_PER_WEEK - (firstDayOfWeek + daysInMonth) % DAYS_PER_WEEK) % DAYS_PER_WEEK do
			table.insert(t, { key = `trail-{i_2}`, LayoutOrder = var18 })
			var18 += 1
		end
		return t
	end
}