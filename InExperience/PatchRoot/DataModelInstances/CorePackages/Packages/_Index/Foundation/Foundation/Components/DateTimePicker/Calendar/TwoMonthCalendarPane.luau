local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local RangeCalendarDayCellModule = require(script.Parent.RangeCalendarDayCell)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local DAYSPERWEEK = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants).DAYS_PER_WEEK
local BuildTwoMonthPaneCellConfigsFunction = require(script.Parent.Parent.Utilities.DateTimeCalendarDayConfigUtilities).buildTwoMonthPaneCellConfigs

local function EmptyCell(Frame)
	-- upvalues: ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromOffset(Frame.cellSize, Frame.cellSize)
	})
end

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), BuildTwoMonthPaneCellConfigsFunction (copy), DAYSPERWEEK (copy), DateTimeUtilitiesModule (copy), TextModule (copy), EmptyCell (copy), RangeCalendarDayCellModule (copy), ViewModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: BuildTwoMonthPaneCellConfigsFunction (upval), Frame (copy)
		return BuildTwoMonthPaneCellConfigsFunction(Frame.month, Frame.year)
	end, { Frame.month, Frame.year })
	local Elements = {
		ReactModule.createElement("UIGridLayout", {
			key = "layout",
			CellPadding = UDim2.fromOffset(0, 0),
			CellSize = UDim2.fromOffset(Frame.cellSize, Frame.cellSize),
			FillDirection = Enum.FillDirection.Horizontal,
			FillDirectionMaxCells = DAYSPERWEEK,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	}
	local LayoutOrder = 1
	
	for _, weekday in DateTimeUtilitiesModule.weekdays do
		table.insert(Elements, ReactModule.createElement(TextModule, {
			tag = "text-body-small text-align-x-center text-align-y-center",
			key = `weekday-{weekday}`,
			LayoutOrder = LayoutOrder,
			Text = weekday
		}))
		LayoutOrder += 1
	end
	for _, Frame1 in UseMemoResult do
		if Frame1.day == nil then
			table.insert(Elements, ReactModule.createElement(EmptyCell, {
				key = Frame1.key,
				cellSize = Frame.cellSize,
				LayoutOrder = Frame1.LayoutOrder
			}))
		else
			table.insert(Elements, ReactModule.createElement(RangeCalendarDayCellModule, {
				key = Frame1.key,
				cellSize = Frame.cellSize,
				day = Frame1.day,
				hoveredDate = Frame.hoveredDate,
				LayoutOrder = Frame1.LayoutOrder,
				month = Frame1.month,
				onDayActivated = Frame.onDayActivated,
				onHoverEnter = Frame.onHoverEnter,
				selectableDateRange = Frame.selectableDateRange,
				selectedDates = Frame.selectedDates,
				testId = Frame.testId,
				year = Frame1.year
			}))
		end
	end
	return ReactModule.createElement(ViewModule, {
		tag = "auto-y",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromOffset(Frame.paneWidth, 0),
		testId = `{Frame.testId}--pane-{Frame.LayoutOrder}`
	}, Elements)
end