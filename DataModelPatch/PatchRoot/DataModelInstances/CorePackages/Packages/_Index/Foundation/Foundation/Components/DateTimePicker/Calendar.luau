local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local CalendarDayModule = require(script.Parent.CalendarDay)
local DateTimeUtilitiesModule = require(script.Parent.DateTimeUtilities)
local Icon = require(Parent.BuilderIcons).Icon
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local IconButtonModule = require(Foundation.Components.IconButton)
local InputSizeModule = require(Foundation.Enums.InputSize)
local TextModule = require(Foundation.Components.Text)
local TextInputModule = require(Foundation.Components.TextInput)
local TimeDropdownModule = require(script.Parent.TimeDropdown)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(Frame)
	-- upvalues: UseTokensModule (copy), UseScaledValueModule (copy), ReactModule (copy), DateTimeUtilitiesModule (copy), TextModule (copy), CalendarDayModule (copy), ViewModule (copy), IconButtonModule (copy), Icon (copy), InputSizeModule (copy), ButtonVariantModule (copy), TimeDropdownModule (copy), TextInputModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseScaledValueModuleResult = UseScaledValueModule(272)
	local UseRefResult = ReactModule.useRef(false)
	local DefaultDates = if Frame.defaultDates then Frame.defaultDates else { DateTime.now() }
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), DefaultDates (copy)
		Frame.onSelectedDateChanged(DefaultDates)
	end, {
		DefaultDates,
		Frame.defaultDates,
		Frame.onSelectedDateChanged
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(DefaultDates)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if Frame.showEndDateTimeCalendarInput then { startDateTimeInput = false, endDateTimeInput = true } else { startDateTimeInput = true, endDateTimeInput = false })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult1 (copy), UseRefResult1 (copy)
		if Frame.showEndDateTimeCalendarInput and UseStateResult1.endDateTimeInput and UseRefResult1.current then
			UseRefResult1.current.focus()
		end
	end, { UseStateResult1 })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(DateTimeUtilitiesModule.formatLocalTime(DefaultDates[1]))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(if DefaultDates[2] then DateTimeUtilitiesModule.formatLocalTime(DefaultDates[2]) else "")
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
	end, {})
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState({
		month = DefaultDates[1]:ToLocalTime().Month,
		year = DefaultDates[1]:ToLocalTime().Year
	})
	local List = {}
	
	for _, value in UseStateResult do
		table.insert(List, value:ToLocalTime())
	end
	local function OnFocusLost()
		-- upvalues: DateTimeUtilitiesModule (upval), UseStateResult3 (copy), UseStateResult (copy), UseStateResult2_2 (copy), DefaultDates (copy)
		local DateTimeFromText = DateTimeUtilitiesModule.getDateTimeFromText(UseStateResult3)
		
		if not DateTimeFromText and UseStateResult[1] or DateTimeFromText and UseStateResult[2] and DateTimeUtilitiesModule.roundToStartOfDay(UseStateResult[2]) < DateTimeUtilitiesModule.roundToStartOfDay(DateTimeFromText) then
			UseStateResult2_2(DateTimeUtilitiesModule.formatLocalTime(DefaultDates[1]))
		end
	end
	
	local function OnFocusLost1()
		-- upvalues: DateTimeUtilitiesModule (upval), UseStateResult4 (copy), UseStateResult (copy), UseStateResult2_3 (copy), DefaultDates (copy)
		local DateTimeFromText = DateTimeUtilitiesModule.getDateTimeFromText(UseStateResult4)
		
		if not DateTimeFromText and UseStateResult[2] or DateTimeFromText and UseStateResult[1] and DateTimeUtilitiesModule.roundToStartOfDay(DateTimeFromText) < DateTimeUtilitiesModule.roundToStartOfDay(UseStateResult[1]) then
			UseStateResult2_3(DateTimeUtilitiesModule.formatLocalTime(DefaultDates[2]))
		end
	end
	
	local UseResult = ReactModule.useCallback(function(p1, Month, Year)
		-- upvalues: UseStateResult (copy), Frame (copy), UseStateResult1 (copy), UseStateResult2_2 (copy), DateTimeUtilitiesModule (upval), UseStateResult2_1 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy), UseStateResult2 (copy)
		local _DateTime = DateTime.fromLocalTime(Year, Month, p1, UseStateResult[1]:ToLocalTime().Hour, UseStateResult[1]:ToLocalTime().Minute)
		
		if not Frame.showStartDateTimeCalendarInput then
			UseStateResult2_4({ month = Month, year = Year })
			UseStateResult2({ _DateTime })
			Frame.onSelectedDateChanged({ _DateTime })
			
			return
		end
		if Frame.showEndDateTimeCalendarInput then
			if UseStateResult1.startDateTimeInput then
				UseStateResult2_2(DateTimeUtilitiesModule.formatLocalTime(_DateTime))
				UseStateResult2_1({ startDateTimeInput = false, endDateTimeInput = true })
			elseif UseStateResult1.endDateTimeInput then
				UseStateResult2_3(DateTimeUtilitiesModule.formatLocalTime(_DateTime))
				UseStateResult2_1({ startDateTimeInput = false, endDateTimeInput = false })
			else
				UseStateResult2_2(DateTimeUtilitiesModule.formatLocalTime(_DateTime))
				UseStateResult2_3("")
				UseStateResult2_1({ startDateTimeInput = false, endDateTimeInput = true })
			end
		else
			UseStateResult2_2(DateTimeUtilitiesModule.formatLocalTime(_DateTime))
		end
		UseStateResult2_4({ month = Month, year = Year })
	end, {
		Frame.showStartDateTimeCalendarInput,
		Frame.showEndDateTimeCalendarInput,
		UseStateResult,
		UseStateResult1,
		UseRefResult1
	})
	local UseResult1 = ReactModule.useCallback(function(p1): boolean
		-- upvalues: List (copy)
		local LocalTime = p1:ToLocalTime()
		
		for _, value in List do
			if value.Day == LocalTime.Day and value.Month == LocalTime.Month and value.Year == LocalTime.Year then
				return true
			end
		end
		return false
	end, { List })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: Frame (copy), UseStateResult (copy), DateTimeUtilitiesModule (upval)
		return Frame.showEndDateTimeCalendarInput and (UseStateResult[1] and (UseStateResult[2] and DateTimeUtilitiesModule.isDateWithinRange(p2, {
			startDate = UseStateResult[1],
			endDate = UseStateResult[2]
		})))
	end, { Frame.showEndDateTimeCalendarInput, UseStateResult })
	local UseResult3 = ReactModule.useCallback(function(p2): boolean
		-- upvalues: Frame (copy), DateTimeUtilitiesModule (upval), UseStateResult1 (copy), UseStateResult (copy)
		if Frame.selectableDateRange and not DateTimeUtilitiesModule.isDateWithinRange(p2, Frame.selectableDateRange) then
			return false
		elseif Frame.showEndDateTimeCalendarInput then
			if UseStateResult1.endDateTimeInput and DateTimeUtilitiesModule.roundToStartOfDay(p2) < DateTimeUtilitiesModule.roundToStartOfDay(UseStateResult[1]) then
				return false
			elseif UseStateResult1.startDateTimeInput and UseStateResult[2] and DateTimeUtilitiesModule.roundToStartOfDay(UseStateResult[2]) < DateTimeUtilitiesModule.roundToStartOfDay(p2) then
				return false
			end
		end
		return true
	end, {
		UseStateResult,
		Frame.selectableDateRange,
		UseStateResult1,
		Frame.showEndDateTimeCalendarInput
	})
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseStateResult2_2 (copy), DateTimeUtilitiesModule (upval), Frame (copy), UseStateResult (copy), UseStateResult2_4 (copy), UseStateResult2 (copy)
		if not UseRefResult.current then return end
		UseStateResult2_2(p2)
		local DateTimeFromText = DateTimeUtilitiesModule.getDateTimeFromText(p2)
		
		if DateTimeFromText then
			local List = if Frame.showEndDateTimeCalendarInput then { DateTimeFromText, UseStateResult[2] } else { DateTimeFromText }
			local LocalTime = DateTimeFromText:ToLocalTime()
			UseStateResult2_4({ month = LocalTime.Month, year = LocalTime.Year })
			UseStateResult2(List)
			Frame.onSelectedDateChanged(List)
		end
	end, {
		Frame.onSelectedDateChanged,
		Frame.showEndDateTimeCalendarInput,
		UseResult3,
		UseStateResult,
		UseRefResult
	})
	local UseResult5 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseStateResult2_3 (copy), DateTimeUtilitiesModule (upval), UseStateResult (copy), UseStateResult2_4 (copy), UseStateResult2 (copy), Frame (copy)
		if not UseRefResult.current then return end
		UseStateResult2_3(p2)
		local DateTimeFromText = DateTimeUtilitiesModule.getDateTimeFromText(p2)
		
		if DateTimeFromText then
			if not UseStateResult[1] or DateTimeUtilitiesModule.roundToStartOfDay(DateTimeFromText) >= DateTimeUtilitiesModule.roundToStartOfDay(UseStateResult[1]) then
				local list = { UseStateResult[1], DateTimeFromText }
				local LocalTime = DateTimeFromText:ToLocalTime()
				UseStateResult2_4({ month = LocalTime.Month, year = LocalTime.Year })
				UseStateResult2(list)
				Frame.onSelectedDateChanged(list)
				
				return
			end
			return
		elseif p2 == "" then
			UseStateResult2(function(Entry)
				-- upvalues: Frame (upval)
				Frame.onSelectedDateChanged({ Entry[1] })
				
				return { Entry[1] }
			end)
			
			return
		else
		end
	end, {
		Frame.onSelectedDateChanged,
		UseStateResult,
		UseResult3,
		UseRefResult
	})
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), Frame (copy)
		local _DateTime = DateTime.fromUnixTimestamp(p2)
		
		if os.date("*t", p2).isdst then
			_DateTime = DateTime.fromUnixTimestamp(_DateTime.UnixTimestamp - 3600)
		end
		UseStateResult2({ _DateTime })
		Frame.onSelectedDateChanged({ _DateTime })
	end, { UseStateResult, Frame.onSelectedDateChanged })
	
	return ReactModule.createElement(ViewModule, {
		tag = "col auto-y",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromOffset(UseScaledValueModuleResult, 0),
		testId = Frame.testId
	}, {
		CalendarHeader = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-y-small"
		}, {
			PreviousMonthButton = ReactModule.createElement(IconButtonModule, {
				LayoutOrder = 1,
				isCircular = true,
				icon = Icon.ChevronSmallLeft,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: DateTimeUtilitiesModule (upval), UseStateResult5 (copy), UseStateResult2_4 (copy)
					local PrevMonthInfo, PrevMonthInfo2 = DateTimeUtilitiesModule.getPrevMonthInfo(UseStateResult5.month, UseStateResult5.year)
					UseStateResult2_4({ month = PrevMonthInfo, year = PrevMonthInfo2 })
				end, { UseStateResult5 }),
				size = InputSizeModule.Small,
				variant = ButtonVariantModule.Utility,
				testId = `{Frame.testId}--previous-month-button`
			}),
			MonthText = ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				tag = "grow auto-xy text-align-x-right",
				Text = DateTimeUtilitiesModule.monthMap[UseStateResult5.month],
				testId = `{Frame.testId}--month-text`
			}),
			YearText = ReactModule.createElement(TextModule, {
				LayoutOrder = 3,
				tag = "grow auto-xy text-align-x-left",
				Text = tostring(UseStateResult5.year),
				testId = `{Frame.testId}--year-text`
			}),
			NextMonthButton = ReactModule.createElement(IconButtonModule, {
				LayoutOrder = 4,
				isCircular = true,
				icon = Icon.ChevronSmallRight,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: DateTimeUtilitiesModule (upval), UseStateResult5 (copy), UseStateResult2_4 (copy)
					local NextMonthInfo, NextMonthInfo2 = DateTimeUtilitiesModule.getNextMonthInfo(UseStateResult5.month, UseStateResult5.year)
					UseStateResult2_4({ month = NextMonthInfo, year = NextMonthInfo2 })
				end, { UseStateResult5 }),
				size = InputSizeModule.Small,
				variant = ButtonVariantModule.Utility,
				testId = `{Frame.testId}--next-month-button`
			})
		}),
		TimeDropdown = if Frame.showTimeDropdown then ReactModule.createElement(TimeDropdownModule, {
			layoutOrder = 2,
			dateTime = UseStateResult[1],
			onItemChanged = UseResult6,
			width = UDim.new(1, 0),
			testId = `{Frame.testId}--time-dropdown`
		}) else nil,
		CalendarInputContainer = if Frame.showStartDateTimeCalendarInput then ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			tag = "row flex-x-fill align-y-center gap-small size-full-0 auto-y",
			testId = `{Frame.testId}--input`
		}, {
			StartDateTime = ReactModule.createElement(TextInputModule, {
				label = "",
				LayoutOrder = 1,
				placeholder = "MM/DD/YYYY",
				hasError = UseStateResult3 ~= "" and DateTimeUtilitiesModule.getDateTimeFromText(UseStateResult3) == nil,
				onChanged = UseResult4,
				onFocusLost = OnFocusLost,
				size = InputSizeModule.Medium,
				text = UseStateResult3,
				onFocusGained = function()
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1({ startDateTimeInput = true, endDateTimeInput = false })
				end,
				testId = `{Frame.testId}--start-datetime-input`
			}),
			InputSeparator = if Frame.showEndDateTimeCalendarInput then ReactModule.createElement(TextModule, { LayoutOrder = 2, tag = "auto-xy", Text = "-" }) else nil,
			EndDateTime = if Frame.showEndDateTimeCalendarInput then ReactModule.createElement(TextInputModule, {
				label = "",
				LayoutOrder = 3,
				placeholder = "MM/DD/YYYY",
				hasError = UseStateResult4 ~= "" and DateTimeUtilitiesModule.getDateTimeFromText(UseStateResult4) == nil,
				isDisabled = not UseStateResult[1],
				onChanged = UseResult5,
				onFocusGained = function()
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1({ startDateTimeInput = false, endDateTimeInput = true })
				end,
				onFocusLost = OnFocusLost1,
				size = InputSizeModule.Medium,
				text = UseStateResult4,
				textBoxRef = UseRefResult1,
				testId = `{Frame.testId}--end-datetime-input`
			}) else nil
		}) else nil,
		WeekAndDates = ReactModule.createElement(ViewModule, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y",
			testId = `{Frame.testId}--weekAndDates`
		}, (ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), UseTokensModuleResult (copy), UseScaledValueModuleResult (copy), DateTimeUtilitiesModule (upval), TextModule (upval), UseStateResult5 (copy), CalendarDayModule (upval), UseResult2 (copy), UseResult3 (copy), UseResult1 (copy), UseResult (copy), Frame (copy)
			local List = {}
			table.insert(List, ReactModule.createElement("UIGridLayout", {
				FillDirectionMaxCells = 7,
				key = "layout",
				CellPadding = UDim2.fromOffset(UseTokensModuleResult.Padding.None, UseTokensModuleResult.Padding.None),
				CellSize = UDim2.fromOffset(UseScaledValueModuleResult / 7, UseScaledValueModuleResult / 7),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}))
			local LayoutOrder = 1
			
			for _, weekday in DateTimeUtilitiesModule.weekdays do
				table.insert(List, ReactModule.createElement(TextModule, {
					tag = "text-body-small text-align-x-center text-align-y-center",
					key = weekday,
					LayoutOrder = LayoutOrder,
					Text = weekday
				}))
				LayoutOrder += 1
			end
			local FirstDayOfWeek = DateTimeUtilitiesModule.getFirstDayOfWeek(UseStateResult5.month, UseStateResult5.year)
			local PrevMonthInfo, PrevMonthInfo2 = DateTimeUtilitiesModule.getPrevMonthInfo(UseStateResult5.month, UseStateResult5.year)
			local DaysInMonth = DateTimeUtilitiesModule.getDaysInMonth(DateTimeUtilitiesModule.getPrevMonthInfo(UseStateResult5.month, UseStateResult5.year))
			local FirstDayOfWeek1 = if FirstDayOfWeek == 0 then 7 else FirstDayOfWeek
			for i = 1, FirstDayOfWeek1 do
				local NewDaysInMonth = DaysInMonth - FirstDayOfWeek1 + i
				local _DateTime = DateTime.fromLocalTime(PrevMonthInfo2, PrevMonthInfo, NewDaysInMonth)
				table.insert(List, ReactModule.createElement(CalendarDayModule, {
					highlight = UseResult2(_DateTime),
					isSelectable = UseResult3(_DateTime),
					isSelected = UseResult1(_DateTime),
					key = "prev-month-day-" .. NewDaysInMonth,
					LayoutOrder = LayoutOrder,
					onActivated = function()
						-- upvalues: UseResult (upval), NewDaysInMonth (copy), PrevMonthInfo (copy), PrevMonthInfo2 (copy)
						UseResult(NewDaysInMonth, PrevMonthInfo, PrevMonthInfo2)
					end,
					Text = tostring(NewDaysInMonth),
					testId = `{Frame.testId}--prev-month-calendar-day-{NewDaysInMonth}`
				}))
				LayoutOrder += 1
			end
			for i1 = 1, DateTimeUtilitiesModule.getDaysInMonth(UseStateResult5.month, UseStateResult5.year) do
				local UseResultResult = UseResult3(DateTime.fromLocalTime(UseStateResult5.year, UseStateResult5.month, i1))
				local UseResultResult1 = UseResult1(DateTime.fromLocalTime(UseStateResult5.year, UseStateResult5.month, i1))
				local CreateElementFunction = ReactModule.createElement
				local config = { emphasizeText = UseResultResult and not UseResultResult1 }
				config.highlight = UseResult2(DateTime.fromLocalTime(UseStateResult5.year, UseStateResult5.month, i1))
				config.isSelectable = UseResultResult
				config.isSelected = UseResultResult1
				config.key = "current-month-day-" .. i1
				config.LayoutOrder = LayoutOrder
				
				function config.onActivated()
					-- upvalues: UseResult (upval), i1 (copy), UseStateResult5 (upval)
					UseResult(i1, UseStateResult5.month, UseStateResult5.year)
				end
				
				config.Text = tostring(i1)
				config.testId = `{Frame.testId}--current-month-calendar-day-{i1}`
				table.insert(List, CreateElementFunction(CalendarDayModule, config))
				LayoutOrder += 1
			end
			local LastDayOfWeek: number = DateTimeUtilitiesModule.getLastDayOfWeek(UseStateResult5.month, UseStateResult5.year)
			local NextMonthInfo, NextMonthInfo2 = DateTimeUtilitiesModule.getNextMonthInfo(UseStateResult5.month, UseStateResult5.year)
			local Total = 7 - (LastDayOfWeek + 1)
			
			if Total == 0 then
				Total = 7
			end
			if Total + #List < 50 then
				Total += 50 - #List - Total
			end
			for i2 = 1, Total do
				local _DateTime = DateTime.fromLocalTime(NextMonthInfo2, NextMonthInfo, i2)
				table.insert(List, ReactModule.createElement(CalendarDayModule, {
					highlight = UseResult2(_DateTime),
					isSelectable = UseResult3(_DateTime),
					isSelected = UseResult1(_DateTime),
					key = "next-month-day-" .. i2,
					LayoutOrder = LayoutOrder,
					onActivated = function()
						-- upvalues: UseResult (upval), i2 (copy), NextMonthInfo (copy), NextMonthInfo2 (copy)
						UseResult(i2, NextMonthInfo, NextMonthInfo2)
					end,
					Text = tostring(i2),
					testId = `{Frame.testId}--next-month-calendar-day-{i2}`
				}))
				LayoutOrder += 1
			end
			return List
		end, {
			UseResult1, UseResult2, UseResult3, UseStateResult5, UseStateResult, UseResult,
			Frame.selectableDateRange, Frame.showEndDateTimeCalendarInput
		})))
	})
end