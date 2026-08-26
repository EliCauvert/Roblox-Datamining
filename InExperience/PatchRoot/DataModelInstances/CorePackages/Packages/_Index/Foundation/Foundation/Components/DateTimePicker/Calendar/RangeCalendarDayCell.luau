local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local calendarGridDayLabelModule = require(script.Parent.CalendarGridDayLabel)
local dateTimeCalendarDayAppearanceUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: useTokensModule (ref), dateTimeUtilitiesModule (ref), dateTimeCalendarDayAppearanceUtilitiesModule (ref), reactModule (ref), viewModule (ref), calendarGridDayLabelModule (ref)
	local var1 = useTokensModule()
	local dateTime = DateTime.fromLocalTime(p1.year, p1.month, p1.day)
	local selectedDates = p1.selectedDates or {}
	local t = {}
	
	for i, v in selectedDates do
		table.insert(t, dateTimeUtilitiesModule.toLocalTime(v))
	end
	local var2 = dateTimeCalendarDayAppearanceUtilitiesModule.resolveHighlightDates(selectedDates, p1.hoveredDate)
	local var3 = dateTimeCalendarDayAppearanceUtilitiesModule.isDaySelectable(dateTime, p1.selectableDateRange)
	local var4 = dateTimeCalendarDayAppearanceUtilitiesModule.isDaySelected(dateTime, t, true)
	local var5 = dateTimeCalendarDayAppearanceUtilitiesModule.isDayHighlighted(dateTime, var2, true)
	local rangeBand, rangeBand_1, rangeBand_2 = dateTimeCalendarDayAppearanceUtilitiesModule.getRangeBand(dateTime, var2, true, var4)
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromOffset(p1.cellSize, p1.cellSize)
	}, {
		RangeFill = if var5 and not var4 then reactModule.createElement(viewModule, {
			ZIndex = 0,
			backgroundStyle = var1.Color.ActionStandard.Background,
			tag = {
				["size-full"] = true,
				[rangeBand_2] = rangeBand_2 ~= nil and rangeBand_2 ~= ""
			}
		}) else nil,
		Day = reactModule.createElement(calendarGridDayLabelModule, {
			highlight = false,
			LayoutOrder = 1,
			bandPosition = if var4 then rangeBand else nil,
			bandRadiusTag = if var4 then rangeBand_2 else nil,
			bandSize = if var4 then rangeBand_1 else nil,
			emphasizeText = var3 and not var4,
			isSelectable = var3,
			isSelected = var4,
			label = tostring(p1.day),
			onActivated = function()
				-- upvalues: p1 (ref), dateTime (ref)
				p1.onDayActivated(dateTime)
			end,
			onHoverEnter = reactModule.useMemo(function()
				-- upvalues: p1 (ref), dateTime (ref)
				return if p1.onHoverEnter == nil then nil else function()
					-- upvalues: p1 (copy), dateTime (copy)
					p1.onHoverEnter(dateTime)
				end
			end, { p1.onHoverEnter, dateTime }),
			testId = `{p1.testId}--day-{p0.year}-{p0.month}-{p0.day}`
		})
	})
end