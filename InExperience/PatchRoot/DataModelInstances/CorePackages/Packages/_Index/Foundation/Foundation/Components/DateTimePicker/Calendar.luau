local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local calendarDayModule = require(script.Parent.CalendarDay)
local dateTimeUtilitiesModule = require(script.Parent.DateTimeUtilities)
local icon = builderIconsModule.Icon
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local iconButtonModule = require(foundation.Components.IconButton)
local inputSizeModule = require(foundation.Enums.InputSize)
local textModule = require(foundation.Components.Text)
local textInputModule = require(foundation.Components.TextInput)
local timeDropdownModule = require(script.Parent.TimeDropdown)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0) --[[ line: 53 | named "Calendar" ]]
	-- upvalues: useTokensModule (ref), useScaledValueModule (ref), reactModule (ref), dateTimeUtilitiesModule (ref), textModule (ref), calendarDayModule (ref), viewModule (ref), iconButtonModule (ref), icon (ref), inputSizeModule (ref), buttonVariantModule (ref), timeDropdownModule (ref), textInputModule (ref)
	local var14 = useTokensModule()
	local var15 = useScaledValueModule(272)
	local var16 = reactModule.useRef(false)
	local var17 = if not p0.defaultDates then { DateTime.now() } else p0.defaultDates
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: p0 (ref), var17 (ref)
		p0.onSelectedDateChanged(var17)
	end, { var17, p0.defaultDates, p0.onSelectedDateChanged })
	local var18, var19 = reactModule.useState(var17)
	local var20 = reactModule.useRef(nil)
	local var21, var22 = reactModule.useState(if p0.showEndDateTimeCalendarInput then { startDateTimeInput = false, endDateTimeInput = true } else { startDateTimeInput = true, endDateTimeInput = false })
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: p0 (ref), var21 (ref), var20 (ref)
		if p0.showEndDateTimeCalendarInput and var21.endDateTimeInput and var20.current then
			var20.current.focus()
		end
	end, { var21 })
	local var23, var24 = reactModule.useState(dateTimeUtilitiesModule.formatLocalTime(var17[1]))
	local var25, var26 = reactModule.useState(if var17[2] then dateTimeUtilitiesModule.formatLocalTime(var17[2]) else "")
	reactModule.useEffect(function() --[[ line: 88 ]]
		-- upvalues: var16 (ref)
		var16.current = true
	end, {})
	local var27, var28 = reactModule.useState({
		month = var17[1]:ToLocalTime().Month,
		year = var17[1]:ToLocalTime().Year
	})
	local t = {}
	
	for i, v in var18 do
		table.insert(t, v:ToLocalTime())
	end
	local var44
	local var30 = function() --[[ line: 106 ]]
		-- upvalues: dateTimeUtilitiesModule (copy), var23 (ref), var18 (ref), var24 (ref), var17 (ref)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(var23)
		
		if not dateTimeFromText and var18[1] or dateTimeFromText and var18[2] and dateTimeUtilitiesModule.roundToStartOfDay(var18[2]) < dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) then
			var24(dateTimeUtilitiesModule.formatLocalTime(var17[1]))
		end
	end
	
	local var31 = function() --[[ line: 125 ]]
		-- upvalues: dateTimeUtilitiesModule (copy), var25 (ref), var18 (ref), var26 (ref), var17 (ref)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(var25)
		
		if not dateTimeFromText and var18[2] or dateTimeFromText and var18[1] and dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) < dateTimeUtilitiesModule.roundToStartOfDay(var18[1]) then
			var26(dateTimeUtilitiesModule.formatLocalTime(var17[2]))
		end
	end
	
	local var32 = reactModule.useCallback(function() --[[ line: 140 ]]
		-- upvalues: dateTimeUtilitiesModule (copy), var27 (ref), var28 (ref)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var27.month, var27.year)
		var28({ month = nextMonthInfo, year = nextMonthInfo_1 })
	end, { var27 })
	local var33 = reactModule.useCallback(function() --[[ line: 145 ]]
		-- upvalues: dateTimeUtilitiesModule (copy), var27 (ref), var28 (ref)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var27.month, var27.year)
		var28({ month = prevMonthInfo, year = prevMonthInfo_1 })
	end, { var27 })
	local var34 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 151 ]]
		-- upvalues: var18 (ref), p0 (ref), var21 (ref), var24 (ref), dateTimeUtilitiesModule (copy), var22 (ref), var26 (ref), var28 (ref), var19 (ref)
		local dateTime = DateTime.fromLocalTime(p3, p2, p1, var18[1]:ToLocalTime().Hour, var18[1]:ToLocalTime().Minute)
		
		if not p0.showStartDateTimeCalendarInput then
			var28({ month = p2, year = p3 })
			var19({ dateTime })
			p0.onSelectedDateChanged({ dateTime })
			
			return
		elseif not p0.showEndDateTimeCalendarInput then
			var24(dateTimeUtilitiesModule.formatLocalTime(dateTime))
		elseif var21.startDateTimeInput then
			var24(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var22({ startDateTimeInput = false, endDateTimeInput = true })
		elseif var21.endDateTimeInput then
			var26(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var22({ startDateTimeInput = false, endDateTimeInput = false })
		else
			var24(dateTimeUtilitiesModule.formatLocalTime(dateTime))
			var26("")
			var22({ startDateTimeInput = false, endDateTimeInput = true })
		end
		var28({ month = p2, year = p3 })
	end, {
		p0.showStartDateTimeCalendarInput,
		p0.showEndDateTimeCalendarInput,
		var18,
		var21,
		var20
	})
	local var35 = reactModule.useCallback(function(p4) --[[ line: 196 ]]
		-- upvalues: t (ref)
		local var56 = p4:ToLocalTime()
		
		for i, v in t do
			if v.Day == var56.Day and v.Month == var56.Month and v.Year == var56.Year then
				return true
			end
		end
		return false
	end, { t })
	local var36 = reactModule.useCallback(function(p5) --[[ line: 210 ]]
		-- upvalues: p0 (ref), var18 (ref), dateTimeUtilitiesModule (copy)
		return p0.showEndDateTimeCalendarInput and (var18[1] and (var18[2] and dateTimeUtilitiesModule.isDateWithinRange(p5, { startDate = var18[1], endDate = var18[2] })))
	end, { p0.showEndDateTimeCalendarInput, var18 })
	local var37 = reactModule.useCallback(function(p6) --[[ line: 221 ]]
		-- upvalues: p0 (ref), dateTimeUtilitiesModule (copy), var21 (ref), var18 (ref)
		if p0.selectableDateRange and not dateTimeUtilitiesModule.isDateWithinRange(p6, p0.selectableDateRange) then
			return false
		elseif p0.showEndDateTimeCalendarInput then
			return if var21.endDateTimeInput and dateTimeUtilitiesModule.roundToStartOfDay(p6) < dateTimeUtilitiesModule.roundToStartOfDay(var18[1]) then false else var21.startDateTimeInput and var18[2] and dateTimeUtilitiesModule.roundToStartOfDay(var18[2]) < dateTimeUtilitiesModule.roundToStartOfDay(p6)
		end
	end, {
		var18,
		p0.selectableDateRange,
		var21,
		p0.showEndDateTimeCalendarInput
	})
	local var38 = reactModule.useCallback(function(p7) --[[ line: 255 ]]
		-- upvalues: var16 (ref), var24 (ref), dateTimeUtilitiesModule (copy), p0 (ref), var18 (ref), var28 (ref), var19 (ref)
		if not var16.current then return end
		var24(p7)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(p7)
		
		if dateTimeFromText then
			local var58 = if p0.showEndDateTimeCalendarInput then { dateTimeFromText, var18[2] } else { dateTimeFromText }
			local var59 = dateTimeFromText:ToLocalTime()
			var28({ month = var59.Month, year = var59.Year })
			var19(var58)
			p0.onSelectedDateChanged(var58)
		end
	end, {
		p0.onSelectedDateChanged,
		p0.showEndDateTimeCalendarInput,
		var37,
		var18,
		var16
	})
	local var39 = reactModule.useCallback(function(p8) --[[ line: 286 ]]
		-- upvalues: var16 (ref), var26 (ref), dateTimeUtilitiesModule (copy), var18 (ref), var28 (ref), var19 (ref), p0 (ref)
		if not var16.current then return end
		var26(p8)
		local dateTimeFromText = dateTimeUtilitiesModule.getDateTimeFromText(p8)
		
		if dateTimeFromText then
			if var18[1] and dateTimeUtilitiesModule.roundToStartOfDay(dateTimeFromText) < dateTimeUtilitiesModule.roundToStartOfDay(var18[1]) then
				return
			end
			local list = { var18[1], dateTimeFromText }
			local var62 = dateTimeFromText:ToLocalTime()
			var28({ month = var62.Month, year = var62.Year })
			var19(list)
			p0.onSelectedDateChanged(list)
			
			return
		elseif p8 == "" then
			var19(function(p9) --[[ line: 312 ]]
				-- upvalues: p0 (copy)
				p0.onSelectedDateChanged({ p9[1] })
				
				return { p9[1] }
			end)
			
			return
		end
	end, { p0.onSelectedDateChanged, var18, var37, var16 })
	local var40 = reactModule.useMemo(function() --[[ line: 321 ]]
		-- upvalues: reactModule (copy), var14 (ref), var15 (ref), dateTimeUtilitiesModule (copy), textModule (copy), var27 (ref), calendarDayModule (copy), var36 (ref), var37 (ref), var35 (ref), var34 (ref), p0 (ref)
		local t = {}
		table.insert(t, reactModule.createElement("UIGridLayout", {
			FillDirectionMaxCells = 7,
			key = "layout",
			CellPadding = UDim2.fromOffset(var14.Padding.None, var14.Padding.None),
			CellSize = UDim2.fromOffset(var15 / 7, var15 / 7),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}))
		local var64 = 1
		
		for i, v in dateTimeUtilitiesModule.weekdays do
			table.insert(t, reactModule.createElement(textModule, {
				tag = "text-body-small text-align-x-center text-align-y-center",
				key = v,
				LayoutOrder = var64,
				Text = v
			}))
			var64 += 1
		end
		local firstDayOfWeek = dateTimeUtilitiesModule.getFirstDayOfWeek(var27.month, var27.year)
		local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(var27.month, var27.year)
		local daysInMonth = dateTimeUtilitiesModule.getDaysInMonth(dateTimeUtilitiesModule.getPrevMonthInfo(var27.month, var27.year))
		local var69 = if firstDayOfWeek == 0 then 7 else firstDayOfWeek
		
		for i_1 = 1, var69 do
			local var70 = daysInMonth - var69 + i_1
			local dateTime = DateTime.fromLocalTime(prevMonthInfo_1, prevMonthInfo, var70)
			table.insert(t, reactModule.createElement(calendarDayModule, {
				highlight = var36(dateTime),
				isSelectable = var37(dateTime),
				isSelected = var35(dateTime),
				key = "prev-month-day-" .. var70,
				LayoutOrder = var64,
				onActivated = function() --[[ line: 380 ]]
					-- upvalues: var34 (copy), var70 (ref), prevMonthInfo (ref), prevMonthInfo_1 (ref)
					var34(var70, prevMonthInfo, prevMonthInfo_1)
				end,
				Text = tostring(var70),
				testId = `{p0.testId}--prev-month-calendar-day-{var70}`
			}))
			var64 += 1
		end
		for i_2 = 1, dateTimeUtilitiesModule.getDaysInMonth(var27.month, var27.year) do
			local var72 = var37(DateTime.fromLocalTime(var27.year, var27.month, i_2))
			local var73 = var35(DateTime.fromLocalTime(var27.year, var27.month, i_2))
			table.insert(t, reactModule.createElement(calendarDayModule, {
				emphasizeText = var72 and not var73,
				highlight = var36(DateTime.fromLocalTime(var27.year, var27.month, i_2)),
				isSelectable = var72,
				isSelected = var73,
				key = "current-month-day-" .. i_2,
				LayoutOrder = var64,
				onActivated = function() --[[ line: 411 ]]
					-- upvalues: var34 (copy), i_2 (ref), var27 (copy)
					var34(i_2, var27.month, var27.year)
				end,
				Text = tostring(i_2),
				testId = `{p0.testId}--current-month-calendar-day-{i_2}`
			}))
			var64 += 1
		end
		local lastDayOfWeek = dateTimeUtilitiesModule.getLastDayOfWeek(var27.month, var27.year)
		local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var27.month, var27.year)
		local var77 = 7 - (lastDayOfWeek + 1)
		
		if var77 == 0 then
			var77 = 7
		end
		if var77 + #t < 50 then
			var77 += 50 - #t - var77
		end
		for i_3 = 1, var77 do
			local dateTime_1 = DateTime.fromLocalTime(nextMonthInfo_1, nextMonthInfo, i_3)
			table.insert(t, reactModule.createElement(calendarDayModule, {
				highlight = var36(dateTime_1),
				isSelectable = var37(dateTime_1),
				isSelected = var35(dateTime_1),
				key = "next-month-day-" .. i_3,
				LayoutOrder = var64,
				onActivated = function() --[[ line: 449 ]]
					-- upvalues: var34 (copy), i_3 (ref), nextMonthInfo (ref), nextMonthInfo_1 (ref)
					var34(i_3, nextMonthInfo, nextMonthInfo_1)
				end,
				Text = tostring(i_3),
				testId = `{p0.testId}--next-month-calendar-day-{i_3}`
			}))
			var64 += 1
		end
		return t
	end, {
		var35, var36, var37, var27, var18, var34, p0.selectableDateRange,
		p0.showEndDateTimeCalendarInput
	})
	local var41 = reactModule.useCallback(function(p10) --[[ line: 474 ]]
		-- upvalues: var19 (ref), p0 (ref)
		local dateTime = DateTime.fromUnixTimestamp(p10)
		
		if os.date("*t", p10).isdst then
			dateTime = DateTime.fromUnixTimestamp(dateTime.UnixTimestamp - 3600)
		end
		var19({ dateTime })
		p0.onSelectedDateChanged({ dateTime })
	end, { var18, p0.onSelectedDateChanged })
	local createElement = reactModule.createElement
	local t_1 = {
		tag = "col auto-y",
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromOffset(var15, 0),
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
				onActivated = var33,
				size = inputSizeModule.Small,
				variant = buttonVariantModule.Utility,
				testId = `{p0.testId}--previous-month-button`
			}),
			MonthText = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "grow auto-xy text-align-x-right",
				Text = dateTimeUtilitiesModule.monthMap[var27.month],
				testId = `{p0.testId}--month-text`
			}),
			YearText = reactModule.createElement(textModule, {
				LayoutOrder = 3,
				tag = "grow auto-xy text-align-x-left",
				Text = tostring(var27.year),
				testId = `{p0.testId}--year-text`
			}),
			NextMonthButton = reactModule.createElement(iconButtonModule, {
				LayoutOrder = 4,
				isCircular = true,
				icon = icon.ChevronSmallRight,
				onActivated = var32,
				size = inputSizeModule.Small,
				variant = buttonVariantModule.Utility,
				testId = `{p0.testId}--next-month-button`
			})
		}),
		TimeDropdown = if p0.showTimeDropdown then reactModule.createElement(timeDropdownModule, {
			layoutOrder = 2,
			dateTime = var18[1],
			onItemChanged = var41,
			width = UDim.new(1, 0),
			testId = `{p0.testId}--time-dropdown`
		}) else nil
	}
	
	if p0.showStartDateTimeCalendarInput then
		local var48
		var44 = reactModule.createElement
		local var45 = viewModule
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
				hasError = var23 ~= "" and dateTimeUtilitiesModule.getDateTimeFromText(var23) == nil,
				onChanged = var38,
				onFocusLost = var30,
				size = inputSizeModule.Medium,
				text = var23,
				onFocusGained = function() --[[ line: 557 ]]
					-- upvalues: var22 (ref)
					var22({ startDateTimeInput = true, endDateTimeInput = false })
				end,
				testId = `{p0.testId}--start-datetime-input`
			}),
			InputSeparator = if p0.showEndDateTimeCalendarInput then reactModule.createElement(textModule, { LayoutOrder = 2, tag = "auto-xy", Text = "-" }) else nil
		}
		
		if p0.showEndDateTimeCalendarInput then
			var48 = reactModule.createElement
			var48 = var48(textInputModule, {
				label = "",
				LayoutOrder = 3,
				placeholder = "MM/DD/YYYY",
				hasError = var25 ~= "" and dateTimeUtilitiesModule.getDateTimeFromText(var25) == nil,
				isDisabled = not var18[1],
				onChanged = var39,
				onFocusGained = function() --[[ line: 577 ]]
					-- upvalues: var22 (ref)
					var22({ startDateTimeInput = false, endDateTimeInput = true })
				end,
				onFocusLost = var31,
				size = inputSizeModule.Medium,
				text = var25,
				textBoxRef = var20,
				testId = `{p0.testId}--end-datetime-input`
			})
		else
			var48 = nil
		end
		t_4.EndDateTime = var48
		var44 = var44(var45, t_3, t_4)
	else
		var44 = nil
	end
	t_2.CalendarInputContainer = var44
	t_2.WeekAndDates = reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-full-0 auto-y",
		testId = `{p0.testId}--weekAndDates`
	}, var40)
	
	return createElement(viewModule, t_1, t_2)
end