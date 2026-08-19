local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local calendarGrid = require(script.Parent.CalendarGrid).CalendarGrid
local calendarHeaderModule = require(script.Parent.CalendarHeader)
local dateTimeCalendarConstantsModule = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants)
local dateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeLayoutUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local _ = require(script.Parent.Parent.DateTimeUtilities)
local timeListModule = require(script.Parent.Parent.Time.TimeList)
local viewModule = require(foundation.Components.View)
local useSingleMonthCalendarStateModule = require(script.Parent.useSingleMonthCalendarState)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { testId = "--foundation-calendar" }

local function CalendarPane(p0) --[[ line: 56 ]]
	-- upvalues: reactModule (ref), viewModule (ref), calendarHeaderModule (ref), calendarGrid (ref)
	local state = p0.state
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = p0.LayoutOrder,
		Size = p0.Size,
		tag = {
			["col gap-small padding-large"] = p0.showTimeList == true,
			["col auto-y"] = p0.showTimeList ~= true
		},
		testId = p0.rootTestId
	}, {
		CalendarHeader = reactModule.createElement(calendarHeaderModule, {
			LayoutOrder = 1,
			onNextMonth = state.navigateToNextMonth,
			onPreviousMonth = state.navigateToPreviousMonth,
			onViewDateChanged = state.onViewDateChanged,
			selectableDateRange = p0.selectableDateRange,
			testId = p0.testId,
			viewDate = state.currViewDate
		}),
		WeekAndDates = reactModule.createElement(calendarGrid, {
			LayoutOrder = 2,
			currViewDate = state.currViewDate,
			handleDateActivated = state.handleDateActivated,
			highlightDates = state.highlightDates,
			isDateRange = state.isDateRange,
			localSelectedDateTimes = state.localSelectedDateTimes,
			onHoverEnter = state.onHoverEnter,
			onHoverLeave = state.onHoverLeave,
			scaledCalendarWidth = p0.scaledCalendarWidth,
			selectableDateRange = p0.selectableDateRange,
			Size = p0.gridSize,
			testId = p0.testId
		})
	})
end

return function(p1) --[[ line: 94 | named "SingleMonthCalendar" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), dateTimeLayoutUtilitiesModule (ref), useSingleMonthCalendarStateModule (ref), dateTimeCalendarConstantsModule (ref), reactModule (ref), viewModule (ref), CalendarPane (ref), timeListModule (ref), dateTimeCalendarViewUtilitiesModule (ref)
	local var14 = withDefaultsModule(p1, t)
	local var15 = useTokensModule()
	local var16 = useScaledValueModule(dateTimeLayoutUtilitiesModule.CALENDAR_WIDTH)
	local var17 = useScaledValueModule(dateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local var18 = useSingleMonthCalendarStateModule({
		isDateRange = var14.isDateRange,
		onSelectedDateChanged = var14.onSelectedDateChanged,
		referenceDate = var14.referenceDate,
		selectableDateRange = var14.selectableDateRange,
		selectedDates = var14.selectedDates,
		showTimeList = var14.showTimeList,
		viewAnchorDate = var14.viewAnchorDate
	})
	
	if var14.showTimeList then
		local var19 = dateTimeLayoutUtilitiesModule.computeSingleWithTimeLayout(var16, var17, var15, dateTimeCalendarConstantsModule.NUM_CALENDAR_GRID_ROWS)
		
		return reactModule.createElement(viewModule, {
			tag = "row align-y-top auto-xy",
			LayoutOrder = var14.LayoutOrder,
			testId = var14.testId
		}, {
			CalendarPane = reactModule.createElement(CalendarPane, {
				LayoutOrder = 1,
				showTimeList = true,
				gridSize = UDim2.fromOffset(var16, var19.gridHeight),
				scaledCalendarWidth = var16,
				selectableDateRange = var14.selectableDateRange,
				Size = UDim2.fromOffset(var19.calendarColumnWidth, var19.bodyHeight),
				state = var18,
				testId = var14.testId
			}),
			Divider = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				backgroundStyle = var15.Color.Stroke.Default,
				Size = UDim2.fromOffset(var15.Stroke.Standard, var19.bodyHeight)
			}),
			TimeListColumn = reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = "col padding-large",
				Size = UDim2.fromOffset(var19.timeListColumnWidth, var19.bodyHeight)
			}, {
				TimeList = reactModule.createElement(timeListModule, {
					LayoutOrder = 1,
					dateTime = var18.selectedDateTimes[1],
					dayAnchor = dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(var18.selectedDateTimes, var14.viewAnchorDate or var14.referenceDate),
					height = var19.timeListHeight,
					onItemChanged = var18.onTimeListItemChanged,
					testId = `{var14.testId}--time-list`,
					width = UDim.new(0, var17)
				})
			})
		})
	end
	return reactModule.createElement(CalendarPane, {
		LayoutOrder = var14.LayoutOrder,
		rootTestId = var14.testId,
		scaledCalendarWidth = var16,
		selectableDateRange = var14.selectableDateRange,
		Size = UDim2.fromOffset(var16, 0),
		state = var18,
		testId = var14.testId
	})
end