local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeLayoutUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local DividerModule = require(Foundation.Components.Divider)
local TwoMonthCalendarHeaderModule = require(script.Parent.TwoMonthCalendarHeader)
local TwoMonthCalendarPaneModule = require(script.Parent.TwoMonthCalendarPane)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)

return function(Frame)
	-- upvalues: UseScaledValueModule (copy), DateTimeLayoutUtilitiesModule (copy), ReactModule (copy), DateTimeCalendarViewUtilitiesModule (copy), DateTimeUtilitiesModule (copy), ViewModule (copy), TwoMonthCalendarHeaderModule (copy), DividerModule (copy), TwoMonthCalendarPaneModule (copy)
	local UseScaledValueModuleResult: number = UseScaledValueModule(DateTimeLayoutUtilitiesModule.PANE_WIDTH)
	local UseScaledValueModuleResultRatio = UseScaledValueModuleResult / 7
	local UseStateResult, UseStateResult2 = ReactModule.useState(DateTimeCalendarViewUtilitiesModule.toViewDate(DateTimeCalendarViewUtilitiesModule.resolveAnchorDate(Frame.selectedDates, Frame.referenceDate)))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		return nil
	end)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy), DateTimeCalendarViewUtilitiesModule (upval)
		if Frame.viewAnchorDate then
			UseStateResult2(DateTimeCalendarViewUtilitiesModule.toViewDate(Frame.viewAnchorDate))
			
			return
		end
	end, { Frame.viewAnchorDate })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy), DateTimeCalendarViewUtilitiesModule (upval)
		if Frame.viewAnchorDate or Frame.selectedDates and Frame.selectedDates[1] then return end
		if Frame.referenceDate then
			UseStateResult2(DateTimeCalendarViewUtilitiesModule.toViewDate(Frame.referenceDate))
		end
	end, {
		Frame.viewAnchorDate,
		Frame.referenceDate,
		Frame.selectedDates
	})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult2_1 (copy)
		local SelectedDates = Frame.selectedDates
		
		if not SelectedDates or not SelectedDates[1] or SelectedDates[2] then
			UseStateResult2_1(nil)
		end
	end, { Frame.selectedDates })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local MouseLeaveConnection = Current.MouseLeave:Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(nil)
		end)
		
		return function()
			-- upvalues: MouseLeaveConnection (copy)
			MouseLeaveConnection:Disconnect()
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), DateTimeUtilitiesModule (upval)
		UseStateResult2(function(p1)
			-- upvalues: DateTimeUtilitiesModule (upval)
			local PrevMonthInfo, PrevMonthInfo2 = DateTimeUtilitiesModule.getPrevMonthInfo(p1.month, p1.year)
			
			return { month = PrevMonthInfo, year = PrevMonthInfo2 }
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), DateTimeUtilitiesModule (upval)
		UseStateResult2(function(p1)
			-- upvalues: DateTimeUtilitiesModule (upval)
			local NextMonthInfo, NextMonthInfo2 = DateTimeUtilitiesModule.getNextMonthInfo(p1.month, p1.year)
			
			return { month = NextMonthInfo, year = NextMonthInfo2 }
		end)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p1)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2_1 (copy), Frame (copy)
		UseStateResult2_1(nil)
		Frame.onDayActivated(p1)
	end, { Frame.onDayActivated })
	local NextMonthInfo, NextMonthInfo2 = DateTimeUtilitiesModule.getNextMonthInfo(UseStateResult.month, UseStateResult.year)
	
	return ReactModule.createElement(ViewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Header = ReactModule.createElement(TwoMonthCalendarHeaderModule, {
			currViewDate = UseStateResult,
			onNextMonth = UseResult1,
			onPreviousMonth = UseResult,
			secondMonth = NextMonthInfo,
			secondYear = NextMonthInfo2,
			testId = Frame.testId
		}),
		HeaderDivider = ReactModule.createElement(DividerModule, { LayoutOrder = 2 }),
		Panes = ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			tag = "row align-y-top gap-large auto-xy padding-x-large padding-y-small",
			ref = UseRefResult
		}, {
			FirstPane = ReactModule.createElement(TwoMonthCalendarPaneModule, {
				LayoutOrder = 1,
				cellSize = UseScaledValueModuleResultRatio,
				hoveredDate = UseStateResult1,
				month = UseStateResult.month,
				onDayActivated = UseResult3,
				onHoverEnter = UseResult2,
				paneWidth = UseScaledValueModuleResult,
				selectableDateRange = Frame.selectableDateRange,
				selectedDates = Frame.selectedDates,
				testId = Frame.testId,
				year = UseStateResult.year
			}),
			SecondPane = ReactModule.createElement(TwoMonthCalendarPaneModule, {
				LayoutOrder = 2,
				cellSize = UseScaledValueModuleResultRatio,
				hoveredDate = UseStateResult1,
				month = NextMonthInfo,
				onDayActivated = UseResult3,
				onHoverEnter = UseResult2,
				paneWidth = UseScaledValueModuleResult,
				selectableDateRange = Frame.selectableDateRange,
				selectedDates = Frame.selectedDates,
				testId = Frame.testId,
				year = NextMonthInfo2
			})
		})
	})
end