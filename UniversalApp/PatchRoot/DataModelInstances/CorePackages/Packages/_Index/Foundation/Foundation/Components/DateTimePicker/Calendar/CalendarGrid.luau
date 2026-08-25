local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local calendarGridDayLabelModule = require(script.Parent.CalendarGridDayLabel)
local dateTimeCalendarConstantsModule = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants)
local dateTimeCalendarDayAppearanceUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local dateTimeCalendarDayConfigUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarDayConfigUtilities)
local _ = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local buildCalendarDayConfigs = dateTimeCalendarDayConfigUtilitiesModule.buildCalendarDayConfigs
local DAYS_PER_WEEK = dateTimeCalendarConstantsModule.DAYS_PER_WEEK
local getDayCellAppearance = dateTimeCalendarDayAppearanceUtilitiesModule.getDayCellAppearance
local var10 = reactModule.memo(function(p0)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), calendarGridDayLabelModule (ref)
	return reactModule.createElement(viewModule, { tag = "size-full", LayoutOrder = p0.LayoutOrder }, {
		RangeFill = if p0.isHighlighted and not p0.isSelected then reactModule.createElement(viewModule, {
			ZIndex = 0,
			backgroundStyle = useTokensModule().Color.ActionStandard.Background,
			tag = {
				["size-full"] = true,
				[p0.bandRadiusTag] = p0.bandRadiusTag ~= nil and p0.bandRadiusTag ~= ""
			}
		}) else nil,
		Day = reactModule.createElement(calendarGridDayLabelModule, {
			highlight = false,
			LayoutOrder = 1,
			bandPosition = if p0.isSelected then p0.bandPosition else nil,
			bandRadiusTag = if p0.isSelected then p0.bandRadiusTag else nil,
			bandSize = if p0.isSelected then p0.bandSize else nil,
			emphasizeText = if p0.applyEmphasis then p0.isSelectable and not p0.isSelected else nil,
			isSelectable = p0.isSelectable,
			isSelected = p0.isSelected,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p0 (ref)
				p0.handleDateActivated(p0.day, p0.month, p0.year)
			end, { p0.handleDateActivated, p0.day, p0.month, p0.year }),
			onHoverEnter = reactModule.useMemo(function()
				-- upvalues: p0 (ref)
				return if p0.onHoverEnter == nil then nil else function()
					-- upvalues: p0 (copy)
					p0.onHoverEnter(DateTime.fromLocalTime(p0.year, p0.month, p0.day))
				end
			end, { p0.onHoverEnter, p0.year, p0.month, p0.day }),
			testId = p0.testId,
			label = tostring(p0.day)
		})
	})
end)

return {
	CalendarGrid = function(p1)
		-- upvalues: useTokensModule (ref), reactModule (ref), buildCalendarDayConfigs (ref), getDayCellAppearance (ref), DAYS_PER_WEEK (ref), dateTimeUtilitiesModule (ref), textModule (ref), var10 (ref), viewModule (ref)
		local none = useTokensModule().Padding.None
		local var11 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), p1 (ref)
			local current = var11.current
			local onHoverLeave = p1.onHoverLeave
			
			if current == nil or onHoverLeave == nil then
				return
			end
			local mouseLeaveConnection = current.MouseLeave:Connect(onHoverLeave)
			
			return function()
				-- upvalues: mouseLeaveConnection (ref)
				mouseLeaveConnection:Disconnect()
			end
		end, { p1.onHoverLeave })
		local var12 = reactModule.useMemo(function()
			-- upvalues: buildCalendarDayConfigs (copy), p1 (ref)
			return buildCalendarDayConfigs(p1.currViewDate)
		end, { p1.currViewDate })
		local var13 = reactModule.useMemo(function()
			-- upvalues: var12 (ref), getDayCellAppearance (copy), p1 (ref)
			local t = {}
			
			for i, v in var12 do
				t[`{v.keyPrefix}-{v.day}`] = getDayCellAppearance(DateTime.fromLocalTime(v.year, v.month, v.day), p1.localSelectedDateTimes, p1.highlightDates, p1.isDateRange, p1.selectableDateRange)
			end
			return t
		end, {
			var12,
			p1.highlightDates,
			p1.isDateRange,
			p1.localSelectedDateTimes,
			p1.selectableDateRange
		})
		local list = {
			reactModule.createElement("UIGridLayout", {
				key = "layout",
				CellPadding = UDim2.fromOffset(none, none),
				CellSize = UDim2.fromOffset(p1.scaledCalendarWidth / DAYS_PER_WEEK, p1.scaledCalendarWidth / DAYS_PER_WEEK),
				FillDirection = Enum.FillDirection.Horizontal,
				FillDirectionMaxCells = DAYS_PER_WEEK,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		local var15 = 1
		
		for i, v in dateTimeUtilitiesModule.weekdays do
			table.insert(list, reactModule.createElement(textModule, {
				tag = "text-body-small text-align-x-center text-align-y-center",
				key = v,
				LayoutOrder = var15,
				Text = v
			}))
			var15 += 1
		end
		for i, v_1 in var12 do
			local keyPrefix = `{v_1.keyPrefix}-{v_1.day}`
			local var17 = var13[keyPrefix]
			table.insert(list, reactModule.createElement(var10, {
				key = keyPrefix,
				applyEmphasis = v_1.applyEmphasis,
				bandPosition = var17.bandPosition,
				bandRadiusTag = var17.bandRadiusTag,
				bandSize = var17.bandSize,
				day = v_1.day,
				handleDateActivated = p1.handleDateActivated,
				isHighlighted = var17.isHighlighted,
				isSelectable = var17.isSelectable,
				isSelected = var17.isSelected,
				LayoutOrder = v_1.LayoutOrder,
				month = v_1.month,
				onHoverEnter = p1.onHoverEnter,
				testId = `{p1.testId}--{v_1.keyPrefix}-calendar-day-{v_1.day}`,
				year = v_1.year
			}))
		end
		return reactModule.createElement(viewModule, {
			tag = "size-full-0 auto-y",
			LayoutOrder = p1.LayoutOrder,
			ref = var11,
			Size = p1.Size,
			testId = `{p1.testId}--weekAndDates`
		}, list)
	end
}