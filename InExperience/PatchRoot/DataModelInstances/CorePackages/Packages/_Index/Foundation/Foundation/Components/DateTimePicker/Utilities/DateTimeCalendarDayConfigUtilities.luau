local DateTimeCalendarConstantsModule = require(script.Parent.DateTimeCalendarConstants)
local _ = require(script.Parent.DateTimeCalendarViewUtilities)
local DateTimePickerCalendarDayKeyPrefixModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerCalendarDayKeyPrefix)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local DAYSPERWEEK = DateTimeCalendarConstantsModule.DAYS_PER_WEEK
local NUMELEMENTSINDATESGRID = DateTimeCalendarConstantsModule.NUM_ELEMENTS_IN_DATES_GRID
local NUMNONDAYELEMENTS = DateTimeCalendarConstantsModule.NUM_NON_DAY_ELEMENTS
local NUMWEEKDAYHEADERS = DateTimeCalendarConstantsModule.NUM_WEEKDAY_HEADERS

local function _(p1, p2)
	-- upvalues: DateTimeUtilitiesModule (copy), DAYSPERWEEK (copy)
	local FirstDayOfWeek = DateTimeUtilitiesModule.getFirstDayOfWeek(p1, p2)
	
	return if FirstDayOfWeek == 0 then DAYSPERWEEK else FirstDayOfWeek
end

local _ = function(p1, p2): number
	-- upvalues: DAYSPERWEEK (copy)
	return (DAYSPERWEEK - (p1 + p2) % DAYSPERWEEK) % DAYSPERWEEK
end

return {
	buildCalendarDayConfigs = function(p1)
		-- upvalues: NUMWEEKDAYHEADERS (copy), DateTimeUtilitiesModule (copy), DAYSPERWEEK (copy), DateTimePickerCalendarDayKeyPrefixModule (copy), NUMNONDAYELEMENTS (copy), NUMELEMENTSINDATESGRID (copy)
		local List = {}
		local NewNUMWEEKDAYHEADERS = NUMWEEKDAYHEADERS + 1
		local PrevMonthInfo, PrevMonthInfo2 = DateTimeUtilitiesModule.getPrevMonthInfo(p1.month, p1.year)
		local DaysInMonth = DateTimeUtilitiesModule.getDaysInMonth(PrevMonthInfo, PrevMonthInfo2)
		local FirstDayOfWeek = DateTimeUtilitiesModule.getFirstDayOfWeek(p1.month, p1.year)
		local DAYSPERWEEK1 = if FirstDayOfWeek == 0 then DAYSPERWEEK else FirstDayOfWeek
		for i = 1, DAYSPERWEEK1 do
			table.insert(List, {
				day = DaysInMonth - DAYSPERWEEK1 + i,
				keyPrefix = DateTimePickerCalendarDayKeyPrefixModule.PrevMonth,
				LayoutOrder = NewNUMWEEKDAYHEADERS,
				month = PrevMonthInfo,
				year = PrevMonthInfo2
			})
			NewNUMWEEKDAYHEADERS += 1
		end
		for i1 = 1, DateTimeUtilitiesModule.getDaysInMonth(p1.month, p1.year) do
			table.insert(List, {
				applyEmphasis = true,
				day = i1,
				keyPrefix = DateTimePickerCalendarDayKeyPrefixModule.CurrentMonth,
				LayoutOrder = NewNUMWEEKDAYHEADERS,
				month = p1.month,
				year = p1.year
			})
			NewNUMWEEKDAYHEADERS += 1
		end
		local LastDayOfWeek: number = DateTimeUtilitiesModule.getLastDayOfWeek(p1.month, p1.year)
		local NextMonthInfo, NextMonthInfo2 = DateTimeUtilitiesModule.getNextMonthInfo(p1.month, p1.year)
		local DAYSPERWEEKDelta = DAYSPERWEEK - (LastDayOfWeek + 1)
		local NewNUMNONDAYELEMENTS = NUMNONDAYELEMENTS + #List
		
		if DAYSPERWEEKDelta + NewNUMNONDAYELEMENTS < NUMELEMENTSINDATESGRID then
			DAYSPERWEEKDelta += NUMELEMENTSINDATESGRID - NewNUMNONDAYELEMENTS - DAYSPERWEEKDelta
		end
		for i2 = 1, DAYSPERWEEKDelta do
			table.insert(List, {
				day = i2,
				keyPrefix = DateTimePickerCalendarDayKeyPrefixModule.NextMonth,
				LayoutOrder = NewNUMWEEKDAYHEADERS,
				month = NextMonthInfo,
				year = NextMonthInfo2
			})
			NewNUMWEEKDAYHEADERS += 1
		end
		return List
	end,
	buildTwoMonthPaneCellConfigs = function(Month, Year)
		-- upvalues: NUMWEEKDAYHEADERS (copy), DateTimeUtilitiesModule (copy), DAYSPERWEEK (copy)
		local List = {}
		local NewNUMWEEKDAYHEADERS = NUMWEEKDAYHEADERS + 1
		local FirstDayOfWeek = DateTimeUtilitiesModule.getFirstDayOfWeek(Month, Year)
		
		for i = 1, FirstDayOfWeek do
			table.insert(List, { key = `lead-{i}`, LayoutOrder = NewNUMWEEKDAYHEADERS })
			NewNUMWEEKDAYHEADERS += 1
		end
		local DaysInMonth = DateTimeUtilitiesModule.getDaysInMonth(Month, Year)
		
		for i1 = 1, DaysInMonth do
			table.insert(List, {
				day = i1,
				key = `day-{i1}`,
				LayoutOrder = NewNUMWEEKDAYHEADERS,
				month = Month,
				year = Year
			})
			NewNUMWEEKDAYHEADERS += 1
		end
		for i2 = 1, (DAYSPERWEEK - (FirstDayOfWeek + DaysInMonth) % DAYSPERWEEK) % DAYSPERWEEK do
			table.insert(List, { key = `trail-{i2}`, LayoutOrder = NewNUMWEEKDAYHEADERS })
			NewNUMWEEKDAYHEADERS += 1
		end
		return List
	end
}