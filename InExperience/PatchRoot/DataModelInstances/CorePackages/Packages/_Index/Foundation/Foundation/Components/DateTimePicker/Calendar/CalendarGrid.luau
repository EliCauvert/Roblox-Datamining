local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CalendarGridDayLabelModule = require(script.Parent.CalendarGridDayLabel)
local _ = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local BuildCalendarDayConfigsFunction = require(script.Parent.Parent.Utilities.DateTimeCalendarDayConfigUtilities).buildCalendarDayConfigs
local DAYSPERWEEK = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants).DAYS_PER_WEEK
local GetDayCellAppearanceFunction = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities).getDayCellAppearance
local MemoResult = ReactModule.memo(function(Frame)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy), CalendarGridDayLabelModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local NoIsSelected: boolean = Frame.isHighlighted and not Frame.isSelected
	local IsNotBandRadiusTagMatch: boolean = Frame.bandRadiusTag ~= nil and Frame.bandRadiusTag ~= ""
	
	return ReactModule.createElement(ViewModule, { tag = "size-full", LayoutOrder = Frame.LayoutOrder }, {
		RangeFill = if NoIsSelected then ReactModule.createElement(ViewModule, {
			ZIndex = 0,
			backgroundStyle = UseTokensModuleResult.Color.ActionStandard.Background,
			tag = {
				["size-full"] = true,
				[Frame.bandRadiusTag] = IsNotBandRadiusTagMatch
			}
		}) else nil,
		Day = ReactModule.createElement(CalendarGridDayLabelModule, {
			highlight = false,
			LayoutOrder = 1,
			bandPosition = if Frame.isSelected then Frame.bandPosition else nil,
			bandRadiusTag = if Frame.isSelected then Frame.bandRadiusTag else nil,
			bandSize = if Frame.isSelected then Frame.bandSize else nil,
			emphasizeText = if Frame.applyEmphasis then Frame.isSelectable and not Frame.isSelected else nil,
			isSelectable = Frame.isSelectable,
			isSelected = Frame.isSelected,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: Frame (copy)
				Frame.handleDateActivated(Frame.day, Frame.month, Frame.year)
			end, {
				Frame.handleDateActivated,
				Frame.day,
				Frame.month,
				Frame.year
			}),
			onHoverEnter = ReactModule.useMemo(function()
				-- upvalues: Frame (copy)
				return if Frame.onHoverEnter == nil then nil else function()
					-- upvalues: Frame (upval)
					Frame.onHoverEnter(DateTime.fromLocalTime(Frame.year, Frame.month, Frame.day))
				end
			end, { Frame.onHoverEnter, Frame.year, Frame.month, Frame.day }),
			testId = Frame.testId,
			label = tostring(Frame.day)
		})
	})
end)

return {
	CalendarGrid = function(Frame)
		-- upvalues: UseTokensModule (copy), ReactModule (copy), BuildCalendarDayConfigsFunction (copy), GetDayCellAppearanceFunction (copy), DAYSPERWEEK (copy), DateTimeUtilitiesModule (copy), TextModule (copy), MemoResult (copy), ViewModule (copy)
		local None = UseTokensModule().Padding.None
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), Frame (copy)
			local Current = UseRefResult.current
			local OnHoverLeave = Frame.onHoverLeave
			
			if Current == nil or OnHoverLeave == nil then return end
			local MouseLeaveConnection = Current.MouseLeave:Connect(OnHoverLeave)
			
			return function()
				-- upvalues: MouseLeaveConnection (copy)
				MouseLeaveConnection:Disconnect()
			end
		end, { Frame.onHoverLeave })
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: BuildCalendarDayConfigsFunction (upval), Frame (copy)
			return BuildCalendarDayConfigsFunction(Frame.currViewDate)
		end, { Frame.currViewDate })
		local UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), GetDayCellAppearanceFunction (upval), Frame (copy)
			local t = {}
			
			for _, value in UseMemoResult do
				t[`{value.keyPrefix}-{value.day}`] = GetDayCellAppearanceFunction(DateTime.fromLocalTime(value.year, value.month, value.day), Frame.localSelectedDateTimes, Frame.highlightDates, Frame.isDateRange, Frame.selectableDateRange)
			end
			return t
		end, {
			UseMemoResult,
			Frame.highlightDates,
			Frame.isDateRange,
			Frame.localSelectedDateTimes,
			Frame.selectableDateRange
		})
		local Elements = {
			ReactModule.createElement("UIGridLayout", {
				key = "layout",
				CellPadding = UDim2.fromOffset(None, None),
				CellSize = UDim2.fromOffset(Frame.scaledCalendarWidth / DAYSPERWEEK, Frame.scaledCalendarWidth / DAYSPERWEEK),
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
				key = weekday,
				LayoutOrder = LayoutOrder,
				Text = weekday
			}))
			LayoutOrder += 1
		end
		for _, Frame1 in UseMemoResult do
			local Text: string = `{Frame1.keyPrefix}-{Frame1.day}`
			local UseMemoResultEntry = UseMemoResult1[Text]
			table.insert(Elements, ReactModule.createElement(MemoResult, {
				key = Text,
				applyEmphasis = Frame1.applyEmphasis,
				bandPosition = UseMemoResultEntry.bandPosition,
				bandRadiusTag = UseMemoResultEntry.bandRadiusTag,
				bandSize = UseMemoResultEntry.bandSize,
				day = Frame1.day,
				handleDateActivated = Frame.handleDateActivated,
				isHighlighted = UseMemoResultEntry.isHighlighted,
				isSelectable = UseMemoResultEntry.isSelectable,
				isSelected = UseMemoResultEntry.isSelected,
				LayoutOrder = Frame1.LayoutOrder,
				month = Frame1.month,
				onHoverEnter = Frame.onHoverEnter,
				testId = `{Frame.testId}--{Frame1.keyPrefix}-calendar-day-{Frame1.day}`,
				year = Frame1.year
			}))
		end
		return ReactModule.createElement(ViewModule, {
			tag = "size-full-0 auto-y",
			LayoutOrder = Frame.LayoutOrder,
			ref = UseRefResult,
			Size = Frame.Size,
			testId = `{Frame.testId}--weekAndDates`
		}, Elements)
	end
}