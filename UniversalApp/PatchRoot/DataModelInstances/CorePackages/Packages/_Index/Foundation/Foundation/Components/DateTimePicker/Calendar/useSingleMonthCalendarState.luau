local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local dateTimeCalendarDayAppearanceUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local dateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeParsingUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeParsingUtilities)
local dateTimeRangeSelectionUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeRangeSelectionUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return function(p0) --[[ line: 50 | named "useSingleMonthCalendarState" ]]
	-- upvalues: reactModule (ref), dateTimeRangeSelectionUtilitiesModule (ref), dateTimeUtilitiesModule (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeCalendarDayAppearanceUtilitiesModule (ref), dateTimeParsingUtilitiesModule (ref)
	local var6 = p0.isDateRange == true
	local var7 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: p0 (ref), dateTimeRangeSelectionUtilitiesModule (copy), var6 (ref)
		return if p0.selectedDates then dateTimeRangeSelectionUtilitiesModule.normalizeDates({ acceptsDateRange = var6, dates = p0.selectedDates }) else {}
	end, { p0.selectedDates, var6 })
	local var8, var9 = reactModule.useState(var7)
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: var9 (ref), var7 (ref)
		var9(var7)
	end, { var7 })
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: p0 (ref), var7 (ref)
		if p0.selectedDates then
			return
		end
		p0.onSelectedDateChanged(var7)
	end, { p0.selectedDates, var7, p0.onSelectedDateChanged })
	local var10 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: var8 (ref), dateTimeUtilitiesModule (copy)
		local t = {}
		
		for i, v in var8 do
			table.insert(t, dateTimeUtilitiesModule.toLocalTime(v))
		end
		return t
	end, { var8 })
	local var11, var12 = reactModule.useState(dateTimeCalendarViewUtilitiesModule.toViewDate(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p0.selectedDates, p0.referenceDate)))
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: p0 (ref), var12 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		if p0.viewAnchorDate then
			var12(dateTimeCalendarViewUtilitiesModule.toViewDate(p0.viewAnchorDate))
			
			return
		end
	end, { p0.viewAnchorDate })
	local var13 = reactModule.useCallback(function() --[[ line: 108 ]]
		-- upvalues: dateTimeUtilitiesModule (copy), var11 (ref), var12 (ref)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var11.month, var11.year)
		var12({ month = nextMonthInfo, year = nextMonthInfo_1 })
	end, { var11 })
	local var14 = reactModule.useCallback(function() --[[ line: 113 ]]
		-- upvalues: dateTimeUtilitiesModule (copy), var11 (ref), var12 (ref)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var11.month, var11.year)
		var12({ month = prevMonthInfo, year = prevMonthInfo_1 })
	end, { var11 })
	local var15 = reactModule.useCallback(function(p1) --[[ line: 118 ]]
		-- upvalues: var12 (ref)
		var12(p1)
	end, {})
	local var16, var17 = reactModule.useState(function() --[[ line: 123 ]]
		return nil
	end)
	local var18 = reactModule.useMemo(function() --[[ line: 127 ]]
		-- upvalues: var6 (ref), var8 (ref), dateTimeCalendarDayAppearanceUtilitiesModule (copy), var16 (ref)
		return if var6 then dateTimeCalendarDayAppearanceUtilitiesModule.resolveHighlightDates(var8, var16) else var8
	end, { var6, var8, var16 })
	local var19 = reactModule.useCallback(function(p2) --[[ line: 134 ]]
		-- upvalues: var6 (ref), var17 (ref)
		if var6 then
			var17(p2)
			
			return
		end
	end, { var6 })
	local var20 = reactModule.useCallback(function() --[[ line: 141 ]]
		-- upvalues: var17 (ref)
		var17(nil)
	end, {})
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var6 (ref), var8 (ref), var17 (ref)
		if not var6 then return end
		if not var8[1] or var8[2] then
			var17(nil)
		end
	end, { var6, var8 })
	
	return {
		currViewDate = var11,
		handleDateActivated = reactModule.useCallback(function(p3, p4, p5) --[[ line: 156 ]]
			-- upvalues: var8 (ref), dateTimeUtilitiesModule (copy), p0 (ref), dateTimeCalendarViewUtilitiesModule (copy), var12 (ref), var17 (ref), var6 (ref), dateTimeRangeSelectionUtilitiesModule (copy), var9 (ref)
			local var26 = 0
			local var27 = 0
			local var28 = var8[1]
			
			if var28 then
				local var29 = dateTimeUtilitiesModule.toLocalTime(var28)
				var26 = var29.Hour
				var27 = var29.Minute
			end
			local dateTime = DateTime.fromLocalTime(p5, p4, p3, var26, var27)
			
			if p0.showTimeList then
				dateTime = dateTimeCalendarViewUtilitiesModule.roundUpToNearestHalfHour(dateTime)
			end
			var12({ month = p4, year = p5 })
			var17(nil)
			local var31 = if var6 then dateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(var8, dateTime) else { dateTime }
			var9(var31)
			p0.onSelectedDateChanged(var31)
		end, { var6, p0.showTimeList, p0.onSelectedDateChanged, var8 }),
		highlightDates = var18,
		isDateRange = var6,
		localSelectedDateTimes = var10,
		navigateToNextMonth = var13,
		navigateToPreviousMonth = var14,
		onHoverEnter = var19,
		onHoverLeave = var20,
		onTimeListItemChanged = reactModule.useCallback(function(p6) --[[ line: 186 ]]
			-- upvalues: dateTimeParsingUtilitiesModule (copy), var9 (ref), p0 (ref)
			local var32 = dateTimeParsingUtilitiesModule.adjustForDaylightSaving(DateTime.fromUnixTimestamp(p6))
			var9({ var32 })
			p0.onSelectedDateChanged({ var32 })
		end, { p0.onSelectedDateChanged }),
		onViewDateChanged = var15,
		selectedDateTimes = var8
	}
end