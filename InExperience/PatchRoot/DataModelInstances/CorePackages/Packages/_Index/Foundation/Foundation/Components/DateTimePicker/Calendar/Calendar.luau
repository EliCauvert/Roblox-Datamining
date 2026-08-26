local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local calendarDayModule = require(script.Parent.CalendarDay)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local singleMonthCalendarModule = require(script.Parent.SingleMonthCalendar)
local flagsModule = require(foundation.Utility.Flags)
local icon = builderIconsModule.Icon
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local iconButtonModule = require(foundation.Components.IconButton)
local inputSizeModule = require(foundation.Enums.InputSize)
local textModule = require(foundation.Components.Text)
local textInputModule = require(foundation.Components.TextInput)
local timeDropdownModule = require(script.Parent.Parent.Time.TimeDropdown)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: flagsModule (ref), reactModule (ref), singleMonthCalendarModule (ref), useTokensModule (ref), useScaledValueModule (ref), dateTimeUtilitiesModule (ref), textModule (ref), calendarDayModule (ref), viewModule (ref), iconButtonModule (ref), icon (ref), inputSizeModule (ref), buttonVariantModule (ref), timeDropdownModule (ref), textInputModule (ref)
	if flagsModule.FoundationDateTimePickerBetaUpdate then
		return reactModule.createElement(singleMonthCalendarModule, {
			isDateRange = p1.isDateRange,
			LayoutOrder = p1.LayoutOrder,
			onSelectedDateChanged = p1.onSelectedDateChanged,
			referenceDate = p1.referenceDate,
			selectableDateRange = p1.selectableDateRange,
			selectedDates = p1.defaultDates,
			showTimeList = p1.showTimeDropdown,
			testId = p1.testId,
			viewAnchorDate = p1.viewAnchorDate
		})
	end
	local var1 = useTokensModule()
	local var2 = useScaledValueModule(272)
	local var3 = reactModule.useRef(false)
	local var4 = if not p1.defaultDates then { DateTime.now() } else p1.defaultDates
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		p1.onSelectedDateChanged(var4)
	end, { var4, p1.defaultDates, p1.onSelectedDateChanged })
	local var5, var6 = reactModule.useState(var4)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useState(if p1.showEndDateTimeCalendarInput then { startDateTimeInput = false, endDateTimeInput = true } else { startDateTimeInput = true, endDateTimeInput = false })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var8 (ref), var7 (ref)
		if p1.showEndDateTimeCalendarInput and var8.endDateTimeInput and var7.current then
			var7.current.focus()
		end
	end, { var8 })
	local var10, var11 = reactModule.useState(dateTimeUtilitiesModule.formatLocalTime(var4[1]))
	local var12, var13 = reactModule.useState(if var4[2] then dateTimeUtilitiesModule.formatLocalTime(var4[2]) else "")
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3.current = true
	end, {})
	local var14, var15 = reactModule.useState({
		month = var4[1]:ToLocalTime().Month,
		year = var4[1]:ToLocalTime().Year
	})
	local t = {}
	
	for i, v in var5 do
		table.insert(t, v:ToLocalTime())
	end
	local var16
	local var17 = function()
		-- upvalues: dateTimeUtilitiesModule (copy), var10 (ref), var5 (ref), var11 (ref), var4 (ref)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(var10)
		
		if not dateTimeFromText and var5[1] or dateTimeFromText and var5[2] and dateTimeUtilitiesModule.roundToStartOfDay(var5[2]) < dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) then
			var11(dateTimeUtilitiesModule.formatLocalTime(var4[1]))
		end
	end
	
	local var18 = function()
		-- upvalues: dateTimeUtilitiesModule (copy), var12 (ref), var5 (ref), var13 (ref), var4 (ref)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(var12)
		
		if not dateTimeFromText and var5[2] or dateTimeFromText and var5[1] and dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) < dateTimeUtilitiesModule.roundToStartOfDay(var5[1]) then
			var13(dateTimeUtilitiesModule.formatLocalTime(var4[2]))
		end
	end
	
	local var19 = reactModule.useCallback(function()
		-- upvalues: dateTimeUtilitiesModule (copy), var14 (ref), var15 (ref)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var14.month, var14.year)
		var15({ month = nextMonthInfo, year = nextMonthInfo_1 })
	end, { var14 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: dateTimeUtilitiesModule (copy), var14 (ref), var15 (ref)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var14.month, var14.year)
		var15({ month = prevMonthInfo, year = prevMonthInfo_1 })
	end, { var14 })
	local var21 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var5 (ref), p1 (ref), var8 (ref), var11 (ref), dateTimeUtilitiesModule (copy), var9 (ref), var13 (ref), var15 (ref), var6 (ref)
		local dateTime = DateTime.fromLocalTime(p4, p3, p2, var5[1]:ToLocalTime().Hour, var5[1]:ToLocalTime().Minute)
		
		if not p1.showStartDateTimeCalendarInput then
			var15({ month = p3, year = p4 })
			var6({ dateTime })
			p1.onSelectedDateChanged({ dateTime })
			
			return
		elseif not p1.showEndDateTimeCalendarInput then
			var11(dateTimeUtilitiesModule.formatLocalTime(dateTime))
		elseif var8.startDateTimeInput then
			var11(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var9({ startDateTimeInput = false, endDateTimeInput = true })
		elseif var8.endDateTimeInput then
			var13(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var9({ startDateTimeInput = false, endDateTimeInput = false })
		else
			var11(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var13("")
			var9({ startDateTimeInput = false, endDateTimeInput = true })
		end
		var15({ month = p3, year = p4 })
	end, {
		p1.showStartDateTimeCalendarInput,
		p1.showEndDateTimeCalendarInput,
		var5,
		var8,
		var7
	})
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: t (ref)
		local var23 = p2:ToLocalTime()
		
		for i, v in t do
			if v.Day == var23.Day and v.Month == var23.Month and v.Year == var23.Year then
				return true
			end
		end
		return false
	end, { t })
	local var24 = reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), var5 (ref), dateTimeUtilitiesModule (copy)
		return p1.showEndDateTimeCalendarInput and (var5[1] and (var5[2] and dateTimeUtilitiesModule.isDateWithinRange(p3, { startDate = var5[1], endDate = var5[2] })))
	end, { p1.showEndDateTimeCalendarInput, var5 })
	local var25 = reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), dateTimeUtilitiesModule (copy), var8 (ref), var5 (ref)
		if p1.selectableDateRange and not dateTimeUtilitiesModule.isDateWithinRange(p3, p1.selectableDateRange) then
			return false
		elseif p1.showEndDateTimeCalendarInput then
			return if var8.endDateTimeInput and dateTimeUtilitiesModule.roundToStartOfDay(p3) < dateTimeUtilitiesModule.roundToStartOfDay(var5[1]) then false else var8.startDateTimeInput and var5[2] and dateTimeUtilitiesModule.roundToStartOfDay(var5[2]) < dateTimeUtilitiesModule.roundToStartOfDay(p3)
		end
	end, {
		var5,
		p1.selectableDateRange,
		var8,
		p1.showEndDateTimeCalendarInput
	})
	local var26 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref), var11 (ref), dateTimeUtilitiesModule (copy), p1 (ref), var5 (ref), var15 (ref), var6 (ref)
		if not var3.current then return end
		var11(p3)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(p3)
		
		if dateTimeFromText then
			local var27 = if p1.showEndDateTimeCalendarInput then { dateTimeFromText, var5[2] } else { dateTimeFromText }
			local var28 = dateTimeFromText:ToLocalTime()
			var15({ month = var28.Month, year = var28.Year })
			var6(var27)
			p1.onSelectedDateChanged(var27)
		end
	end, {
		p1.onSelectedDateChanged,
		p1.showEndDateTimeCalendarInput,
		var25,
		var5,
		var3
	})
	local var27 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref), var13 (ref), dateTimeUtilitiesModule (copy), var5 (ref), var15 (ref), var6 (ref), p1 (ref)
		if not var3.current then return end
		var13(p3)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(p3)
		
		if dateTimeFromText then
			if var5[1] and dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) < dateTimeUtilitiesModule.roundToStartOfDay(var5[1]) then
				return
			end
			local list = { var5[1], dateTimeFromText }
			local var28 = dateTimeFromText:ToLocalTime()
			var15({ month = var28.Month, year = var28.Year })
			var6(list)
			p1.onSelectedDateChanged(list)
			
			return
		elseif p3 == "" then
			var6(function(p4)
				-- upvalues: p1 (copy)
				p1.onSelectedDateChanged({ p4[1] })
				
				return { p4[1] }
			end)
			
			return
		end
	end, { p1.onSelectedDateChanged, var5, var25, var3 })
	local var28 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var1 (ref), var2 (ref), dateTimeUtilitiesModule (copy), textModule (copy), var14 (ref), calendarDayModule (copy), var24 (ref), var25 (ref), var22 (ref), var21 (ref), p1 (ref)
		local t = {}
		table.insert(t, reactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = 7,
			key = "layout",
			CellPadding = UDim2.fromOffset(var1.Padding.None, var1.Padding.None),
			CellSize = UDim2.fromOffset(var2 / 7, var2 / 7),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}))
		local var29 = 1
		
		for i, v in dateTimeUtilitiesModule.weekdays do
			table.insert(t, reactModule.createElement(textModule, {
				tag = "text-body-small text-align-x-center text-align-y-center",
				key = v,
				LayoutOrder = var29,
				Text = v
			}))
			var29 += 1
		end
		local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(var14.month, var14.year)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var14.month, var14.year)
		local daysInMonth = dateTimeUtilitiesModule.getDaysInMonth(dateTimeUtilitiesModule.getPrevMonthInfo(var14.month, var14.year))
		local var30 = if firstDayOfWeek == 0 then 7 else firstDayOfWeek
		
		for i_1 = 1, var30 do
			local var31 = daysInMonth - var30 + i_1
			local dateTime = DateTime.fromLocalTime(prevMonthInfo_1, prevMonthInfo, var31)
			table.insert(t, reactModule.createElement(calendarDayModule, {
				highlight = var24(dateTime),
				isSelectable = var25(dateTime),
				isSelected = var22(dateTime),
				key = "prev-month-day-" .. var72,
				LayoutOrder = var29,
				onActivated = function()
					-- upvalues: var21 (copy), var31 (ref), prevMonthInfo (ref), prevMonthInfo_1 (ref)
					var21(var31, prevMonthInfo, prevMonthInfo_1)
				end,
				testId = `{p1.testId}--prev-month-calendar-day-{var72}`,
				Text = tostring(var31)
			}))
			var29 += 1
		end
		for i_2 = 1, dateTimeUtilitiesModule.getDaysInMonth(var14.month, var14.year) do
			local var32 = var25(DateTime.fromLocalTime(var14.year, var14.month, i_2))
			local var33 = var22(DateTime.fromLocalTime(var14.year, var14.month, i_2))
			table.insert(t, reactModule.createElement(calendarDayModule, {
				emphasizeText = var32 and not var33,
				highlight = var24(DateTime.fromLocalTime(var14.year, var14.month, i_2)),
				isSelectable = var32,
				isSelected = var33,
				key = "current-month-day-" .. i_2,
				LayoutOrder = var29,
				onActivated = function()
					-- upvalues: var21 (copy), i_2 (ref), var14 (copy)
					var21(i_2, var14.month, var14.year)
				end,
				testId = `{p1.testId}--current-month-calendar-day-{i_2}`,
				Text = tostring(i_2)
			}))
			var29 += 1
		end
		local lastDayOfWeek = dateTimeUtilitiesModule.getLastDayOfWeek(var14.month, var14.year)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var14.month, var14.year)
		local var34 = 7 - (lastDayOfWeek + 1)
		
		if var34 == 0 then
			var34 = 7
		end
		if var34 + #t < 50 then
			var34 += 50 - #t - var34
		end
		for i_3 = 1, var34 do
			local dateTime_1 = DateTime.fromLocalTime(nextMonthInfo_1, nextMonthInfo, i_3)
			table.insert(t, reactModule.createElement(calendarDayModule, {
				highlight = var24(dateTime_1),
				isSelectable = var25(dateTime_1),
				isSelected = var22(dateTime_1),
				key = "next-month-day-" .. i_3,
				LayoutOrder = var29,
				onActivated = function()
					-- upvalues: var21 (copy), i_3 (ref), nextMonthInfo (ref), nextMonthInfo_1 (ref)
					var21(i_3, nextMonthInfo, nextMonthInfo_1)
				end,
				testId = `{p1.testId}--next-month-calendar-day-{i_3}`,
				Text = tostring(i_3)
			}))
			var29 += 1
		end
		return t
	end, {
		var22, var24, var25, var14, var5, var21, p1.selectableDateRange,
		p1.showEndDateTimeCalendarInput
	})
	local var35 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), p1 (ref)
		local dateTime = DateTime.fromUnixTimestamp(p3)
		
		if os.date("*t", p3).isdst then
			dateTime = DateTime.fromUnixTimestamp(dateTime.UnixTimestamp - 3600)
		end
		var6({ dateTime })
		p1.onSelectedDateChanged({ dateTime })
	end, { var5, p1.onSelectedDateChanged })
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "col auto-y",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromOffset(var2, 0),
		testId = p1.testId
	}
	local t_2 = {
		CalendarHeader = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-y-small"
		}, {
			PreviousMonthButton = reactModule.createElement(iconButtonModule, {
				LayoutOrder = 1,
				isCircular = true,
				icon = icon.ChevronSmallLeft,
				onActivated = var20,
				size = inputSizeModule.Small,
				variant = buttonVariantModule.Utility,
				testId = `{p1.testId}--previous-month-button`
			}),
			MonthText = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "grow auto-xy text-align-x-right",
				Text = dateTimeUtilitiesModule.monthMap[var14.month],
				testId = `{p1.testId}--month-text`
			}),
			YearText = reactModule.createElement(textModule, {
				LayoutOrder = 3,
				tag = "grow auto-xy text-align-x-left",
				Text = tostring(var14.year),
				testId = `{p1.testId}--year-text`
			}),
			NextMonthButton = reactModule.createElement(iconButtonModule, {
				LayoutOrder = 4,
				isCircular = true,
				icon = icon.ChevronSmallRight,
				onActivated = var19,
				size = inputSizeModule.Small,
				variant = buttonVariantModule.Utility,
				testId = `{p1.testId}--next-month-button`
			})
		}),
		TimeDropdown = if p1.showTimeDropdown then reactModule.createElement(timeDropdownModule, {
			LayoutOrder = 2,
			dateTime = var5[1],
			onItemChanged = var35,
			width = UDim.new(1, 0),
			testId = `{p1.testId}--time-dropdown`
		}) else nil
	}
	
	if p1.showStartDateTimeCalendarInput then
		local var36
		var16 = reactModule.createElement
		local var37 = viewModule
		local t_3 = {
			LayoutOrder = 3,
			tag = "row flex-x-fill align-y-center gap-small size-full-0 auto-y",
			testId = `{p1.testId}--input`
		}
		local t_4 = {
			StartDateTime = reactModule.createElement(textInputModule, {
				label = "",
				LayoutOrder = 1,
				placeholder = "MM/DD/YYYY",
				hasError = var10 ~= "" and dateTimeUtilitiesModule.getDateTimeFromText(var10) == nil,
				onChanged = var26,
				onFocusLost = var17,
				size = inputSizeModule.Medium,
				text = var10,
				onFocusGained = function()
					-- upvalues: var9 (ref)
					var9({ startDateTimeInput = true, endDateTimeInput = false })
				end,
				testId = `{p1.testId}--start-datetime-input`
			}),
			InputSeparator = if p1.showEndDateTimeCalendarInput then reactModule.createElement(textModule, { LayoutOrder = 2, tag = "auto-xy", Text = "-" }) else nil
		}
		
		if p1.showEndDateTimeCalendarInput then
			var36 = reactModule.createElement
			var36 = var36(textInputModule, {
				label = "",
				LayoutOrder = 3,
				placeholder = "MM/DD/YYYY",
				hasError = var12 ~= "" and dateTimeUtilitiesModule.getDateTimeFromText(var12) == nil,
				isDisabled = not var5[1],
				onChanged = var27,
				onFocusGained = function()
					-- upvalues: var9 (ref)
					var9({ startDateTimeInput = false, endDateTimeInput = true })
				end,
				onFocusLost = var18,
				size = inputSizeModule.Medium,
				text = var12,
				textBoxRef = var7,
				testId = `{p1.testId}--end-datetime-input`
			})
		else
			var36 = nil
		end
		t_4.EndDateTime = var36
		var16 = var16(var37, t_3, t_4)
	else
		var16 = nil
	end
	t_2.CalendarInputContainer = var16
	t_2.WeekAndDates = reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-full-0 auto-y",
		testId = `{p1.testId}--weekAndDates`
	}, var28)
	
	return createElement(viewModule, t_1, t_2)
end