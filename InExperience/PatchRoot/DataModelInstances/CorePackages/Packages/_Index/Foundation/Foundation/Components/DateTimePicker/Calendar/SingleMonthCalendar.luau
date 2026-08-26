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

local function CalendarPane(p1)
	-- upvalues: reactModule (ref), viewModule (ref), calendarHeaderModule (ref), calendarGrid (ref)
	local state = p1.state
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = p1.LayoutOrder,
		Size = p1.Size,
		tag = {
			["col gap-small padding-large"] = p1.showTimeList == true,
			["col auto-y"] = p1.showTimeList ~= true
		},
		testId = p1.rootTestId
	}, {
		CalendarHeader = reactModule.createElement(calendarHeaderModule, {
			LayoutOrder = 1,
			onNextMonth = state.navigateToNextMonth,
			onPreviousMonth = state.navigateToPreviousMonth,
			onViewDateChanged = state.onViewDateChanged,
			selectableDateRange = p1.selectableDateRange,
			testId = p1.testId,
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
			scaledCalendarWidth = p1.scaledCalendarWidth,
			selectableDateRange = p1.selectableDateRange,
			Size = p1.gridSize,
			testId = p1.testId
		})
	})
end

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), dateTimeLayoutUtilitiesModule (ref), useSingleMonthCalendarStateModule (ref), dateTimeCalendarConstantsModule (ref), reactModule (ref), viewModule (ref), CalendarPane (ref), timeListModule (ref), dateTimeCalendarViewUtilitiesModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useScaledValueModule(dateTimeLayoutUtilitiesModule.CALENDAR_WIDTH)
	local var4 = useScaledValueModule(dateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local var5 = useSingleMonthCalendarStateModule({
		isDateRange = var1.isDateRange,
		onSelectedDateChanged = var1.onSelectedDateChanged,
		referenceDate = var1.referenceDate,
		selectableDateRange = var1.selectableDateRange,
		selectedDates = var1.selectedDates,
		showTimeList = var1.showTimeList,
		viewAnchorDate = var1.viewAnchorDate
	})
	
	if var1.showTimeList then
		local var6 = dateTimeLayoutUtilitiesModule.computeSingleWithTimeLayout(var3, var4, var2, dateTimeCalendarConstantsModule.NUM_CALENDAR_GRID_ROWS)
		
		return reactModule.createElement(viewModule, {
			tag = "row align-y-top auto-xy",
			LayoutOrder = var1.LayoutOrder,
			testId = var1.testId
		}, {
			CalendarPane = reactModule.createElement(CalendarPane, {
				LayoutOrder = 1,
				showTimeList = true,
				gridSize = UDim2.fromOffset(var3, var6.gridHeight),
				scaledCalendarWidth = var3,
				selectableDateRange = var1.selectableDateRange,
				Size = UDim2.fromOffset(var6.calendarColumnWidth, var6.bodyHeight),
				state = var5,
				testId = var1.testId
			}),
			Divider = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				backgroundStyle = var2.Color.Stroke.Default,
				Size = UDim2.fromOffset(var2.Stroke.Standard, var6.bodyHeight)
			}),
			TimeListColumn = reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = "col padding-large",
				Size = UDim2.fromOffset(var6.timeListColumnWidth, var6.bodyHeight)
			}, {
				TimeList = reactModule.createElement(timeListModule, {
					LayoutOrder = 1,
					dateTime = var5.selectedDateTimes[1],
					dayAnchor = dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(var5.selectedDateTimes, var1.viewAnchorDate or var1.referenceDate),
					height = var6.timeListHeight,
					onItemChanged = var5.onTimeListItemChanged,
					testId = `{var1.testId}--time-list`,
					width = UDim.new(0, var4)
				})
			})
		})
	end
	return reactModule.createElement(CalendarPane, {
		LayoutOrder = var1.LayoutOrder,
		rootTestId = var1.testId,
		scaledCalendarWidth = var3,
		selectableDateRange = var1.selectableDateRange,
		Size = UDim2.fromOffset(var3, 0),
		state = var5,
		testId = var1.testId
	})
end