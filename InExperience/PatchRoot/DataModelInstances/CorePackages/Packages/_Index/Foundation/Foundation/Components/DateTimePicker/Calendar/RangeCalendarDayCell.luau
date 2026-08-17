local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local calendarGridDayLabelModule = require(script.Parent.CalendarGridDayLabel)
local dateTimeCalendarDayAppearanceUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0) --[[ line: 30 | named "RangeCalendarDayCell" ]]
	-- upvalues: useTokensModule (ref), dateTimeUtilitiesModule (ref), dateTimeCalendarDayAppearanceUtilitiesModule (ref), reactModule (ref), viewModule (ref), calendarGridDayLabelModule (ref)
	local var7 = useTokensModule()
	local dateTime = DateTime.fromLocalTime(p0.year, p0.month, p0.day)
	local selectedDates = p0.selectedDates or {}
	local t = {}
	
	for i, v in selectedDates do
		table.insert(t, dateTimeUtilitiesModule.toLocalTime(v))
	end
	local var11 = dateTimeCalendarDayAppearanceUtilitiesModule.resolveHighlightDates(selectedDates, p0.hoveredDate)
	local var12 = dateTimeCalendarDayAppearanceUtilitiesModule.isDaySelectable(dateTime, p0.selectableDateRange)
	local var13 = dateTimeCalendarDayAppearanceUtilitiesModule.isDaySelected(dateTime, t, true)
	local var14 = dateTimeCalendarDayAppearanceUtilitiesModule.isDayHighlighted(dateTime, var11, true)
	local rangeBand, rangeBand_1, rangeBand_2 = dateTimeCalendarDayAppearanceUtilitiesModule.getRangeBand(dateTime, var11, true, var13)
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromOffset(p0.cellSize, p0.cellSize)
	}, {
		RangeFill = if var14 and not var13 then reactModule.createElement(viewModule, {
			ZIndex = 0,
			backgroundStyle = var7.Color.ActionStandard.Background,
			tag = {
				["size-full"] = true,
				[rangeBand_2] = rangeBand_2 ~= nil and rangeBand_2 ~= ""
			}
		}) else nil,
		Day = reactModule.createElement(calendarGridDayLabelModule, {
			highlight = false,
			LayoutOrder = 1,
			bandPosition = if var13 then rangeBand else nil,
			bandRadiusTag = if var13 then rangeBand_2 else nil,
			bandSize = if var13 then rangeBand_1 else nil,
			emphasizeText = var12 and not var13,
			isSelectable = var12,
			isSelected = var13,
			label = tostring(p0.day),
			onActivated = function() --[[ line: 86 ]]
				-- upvalues: p0 (ref), dateTime (ref)
				p0.onDayActivated(dateTime)
			end,
			onHoverEnter = reactModule.useMemo(function() --[[ line: 48 ]]
				-- upvalues: p0 (ref), dateTime (ref)
				return if p0.onHoverEnter == nil then nil else function() --[[ line: 52 ]]
					-- upvalues: p0 (copy), dateTime (copy)
					p0.onHoverEnter(dateTime)
				end
			end, { p0.onHoverEnter, dateTime }),
			testId = `{p0.testId}--day-{p0.year}-{p0.month}-{p0.day}`
		})
	})
end