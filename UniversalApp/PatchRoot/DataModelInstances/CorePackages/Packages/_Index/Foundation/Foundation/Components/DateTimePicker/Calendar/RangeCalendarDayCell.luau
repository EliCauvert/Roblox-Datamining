local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CalendarGridDayLabelModule = require(script.Parent.CalendarGridDayLabel)
local DateTimeCalendarDayAppearanceUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(Frame) --[[ Line: 30 | Named "RangeCalendarDayCell" ]]
	-- upvalues: UseTokensModule (copy), DateTimeUtilitiesModule (copy), DateTimeCalendarDayAppearanceUtilitiesModule (copy), ReactModule (copy), ViewModule (copy), CalendarGridDayLabelModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local _DateTime = DateTime.fromLocalTime(Frame.year, Frame.month, Frame.day)
	local SelectedDates = Frame.selectedDates or {}
	local List = {}
	
	for _, selectedDate in SelectedDates do
		table.insert(List, DateTimeUtilitiesModule.toLocalTime(selectedDate))
	end
	local ResolveHighlightDatesResult = DateTimeCalendarDayAppearanceUtilitiesModule.resolveHighlightDates(SelectedDates, Frame.hoveredDate)
	local IsDaySelectable = DateTimeCalendarDayAppearanceUtilitiesModule.isDaySelectable(_DateTime, Frame.selectableDateRange)
	local IsDaySelected = DateTimeCalendarDayAppearanceUtilitiesModule.isDaySelected(_DateTime, List, true)
	local IsDayHighlighted = DateTimeCalendarDayAppearanceUtilitiesModule.isDayHighlighted(_DateTime, ResolveHighlightDatesResult, true)
	local RangeBand, RangeBand2, RangeBand3 = DateTimeCalendarDayAppearanceUtilitiesModule.getRangeBand(_DateTime, ResolveHighlightDatesResult, true, IsDaySelected)
	local NoIsDaySelected: boolean = IsDayHighlighted and not IsDaySelected
	local IsNotRangeBandMatch: boolean = RangeBand3 ~= nil and RangeBand3 ~= ""
	
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromOffset(Frame.cellSize, Frame.cellSize)
	}, {
		RangeFill = if NoIsDaySelected then ReactModule.createElement(ViewModule, {
			ZIndex = 0,
			backgroundStyle = UseTokensModuleResult.Color.ActionStandard.Background,
			tag = { ["size-full"] = true, [RangeBand3] = IsNotRangeBandMatch }
		}) else nil,
		Day = ReactModule.createElement(CalendarGridDayLabelModule, {
			highlight = false,
			LayoutOrder = 1,
			bandPosition = if IsDaySelected then RangeBand else nil,
			bandRadiusTag = if IsDaySelected then RangeBand3 else nil,
			bandSize = if IsDaySelected then RangeBand2 else nil,
			emphasizeText = IsDaySelectable and not IsDaySelected,
			isSelectable = IsDaySelectable,
			isSelected = IsDaySelected,
			label = tostring(Frame.day),
			onActivated = function() --[[ Line: 86 ]]
				-- upvalues: Frame (copy), _DateTime (copy)
				Frame.onDayActivated(_DateTime)
			end,
			onHoverEnter = ReactModule.useMemo(function() --[[ Line: 48 ]]
				-- upvalues: Frame (copy), _DateTime (copy)
				return if Frame.onHoverEnter == nil then nil else function() --[[ Line: 52 ]]
					-- upvalues: Frame (upval), _DateTime (upval)
					Frame.onHoverEnter(_DateTime)
				end
			end, { Frame.onHoverEnter, _DateTime }),
			testId = `{Frame.testId}--day-{Frame.year}-{Frame.month}-{Frame.day}`
		})
	})
end