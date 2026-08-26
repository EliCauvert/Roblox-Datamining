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
local var1 = reactModule.memo(function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), calendarGridDayLabelModule (ref)
	return reactModule.createElement(viewModule, { tag = "size-full", LayoutOrder = p1.LayoutOrder }, {
		RangeFill = if p1.isHighlighted and not p1.isSelected then reactModule.createElement(viewModule, {
			ZIndex = 0,
			backgroundStyle = useTokensModule().Color.ActionStandard.Background,
			tag = {
				["size-full"] = true,
				[p1.bandRadiusTag] = p1.bandRadiusTag ~= nil and p1.bandRadiusTag ~= ""
			}
		}) else nil,
		Day = reactModule.createElement(calendarGridDayLabelModule, {
			highlight = false,
			LayoutOrder = 1,
			bandPosition = if p1.isSelected then p1.bandPosition else nil,
			bandRadiusTag = if p1.isSelected then p1.bandRadiusTag else nil,
			bandSize = if p1.isSelected then p1.bandSize else nil,
			emphasizeText = if p1.applyEmphasis then p1.isSelectable and not p1.isSelected else nil,
			isSelectable = p1.isSelectable,
			isSelected = p1.isSelected,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref)
				p1.handleDateActivated(p1.day, p1.month, p1.year)
			end, { p1.handleDateActivated, p1.day, p1.month, p1.year }),
			onHoverEnter = reactModule.useMemo(function()
				-- upvalues: p1 (ref)
				return if p1.onHoverEnter == nil then nil else function()
					-- upvalues: p1 (copy)
					p1.onHoverEnter(DateTime.fromLocalTime(p1.year, p1.month, p1.day))
				end
			end, { p1.onHoverEnter, p1.year, p1.month, p1.day }),
			testId = p1.testId,
			label = tostring(p1.day)
		})
	})
end)

return {
	CalendarGrid = function(p1)
		-- upvalues: useTokensModule (ref), reactModule (ref), buildCalendarDayConfigs (ref), getDayCellAppearance (ref), DAYS_PER_WEEK (ref), dateTimeUtilitiesModule (ref), textModule (ref), var1 (ref), viewModule (ref)
		local none = useTokensModule().Padding.None
		local var2 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), p1 (ref)
			local current = var2.current
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
		local var3 = reactModule.useMemo(function()
			-- upvalues: buildCalendarDayConfigs (copy), p1 (ref)
			return buildCalendarDayConfigs(p1.currViewDate)
		end, { p1.currViewDate })
		local var4 = reactModule.useMemo(function()
			-- upvalues: var3 (ref), getDayCellAppearance (copy), p1 (ref)
			local t = {}
			
			for i, v in var3 do
				t[`{v.keyPrefix}-{v.day}`] = getDayCellAppearance(DateTime.fromLocalTime(v.year, v.month, v.day), p1.localSelectedDateTimes, p1.highlightDates, p1.isDateRange, p1.selectableDateRange)
			end
			return t
		end, {
			var3,
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
		local var5 = 1
		
		for i, v in dateTimeUtilitiesModule.weekdays do
			table.insert(list, reactModule.createElement(textModule, {
				tag = "text-body-small text-align-x-center text-align-y-center",
				key = v,
				LayoutOrder = var5,
				Text = v
			}))
			var5 += 1
		end
		for i, v_1 in var3 do
			local keyPrefix = `{v_1.keyPrefix}-{v_1.day}`
			local var6 = var4[keyPrefix]
			table.insert(list, reactModule.createElement(var5, {
				key = keyPrefix,
				applyEmphasis = v_1.applyEmphasis,
				bandPosition = var6.bandPosition,
				bandRadiusTag = var6.bandRadiusTag,
				bandSize = var6.bandSize,
				day = v_1.day,
				handleDateActivated = p1.handleDateActivated,
				isHighlighted = var6.isHighlighted,
				isSelectable = var6.isSelectable,
				isSelected = var6.isSelected,
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
			ref = var5,
			Size = p1.Size,
			testId = `{p1.testId}--weekAndDates`
		}, list)
	end
}