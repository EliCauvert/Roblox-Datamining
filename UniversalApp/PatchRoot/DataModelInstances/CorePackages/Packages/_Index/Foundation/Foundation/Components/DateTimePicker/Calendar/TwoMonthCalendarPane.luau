local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dateTimeCalendarConstantsModule = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants)
local dateTimeCalendarDayConfigUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayConfigUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local rangeCalendarDayCellModule = require(script.Parent.RangeCalendarDayCell)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local DAYS_PER_WEEK = dateTimeCalendarConstantsModule.DAYS_PER_WEEK
local buildTwoMonthPaneCellConfigs = dateTimeCalendarDayConfigUtilitiesModule.buildTwoMonthPaneCellConfigs

local function EmptyCell(p0)
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromOffset(p0.cellSize, p0.cellSize)
	})
end

return function(p1)
	-- upvalues: reactModule (ref), buildTwoMonthPaneCellConfigs (ref), DAYS_PER_WEEK (ref), dateTimeUtilitiesModule (ref), textModule (ref), EmptyCell (ref), rangeCalendarDayCellModule (ref), viewModule (ref)
	local var9 = reactModule.useMemo(function()
		-- upvalues: buildTwoMonthPaneCellConfigs (copy), p1 (ref)
		return buildTwoMonthPaneCellConfigs(p1.month, p1.year)
	end, { p1.month, p1.year })
	local list = {
		reactModule.createElement("UIGridLayout", {
			key = "layout",
			CellPadding = UDim2.fromOffset(0, 0),
			CellSize = UDim2.fromOffset(p1.cellSize, p1.cellSize),
			FillDirection = Enum.FillDirection.Horizontal,
			FillDirectionMaxCells = DAYS_PER_WEEK,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	}
	local var11 = 1
	
	for i, v in dateTimeUtilitiesModule.weekdays do
		table.insert(list, reactModule.createElement(textModule, {
			tag = "text-body-small text-align-x-center text-align-y-center",
			key = `weekday-{v}`,
			LayoutOrder = var11,
			Text = v
		}))
		var11 += 1
	end
	for i, v_1 in var9 do
		if v_1.day == nil then
			table.insert(list, reactModule.createElement(EmptyCell, {
				key = v_1.key,
				cellSize = p1.cellSize,
				LayoutOrder = v_1.LayoutOrder
			}))
		else
			table.insert(list, reactModule.createElement(rangeCalendarDayCellModule, {
				key = v_1.key,
				cellSize = p1.cellSize,
				day = v_1.day,
				hoveredDate = p1.hoveredDate,
				LayoutOrder = v_1.LayoutOrder,
				month = v_1.month,
				onDayActivated = p1.onDayActivated,
				onHoverEnter = p1.onHoverEnter,
				selectableDateRange = p1.selectableDateRange,
				selectedDates = p1.selectedDates,
				testId = p1.testId,
				year = v_1.year
			}))
		end
	end
	return reactModule.createElement(viewModule, {
		tag = "auto-y",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromOffset(p1.paneWidth, 0),
		testId = `{p1.testId}--pane-{p1.LayoutOrder}`
	}, list)
end