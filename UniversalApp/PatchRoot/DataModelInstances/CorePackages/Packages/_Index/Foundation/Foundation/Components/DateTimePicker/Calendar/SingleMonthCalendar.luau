local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CalendarGrid = require(script.Parent.CalendarGrid).CalendarGrid
local CalendarHeaderModule = require(script.Parent.CalendarHeader)
local DateTimeCalendarConstantsModule = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants)
local DateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeLayoutUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local _ = require(script.Parent.Parent.DateTimeUtilities)
local TimeListModule = require(script.Parent.Parent.Time.TimeList)
local ViewModule = require(Foundation.Components.View)
local UseSingleMonthCalendarStateModule = require(script.Parent.useSingleMonthCalendarState)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { testId = "--foundation-calendar" }

local function CalendarPane(Frame)
	-- upvalues: ReactModule (copy), ViewModule (copy), CalendarHeaderModule (copy), CalendarGrid (copy)
	local State = Frame.state
	
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		Size = Frame.Size,
		tag = {
			["col gap-small padding-large"] = Frame.showTimeList == true,
			["col auto-y"] = Frame.showTimeList ~= true
		},
		testId = Frame.rootTestId
	}, {
		CalendarHeader = ReactModule.createElement(CalendarHeaderModule, {
			LayoutOrder = 1,
			onNextMonth = State.navigateToNextMonth,
			onPreviousMonth = State.navigateToPreviousMonth,
			onViewDateChanged = State.onViewDateChanged,
			selectableDateRange = Frame.selectableDateRange,
			testId = Frame.testId,
			viewDate = State.currViewDate
		}),
		WeekAndDates = ReactModule.createElement(CalendarGrid, {
			LayoutOrder = 2,
			currViewDate = State.currViewDate,
			handleDateActivated = State.handleDateActivated,
			highlightDates = State.highlightDates,
			isDateRange = State.isDateRange,
			localSelectedDateTimes = State.localSelectedDateTimes,
			onHoverEnter = State.onHoverEnter,
			onHoverLeave = State.onHoverLeave,
			scaledCalendarWidth = Frame.scaledCalendarWidth,
			selectableDateRange = Frame.selectableDateRange,
			Size = Frame.gridSize,
			testId = Frame.testId
		})
	})
end

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseScaledValueModule (copy), DateTimeLayoutUtilitiesModule (copy), UseSingleMonthCalendarStateModule (copy), DateTimeCalendarConstantsModule (copy), ReactModule (copy), ViewModule (copy), CalendarPane (copy), TimeListModule (copy), DateTimeCalendarViewUtilitiesModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseScaledValueModuleResult = UseScaledValueModule(DateTimeLayoutUtilitiesModule.CALENDAR_WIDTH)
	local UseScaledValueModuleResult1 = UseScaledValueModule(DateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local UseSingleMonthCalendarStateModuleResult = UseSingleMonthCalendarStateModule({
		isDateRange = WithDefaultsModuleResult.isDateRange,
		onSelectedDateChanged = WithDefaultsModuleResult.onSelectedDateChanged,
		referenceDate = WithDefaultsModuleResult.referenceDate,
		selectableDateRange = WithDefaultsModuleResult.selectableDateRange,
		selectedDates = WithDefaultsModuleResult.selectedDates,
		showTimeList = WithDefaultsModuleResult.showTimeList,
		viewAnchorDate = WithDefaultsModuleResult.viewAnchorDate
	})
	
	if WithDefaultsModuleResult.showTimeList then
		local SingleWithTimeLayout = DateTimeLayoutUtilitiesModule.computeSingleWithTimeLayout(UseScaledValueModuleResult, UseScaledValueModuleResult1, UseTokensModuleResult, DateTimeCalendarConstantsModule.NUM_CALENDAR_GRID_ROWS)
		
		return ReactModule.createElement(ViewModule, {
			tag = "row align-y-top auto-xy",
			LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
			testId = WithDefaultsModuleResult.testId
		}, {
			CalendarPane = ReactModule.createElement(CalendarPane, {
				LayoutOrder = 1,
				showTimeList = true,
				gridSize = UDim2.fromOffset(UseScaledValueModuleResult, SingleWithTimeLayout.gridHeight),
				scaledCalendarWidth = UseScaledValueModuleResult,
				selectableDateRange = WithDefaultsModuleResult.selectableDateRange,
				Size = UDim2.fromOffset(SingleWithTimeLayout.calendarColumnWidth, SingleWithTimeLayout.bodyHeight),
				state = UseSingleMonthCalendarStateModuleResult,
				testId = WithDefaultsModuleResult.testId
			}),
			Divider = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				backgroundStyle = UseTokensModuleResult.Color.Stroke.Default,
				Size = UDim2.fromOffset(UseTokensModuleResult.Stroke.Standard, SingleWithTimeLayout.bodyHeight)
			}),
			TimeListColumn = ReactModule.createElement(ViewModule, {
				LayoutOrder = 3,
				tag = "col padding-large",
				Size = UDim2.fromOffset(SingleWithTimeLayout.timeListColumnWidth, SingleWithTimeLayout.bodyHeight)
			}, {
				TimeList = ReactModule.createElement(TimeListModule, {
					LayoutOrder = 1,
					dateTime = UseSingleMonthCalendarStateModuleResult.selectedDateTimes[1],
					dayAnchor = DateTimeCalendarViewUtilitiesModule.resolveAnchorDate(UseSingleMonthCalendarStateModuleResult.selectedDateTimes, WithDefaultsModuleResult.viewAnchorDate or WithDefaultsModuleResult.referenceDate),
					height = SingleWithTimeLayout.timeListHeight,
					onItemChanged = UseSingleMonthCalendarStateModuleResult.onTimeListItemChanged,
					testId = `{WithDefaultsModuleResult.testId}--time-list`,
					width = UDim.new(0, UseScaledValueModuleResult1)
				})
			})
		})
	else
		return ReactModule.createElement(CalendarPane, {
			LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
			rootTestId = WithDefaultsModuleResult.testId,
			scaledCalendarWidth = UseScaledValueModuleResult,
			selectableDateRange = WithDefaultsModuleResult.selectableDateRange,
			Size = UDim2.fromOffset(UseScaledValueModuleResult, 0),
			state = UseSingleMonthCalendarStateModuleResult,
			testId = WithDefaultsModuleResult.testId
		})
	end
end