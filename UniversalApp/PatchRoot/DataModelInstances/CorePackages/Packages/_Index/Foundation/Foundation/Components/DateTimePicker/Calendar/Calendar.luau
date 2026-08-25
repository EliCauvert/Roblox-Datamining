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

return function(p0)
	-- upvalues: flagsModule (ref), reactModule (ref), singleMonthCalendarModule (ref), useTokensModule (ref), useScaledValueModule (ref), dateTimeUtilitiesModule (ref), textModule (ref), calendarDayModule (ref), viewModule (ref), iconButtonModule (ref), icon (ref), inputSizeModule (ref), buttonVariantModule (ref), timeDropdownModule (ref), textInputModule (ref)
	if flagsModule.FoundationDateTimePickerBetaUpdate then
		return reactModule.createElement(singleMonthCalendarModule, {
			isDateRange = p0.isDateRange,
			LayoutOrder = p0.LayoutOrder,
			onSelectedDateChanged = p0.onSelectedDateChanged,
			referenceDate = p0.referenceDate,
			selectableDateRange = p0.selectableDateRange,
			selectedDates = p0.defaultDates,
			showTimeList = p0.showTimeDropdown,
			testId = p0.testId,
			viewAnchorDate = p0.viewAnchorDate
		})
	end
	local var16 = useTokensModule()
	local var17 = useScaledValueModule(272)
	local var18 = reactModule.useRef(false)
	local var19 = if not p0.defaultDates then { DateTime.now() } else p0.defaultDates
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var19 (ref)
		p0.onSelectedDateChanged(var19)
	end, { var19, p0.defaultDates, p0.onSelectedDateChanged })
	local var20, var21 = reactModule.useState(var19)
	local var22 = reactModule.useRef(nil)
	local var23, var24 = reactModule.useState(if p0.showEndDateTimeCalendarInput then { startDateTimeInput = false, endDateTimeInput = true } else { startDateTimeInput = true, endDateTimeInput = false })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var23 (ref), var22 (ref)
		if p0.showEndDateTimeCalendarInput and var23.endDateTimeInput and var22.current then
			var22.current.focus()
		end
	end, { var23 })
	local var25, var26 = reactModule.useState(dateTimeUtilitiesModule.formatLocalTime(var19[1]))
	local var27, var28 = reactModule.useState(if var19[2] then dateTimeUtilitiesModule.formatLocalTime(var19[2]) else "")
	reactModule.useEffect(function()
		-- upvalues: var18 (ref)
		var18.current = true
	end, {})
	local var29, var30 = reactModule.useState({
		month = var19[1]:ToLocalTime().Month,
		year = var19[1]:ToLocalTime().Year
	})
	local t = {}
	
	for i, v in var20 do
		table.insert(t, v:ToLocalTime())
	end
	local var46
	local var32 = function()
		-- upvalues: dateTimeUtilitiesModule (copy), var25 (ref), var20 (ref), var26 (ref), var19 (ref)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(var25)
		
		if not dateTimeFromText and var20[1] or dateTimeFromText and var20[2] and dateTimeUtilitiesModule.roundToStartOfDay(var20[2]) < dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) then
			var26(dateTimeUtilitiesModule.formatLocalTime(var19[1]))
		end
	end
	
	local var33 = function()
		-- upvalues: dateTimeUtilitiesModule (copy), var27 (ref), var20 (ref), var28 (ref), var19 (ref)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(var27)
		
		if not dateTimeFromText and var20[2] or dateTimeFromText and var20[1] and dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) < dateTimeUtilitiesModule.roundToStartOfDay(var20[1]) then
			var28(dateTimeUtilitiesModule.formatLocalTime(var19[2]))
		end
	end
	
	local var34 = reactModule.useCallback(function()
		-- upvalues: dateTimeUtilitiesModule (copy), var29 (ref), var30 (ref)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var29.month, var29.year)
		var30({ month = nextMonthInfo, year = nextMonthInfo_1 })
	end, { var29 })
	local var35 = reactModule.useCallback(function()
		-- upvalues: dateTimeUtilitiesModule (copy), var29 (ref), var30 (ref)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var29.month, var29.year)
		var30({ month = prevMonthInfo, year = prevMonthInfo_1 })
	end, { var29 })
	local var36 = reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: var20 (ref), p0 (ref), var23 (ref), var26 (ref), dateTimeUtilitiesModule (copy), var24 (ref), var28 (ref), var30 (ref), var21 (ref)
		local dateTime = DateTime.fromLocalTime(p3, p2, p1, var20[1]:ToLocalTime().Hour, var20[1]:ToLocalTime().Minute)
		
		if not p0.showStartDateTimeCalendarInput then
			var30({ month = p2, year = p3 })
			var21({ dateTime })
			p0.onSelectedDateChanged({ dateTime })
			
			return
		elseif not p0.showEndDateTimeCalendarInput then
			var26(dateTimeUtilitiesModule.formatLocalTime(dateTime))
		elseif var23.startDateTimeInput then
			var26(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var24({ startDateTimeInput = false, endDateTimeInput = true })
		elseif var23.endDateTimeInput then
			var28(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var24({ startDateTimeInput = false, endDateTimeInput = false })
		else
			var26(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var28("")
			var24({ startDateTimeInput = false, endDateTimeInput = true })
		end
		var30({ month = p2, year = p3 })
	end, {
		p0.showStartDateTimeCalendarInput,
		p0.showEndDateTimeCalendarInput,
		var20,
		var23,
		var22
	})
	local var37 = reactModule.useCallback(function(p4)
		-- upvalues: t (ref)
		local var58 = p4:ToLocalTime()
		
		for i, v in t do
			if v.Day == var58.Day and v.Month == var58.Month and v.Year == var58.Year then
				return true
			end
		end
		return false
	end, { t })
	local var38 = reactModule.useCallback(function(p5)
		-- upvalues: p0 (ref), var20 (ref), dateTimeUtilitiesModule (copy)
		return p0.showEndDateTimeCalendarInput and (var20[1] and (var20[2] and dateTimeUtilitiesModule.isDateWithinRange(p5, { startDate = var20[1], endDate = var20[2] })))
	end, { p0.showEndDateTimeCalendarInput, var20 })
	local var39 = reactModule.useCallback(function(p6)
		-- upvalues: p0 (ref), dateTimeUtilitiesModule (copy), var23 (ref), var20 (ref)
		if p0.selectableDateRange and not dateTimeUtilitiesModule.isDateWithinRange(p6, p0.selectableDateRange) then
			return false
		elseif p0.showEndDateTimeCalendarInput then
			return if var23.endDateTimeInput and dateTimeUtilitiesModule.roundToStartOfDay(p6) < dateTimeUtilitiesModule.roundToStartOfDay(var20[1]) then false else var23.startDateTimeInput and var20[2] and dateTimeUtilitiesModule.roundToStartOfDay(var20[2]) < dateTimeUtilitiesModule.roundToStartOfDay(p6)
		end
	end, {
		var20,
		p0.selectableDateRange,
		var23,
		p0.showEndDateTimeCalendarInput
	})
	local var40 = reactModule.useCallback(function(p7)
		-- upvalues: var18 (ref), var26 (ref), dateTimeUtilitiesModule (copy), p0 (ref), var20 (ref), var30 (ref), var21 (ref)
		if not var18.current then return end
		var26(p7)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(p7)
		
		if dateTimeFromText then
			local var60 = if p0.showEndDateTimeCalendarInput then { dateTimeFromText, var20[2] } else { dateTimeFromText }
			local var61 = dateTimeFromText:ToLocalTime()
			var30({ month = var61.Month, year = var61.Year })
			var21(var60)
			p0.onSelectedDateChanged(var60)
		end
	end, {
		p0.onSelectedDateChanged,
		p0.showEndDateTimeCalendarInput,
		var39,
		var20,
		var18
	})
	local var41 = reactModule.useCallback(function(p8)
		-- upvalues: var18 (ref), var28 (ref), dateTimeUtilitiesModule (copy), var20 (ref), var30 (ref), var21 (ref), p0 (ref)
		if not var18.current then return end
		var28(p8)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(p8)
		
		if dateTimeFromText then
			if var20[1] and dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) < dateTimeUtilitiesModule.roundToStartOfDay(var20[1]) then
				return
			end
			local list = { var20[1], dateTimeFromText }
			local var64 = dateTimeFromText:ToLocalTime()
			var30({ month = var64.Month, year = var64.Year })
			var21(list)
			p0.onSelectedDateChanged(list)
			
			return
		elseif p8 == "" then
			var21(function(p9)
				-- upvalues: p0 (copy)
				p0.onSelectedDateChanged({ p9[1] })
				
				return { p9[1] }
			end)
			
			return
		end
	end, { p0.onSelectedDateChanged, var20, var39, var18 })
	local var42 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var16 (ref), var17 (ref), dateTimeUtilitiesModule (copy), textModule (copy), var29 (ref), calendarDayModule (copy), var38 (ref), var39 (ref), var37 (ref), var36 (ref), p0 (ref)
		local t = {}
		table.insert(t, reactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = 7,
			key = "layout",
			CellPadding = UDim2.fromOffset(var16.Padding.None, var16.Padding.None),
			CellSize = UDim2.fromOffset(var17 / 7, var17 / 7),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}))
		local var66 = 1
		
		for i, v in dateTimeUtilitiesModule.weekdays do
			table.insert(t, reactModule.createElement(textModule, {
				tag = "text-body-small text-align-x-center text-align-y-center",
				key = v,
				LayoutOrder = var66,
				Text = v
			}))
			var66 += 1
		end
		local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(var29.month, var29.year)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var29.month, var29.year)
		local daysInMonth = dateTimeUtilitiesModule.getDaysInMonth(dateTimeUtilitiesModule.getPrevMonthInfo(var29.month, var29.year))
		local var71 = if firstDayOfWeek == 0 then 7 else firstDayOfWeek
		
		for i_1 = 1, var71 do
			local var72 = daysInMonth - var71 + i_1
			local dateTime = DateTime.fromLocalTime(prevMonthInfo_1, prevMonthInfo, var72)
			table.insert(t, reactModule.createElement(calendarDayModule, {
				highlight = var38(dateTime),
				isSelectable = var39(dateTime),
				isSelected = var37(dateTime),
				key = "prev-month-day-" .. var72,
				LayoutOrder = var66,
				onActivated = function()
					-- upvalues: var36 (copy), var72 (ref), prevMonthInfo (ref), prevMonthInfo_1 (ref)
					var36(var72, prevMonthInfo, prevMonthInfo_1)
				end,
				testId = `{p0.testId}--prev-month-calendar-day-{var72}`,
				Text = tostring(var72)
			}))
			var66 += 1
		end
		for i_2 = 1, dateTimeUtilitiesModule.getDaysInMonth(var29.month, var29.year) do
			local var74 = var39(DateTime.fromLocalTime(var29.year, var29.month, i_2))
			local var75 = var37(DateTime.fromLocalTime(var29.year, var29.month, i_2))
			table.insert(t, reactModule.createElement(calendarDayModule, {
				emphasizeText = var74 and not var75,
				highlight = var38(DateTime.fromLocalTime(var29.year, var29.month, i_2)),
				isSelectable = var74,
				isSelected = var75,
				key = "current-month-day-" .. i_2,
				LayoutOrder = var66,
				onActivated = function()
					-- upvalues: var36 (copy), i_2 (ref), var29 (copy)
					var36(i_2, var29.month, var29.year)
				end,
				testId = `{p0.testId}--current-month-calendar-day-{i_2}`,
				Text = tostring(i_2)
			}))
			var66 += 1
		end
		local lastDayOfWeek = dateTimeUtilitiesModule.getLastDayOfWeek(var29.month, var29.year)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var29.month, var29.year)
		local var79 = 7 - (lastDayOfWeek + 1)
		
		if var79 == 0 then
			var79 = 7
		end
		if var79 + #t < 50 then
			var79 += 50 - #t - var79
		end
		for i_3 = 1, var79 do
			local dateTime_1 = DateTime.fromLocalTime(nextMonthInfo_1, nextMonthInfo, i_3)
			table.insert(t, reactModule.createElement(calendarDayModule, {
				highlight = var38(dateTime_1),
				isSelectable = var39(dateTime_1),
				isSelected = var37(dateTime_1),
				key = "next-month-day-" .. i_3,
				LayoutOrder = var66,
				onActivated = function()
					-- upvalues: var36 (copy), i_3 (ref), nextMonthInfo (ref), nextMonthInfo_1 (ref)
					var36(i_3, nextMonthInfo, nextMonthInfo_1)
				end,
				testId = `{p0.testId}--next-month-calendar-day-{i_3}`,
				Text = tostring(i_3)
			}))
			var66 += 1
		end
		return t
	end, {
		var37, var38, var39, var29, var20, var36, p0.selectableDateRange,
		p0.showEndDateTimeCalendarInput
	})
	local var43 = reactModule.useCallback(function(p10)
		-- upvalues: var21 (ref), p0 (ref)
		local dateTime = DateTime.fromUnixTimestamp(p10)
		
		if os.date("*t", p10).isdst then
			dateTime = DateTime.fromUnixTimestamp(dateTime.UnixTimestamp - 3600)
		end
		var21({ dateTime })
		p0.onSelectedDateChanged({ dateTime })
	end, { var20, p0.onSelectedDateChanged })
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "col auto-y",
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromOffset(var17, 0),
		testId = p0.testId
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
				onActivated = var35,
				size = inputSizeModule.Small,
				variant = buttonVariantModule.Utility,
				testId = `{p0.testId}--previous-month-button`
			}),
			MonthText = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "grow auto-xy text-align-x-right",
				Text = dateTimeUtilitiesModule.monthMap[var29.month],
				testId = `{p0.testId}--month-text`
			}),
			YearText = reactModule.createElement(textModule, {
				LayoutOrder = 3,
				tag = "grow auto-xy text-align-x-left",
				Text = tostring(var29.year),
				testId = `{p0.testId}--year-text`
			}),
			NextMonthButton = reactModule.createElement(iconButtonModule, {
				LayoutOrder = 4,
				isCircular = true,
				icon = icon.ChevronSmallRight,
				onActivated = var34,
				size = inputSizeModule.Small,
				variant = buttonVariantModule.Utility,
				testId = `{p0.testId}--next-month-button`
			})
		}),
		TimeDropdown = if p0.showTimeDropdown then reactModule.createElement(timeDropdownModule, {
			LayoutOrder = 2,
			dateTime = var20[1],
			onItemChanged = var43,
			width = UDim.new(1, 0),
			testId = `{p0.testId}--time-dropdown`
		}) else nil
	}
	
	if p0.showStartDateTimeCalendarInput then
		local var50
		var46 = reactModule.createElement
		local var47 = viewModule
		local t_3 = {
			LayoutOrder = 3,
			tag = "row flex-x-fill align-y-center gap-small size-full-0 auto-y",
			testId = `{p0.testId}--input`
		}
		local t_4 = {
			StartDateTime = reactModule.createElement(textInputModule, {
				label = "",
				LayoutOrder = 1,
				placeholder = "MM/DD/YYYY",
				hasError = var25 ~= "" and dateTimeUtilitiesModule.getDateTimeFromText(var25) == nil,
				onChanged = var40,
				onFocusLost = var32,
				size = inputSizeModule.Medium,
				text = var25,
				onFocusGained = function()
					-- upvalues: var24 (ref)
					var24({ startDateTimeInput = true, endDateTimeInput = false })
				end,
				testId = `{p0.testId}--start-datetime-input`
			}),
			InputSeparator = if p0.showEndDateTimeCalendarInput then reactModule.createElement(textModule, { LayoutOrder = 2, tag = "auto-xy", Text = "-" }) else nil
		}
		
		if p0.showEndDateTimeCalendarInput then
			var50 = reactModule.createElement
			var50 = var50(textInputModule, {
				label = "",
				LayoutOrder = 3,
				placeholder = "MM/DD/YYYY",
				hasError = var27 ~= "" and dateTimeUtilitiesModule.getDateTimeFromText(var27) == nil,
				isDisabled = not var20[1],
				onChanged = var41,
				onFocusGained = function()
					-- upvalues: var24 (ref)
					var24({ startDateTimeInput = false, endDateTimeInput = true })
				end,
				onFocusLost = var33,
				size = inputSizeModule.Medium,
				text = var27,
				textBoxRef = var22,
				testId = `{p0.testId}--end-datetime-input`
			})
		else
			var50 = nil
		end
		t_4.EndDateTime = var50
		var46 = var46(var47, t_3, t_4)
	else
		var46 = nil
	end
	t_2.CalendarInputContainer = var46
	t_2.WeekAndDates = reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-full-0 auto-y",
		testId = `{p0.testId}--weekAndDates`
	}, var42)
	
	return createElement(viewModule, t_1, t_2)
end