local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local dateTimeCalendarDayAppearanceUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local dateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeParsingUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeParsingUtilities)
local dateTimeRangeSelectionUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeRangeSelectionUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return function(p1)
	-- upvalues: reactModule (ref), dateTimeRangeSelectionUtilitiesModule (ref), dateTimeUtilitiesModule (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeCalendarDayAppearanceUtilitiesModule (ref), dateTimeParsingUtilitiesModule (ref)
	local var1 = p1.isDateRange == true
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), dateTimeRangeSelectionUtilitiesModule (copy), var1 (ref)
		return if p1.selectedDates then dateTimeRangeSelectionUtilitiesModule.normalizeDates({ acceptsDateRange = var1, dates = p1.selectedDates }) else {}
	end, { p1.selectedDates, var1 })
	local var3, var4 = reactModule.useState(var2)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var2 (ref)
		var4(var2)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.selectedDates then
			return
		end
		p1.onSelectedDateChanged(var2)
	end, { p1.selectedDates, var2, p1.onSelectedDateChanged })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), dateTimeUtilitiesModule (copy)
		local t = {}
		
		for i, v in var3 do
			table.insert(t, dateTimeUtilitiesModule.toLocalTime(v))
		end
		return t
	end, { var3 })
	local var6, var7 = reactModule.useState(dateTimeCalendarViewUtilitiesModule.toViewDate(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p1.selectedDates, p1.referenceDate)))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var7 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		if p1.viewAnchorDate then
			var7(dateTimeCalendarViewUtilitiesModule.toViewDate(p1.viewAnchorDate))
			
			return
		end
	end, { p1.viewAnchorDate })
	local var8 = reactModule.useCallback(function()
		-- upvalues: dateTimeUtilitiesModule (copy), var6 (ref), var7 (ref)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var6.month, var6.year)
		var7({ month = nextMonthInfo, year = nextMonthInfo_1 })
	end, { var6 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: dateTimeUtilitiesModule (copy), var6 (ref), var7 (ref)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var6.month, var6.year)
		var7({ month = prevMonthInfo, year = prevMonthInfo_1 })
	end, { var6 })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2)
	end, {})
	local var11, var12 = reactModule.useState(function()
		return nil
	end)
	local var13 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var3 (ref), dateTimeCalendarDayAppearanceUtilitiesModule (copy), var11 (ref)
		return if var1 then dateTimeCalendarDayAppearanceUtilitiesModule.resolveHighlightDates(var3, var11) else var3
	end, { var1, var3, var11 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var12 (ref)
		if var1 then
			var12(p2)
			
			return
		end
	end, { var1 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), var12 (ref)
		if not var1 then return end
		if not var3[1] or var3[2] then
			var12(nil)
		end
	end, { var1, var3 })
	
	return {
		currViewDate = var6,
		handleDateActivated = reactModule.useCallback(function(p2, p3, p4)
			-- upvalues: var3 (ref), dateTimeUtilitiesModule (copy), p1 (ref), dateTimeCalendarViewUtilitiesModule (copy), var7 (ref), var12 (ref), var1 (ref), dateTimeRangeSelectionUtilitiesModule (copy), var4 (ref)
			local var16 = 0
			local var17 = 0
			local var18 = var3[1]
			
			if var18 then
				local var19 = dateTimeUtilitiesModule.toLocalTime(var18)
				var16 = var19.Hour
				var17 = var19.Minute
			end
			local dateTime = DateTime.fromLocalTime(p4, p3, p2, var16, var17)
			
			if p1.showTimeList then
				dateTime = dateTimeCalendarViewUtilitiesModule.roundUpToNearestHalfHour(dateTime)
			end
			var7({ month = p3, year = p4 })
			var12(nil)
			local var20 = if var1 then dateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(var3, dateTime) else { dateTime }
			var4(var20)
			p1.onSelectedDateChanged(var20)
		end, { var1, p1.showTimeList, p1.onSelectedDateChanged, var3 }),
		highlightDates = var13,
		isDateRange = var1,
		localSelectedDateTimes = var5,
		navigateToNextMonth = var8,
		navigateToPreviousMonth = var9,
		onHoverEnter = var14,
		onHoverLeave = var15,
		onTimeListItemChanged = reactModule.useCallback(function(p2)
			-- upvalues: dateTimeParsingUtilitiesModule (copy), var4 (ref), p1 (ref)
			local var16 = dateTimeParsingUtilitiesModule.adjustForDaylightSaving(DateTime.fromUnixTimestamp(p2))
			var4({ var16 })
			p1.onSelectedDateChanged({ var16 })
		end, { p1.onSelectedDateChanged }),
		onViewDateChanged = var10,
		selectedDateTimes = var3
	}
end