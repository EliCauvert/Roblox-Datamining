local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local DateTimeCalendarDayAppearanceUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local DateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeParsingUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeParsingUtilities)
local DateTimeRangeSelectionUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeRangeSelectionUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return function(p1) --[[ Line: 50 | Named "useSingleMonthCalendarState" ]]
	-- upvalues: ReactModule (copy), DateTimeRangeSelectionUtilitiesModule (copy), DateTimeUtilitiesModule (copy), DateTimeCalendarViewUtilitiesModule (copy), DateTimeCalendarDayAppearanceUtilitiesModule (copy), DateTimeParsingUtilitiesModule (copy)
	local IsIsDateRange = p1.isDateRange == true
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 57 ]]
		-- upvalues: p1 (copy), DateTimeRangeSelectionUtilitiesModule (upval), IsIsDateRange (copy)
		return if p1.selectedDates then DateTimeRangeSelectionUtilitiesModule.normalizeDates({
			acceptsDateRange = IsIsDateRange,
			dates = p1.selectedDates
		}) else {}
	end, { p1.selectedDates, IsIsDateRange })
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseMemoResult)
	ReactModule.useEffect(function() --[[ Line: 75 ]]
		-- upvalues: UseStateResult2 (copy), UseMemoResult (copy)
		UseStateResult2(UseMemoResult)
	end, { UseMemoResult })
	ReactModule.useEffect(function() --[[ Line: 79 ]]
		-- upvalues: p1 (copy), UseMemoResult (copy)
		if not p1.selectedDates then
			p1.onSelectedDateChanged(UseMemoResult)
			
			return
		end
	end, {
		p1.selectedDates,
		UseMemoResult,
		p1.onSelectedDateChanged
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 86 ]]
		-- upvalues: UseStateResult (copy), DateTimeUtilitiesModule (upval)
		local List = {}
		
		for _, value in UseStateResult do
			table.insert(List, DateTimeUtilitiesModule.toLocalTime(value))
		end
		return List
	end, { UseStateResult })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(DateTimeCalendarViewUtilitiesModule.toViewDate(DateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p1.selectedDates, p1.referenceDate)))
	ReactModule.useEffect(function() --[[ Line: 101 ]]
		-- upvalues: p1 (copy), UseStateResult2_1 (copy), DateTimeCalendarViewUtilitiesModule (upval)
		if p1.viewAnchorDate then
			UseStateResult2_1(DateTimeCalendarViewUtilitiesModule.toViewDate(p1.viewAnchorDate))
			
			return
		end
	end, { p1.viewAnchorDate })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 108 ]]
		-- upvalues: DateTimeUtilitiesModule (upval), UseStateResult1 (copy), UseStateResult2_1 (copy)
		local NextMonthInfo, NextMonthInfo2 = DateTimeUtilitiesModule.getNextMonthInfo(UseStateResult1.month, UseStateResult1.year)
		UseStateResult2_1({ month = NextMonthInfo, year = NextMonthInfo2 })
	end, { UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 113 ]]
		-- upvalues: DateTimeUtilitiesModule (upval), UseStateResult1 (copy), UseStateResult2_1 (copy)
		local PrevMonthInfo, PrevMonthInfo2 = DateTimeUtilitiesModule.getPrevMonthInfo(UseStateResult1.month, UseStateResult1.year)
		UseStateResult2_1({ month = PrevMonthInfo, year = PrevMonthInfo2 })
	end, { UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 118 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2)
	end, {})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(function() --[[ Line: 123 ]]
		return nil
	end)
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 127 ]]
		-- upvalues: IsIsDateRange (copy), UseStateResult (copy), DateTimeCalendarDayAppearanceUtilitiesModule (upval), UseStateResult3 (copy)
		return if IsIsDateRange then DateTimeCalendarDayAppearanceUtilitiesModule.resolveHighlightDates(UseStateResult, UseStateResult3) else UseStateResult
	end, { IsIsDateRange, UseStateResult, UseStateResult3 })
	local UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 134 ]]
		-- upvalues: IsIsDateRange (copy), UseStateResult2_2 (copy)
		if IsIsDateRange then
			UseStateResult2_2(p2)
			
			return
		end
	end, { IsIsDateRange })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 141 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(nil)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 145 ]]
		-- upvalues: IsIsDateRange (copy), UseStateResult (copy), UseStateResult2_2 (copy)
		if not IsIsDateRange then return end
		if not UseStateResult[1] or UseStateResult[2] then
			UseStateResult2_2(nil)
		end
	end, { IsIsDateRange, UseStateResult })
	
	return {
		currViewDate = UseStateResult1,
		handleDateActivated = ReactModule.useCallback(function(p2, Month, Year) --[[ Line: 156 ]]
			-- upvalues: UseStateResult (copy), DateTimeUtilitiesModule (upval), p1 (copy), DateTimeCalendarViewUtilitiesModule (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy), IsIsDateRange (copy), DateTimeRangeSelectionUtilitiesModule (upval), UseStateResult2 (copy)
			local Hour = 0
			local Minute = 0
			local UseStateResultEntry = UseStateResult[1]
			
			if UseStateResultEntry then
				local LocalTime = DateTimeUtilitiesModule.toLocalTime(UseStateResultEntry)
				Hour = LocalTime.Hour
				Minute = LocalTime.Minute
			end
			local _DateTime = DateTime.fromLocalTime(Year, Month, p2, Hour, Minute)
			
			if p1.showTimeList then
				_DateTime = DateTimeCalendarViewUtilitiesModule.roundUpToNearestHalfHour(_DateTime)
			end
			UseStateResult2_1({ month = Month, year = Year })
			UseStateResult2_2(nil)
			local SelectRangeEndpointResult = if IsIsDateRange then DateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(UseStateResult, _DateTime) else { _DateTime }
			UseStateResult2(SelectRangeEndpointResult)
			p1.onSelectedDateChanged(SelectRangeEndpointResult)
		end, {
			IsIsDateRange,
			p1.showTimeList,
			p1.onSelectedDateChanged,
			UseStateResult
		}),
		highlightDates = UseMemoResult2,
		isDateRange = IsIsDateRange,
		localSelectedDateTimes = UseMemoResult1,
		navigateToNextMonth = UseResult,
		navigateToPreviousMonth = UseResult1,
		onHoverEnter = UseResult3,
		onHoverLeave = UseResult4,
		onTimeListItemChanged = ReactModule.useCallback(function(p2) --[[ Line: 186 ]]
			-- upvalues: DateTimeParsingUtilitiesModule (upval), UseStateResult2 (copy), p1 (copy)
			local AdjustForDaylightSavingResult = DateTimeParsingUtilitiesModule.adjustForDaylightSaving(DateTime.fromUnixTimestamp(p2))
			UseStateResult2({ AdjustForDaylightSavingResult })
			p1.onSelectedDateChanged({ AdjustForDaylightSavingResult })
		end, { p1.onSelectedDateChanged }),
		onViewDateChanged = UseResult2,
		selectedDateTimes = UseStateResult
	}
end