local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeLayoutUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local dividerModule = require(foundation.Components.Divider)
local twoMonthCalendarHeaderModule = require(script.Parent.TwoMonthCalendarHeader)
local twoMonthCalendarPaneModule = require(script.Parent.TwoMonthCalendarPane)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)

return function(p0) --[[ line: 26 | named "TwoMonthCalendar" ]]
	-- upvalues: useScaledValueModule (ref), dateTimeLayoutUtilitiesModule (ref), reactModule (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), viewModule (ref), twoMonthCalendarHeaderModule (ref), dividerModule (ref), twoMonthCalendarPaneModule (ref)
	local var10 = useScaledValueModule(dateTimeLayoutUtilitiesModule.PANE_WIDTH)
	local var11 = var10 / 7
	local var12, var13 = reactModule.useState(dateTimeCalendarViewUtilitiesModule.toViewDate(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p0.selectedDates, p0.referenceDate)))
	local var14, var15 = reactModule.useState(function() --[[ line: 36 ]]
		return nil
	end)
	local var16 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: p0 (ref), var13 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		if p0.viewAnchorDate then
			var13(dateTimeCalendarViewUtilitiesModule.toViewDate(p0.viewAnchorDate))
			
			return
		end
	end, { p0.viewAnchorDate })
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: p0 (ref), var13 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		if p0.viewAnchorDate or p0.selectedDates and p0.selectedDates[1] then return end
		if p0.referenceDate then
			var13(dateTimeCalendarViewUtilitiesModule.toViewDate(p0.referenceDate))
		end
	end, { p0.viewAnchorDate, p0.referenceDate, p0.selectedDates })
	reactModule.useEffect(function() --[[ line: 62 ]]
		-- upvalues: p0 (ref), var15 (ref)
		local selectedDates = p0.selectedDates
		
		if not selectedDates or not selectedDates[1] or selectedDates[2] then
			var15(nil)
		end
	end, { p0.selectedDates })
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: var16 (ref), var15 (ref)
		local current = var16.current
		
		if current == nil then
			return
		end
		local mouseLeaveConnection = current.MouseLeave:Connect(function() --[[ line: 75 ]]
			-- upvalues: var15 (copy)
			var15(nil)
		end)
		
		return function() --[[ line: 78 ]]
			-- upvalues: mouseLeaveConnection (ref)
			mouseLeaveConnection:Disconnect()
		end
	end, {})
	local var17 = reactModule.useCallback(function() --[[ line: 83 ]]
		-- upvalues: var13 (ref), dateTimeUtilitiesModule (copy)
		var13(function(p1) --[[ line: 84 ]]
			-- upvalues: dateTimeUtilitiesModule (copy)
			local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(p1.month, p1.year)
			
			return { month = prevMonthInfo, year = prevMonthInfo_1 }
		end)
	end, {})
	local var18 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: var13 (ref), dateTimeUtilitiesModule (copy)
		var13(function(p2) --[[ line: 91 ]]
			-- upvalues: dateTimeUtilitiesModule (copy)
			local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(p2.month, p2.year)
			
			return { month = nextMonthInfo, year = nextMonthInfo_1 }
		end)
	end, {})
	local var19 = reactModule.useCallback(function(p3) --[[ line: 97 ]]
		-- upvalues: var15 (ref)
		var15(p3)
	end, {})
	local var20 = reactModule.useCallback(function(p4) --[[ line: 101 ]]
		-- upvalues: var15 (ref), p0 (ref)
		var15(nil)
		p0.onDayActivated(p4)
	end, { p0.onDayActivated })
	local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var12.month, var12.year)
	
	return reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId
	}, {
		Header = reactModule.createElement(twoMonthCalendarHeaderModule, {
			currViewDate = var12,
			onNextMonth = var18,
			onPreviousMonth = var17,
			secondMonth = nextMonthInfo,
			secondYear = nextMonthInfo_1,
			testId = p0.testId
		}),
		HeaderDivider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
		Panes = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			tag = "row align-y-top gap-large auto-xy padding-x-large padding-y-small",
			ref = var16
		}, {
			FirstPane = reactModule.createElement(twoMonthCalendarPaneModule, {
				LayoutOrder = 1,
				cellSize = var11,
				hoveredDate = var14,
				month = var12.month,
				onDayActivated = var20,
				onHoverEnter = var19,
				paneWidth = var10,
				selectableDateRange = p0.selectableDateRange,
				selectedDates = p0.selectedDates,
				testId = p0.testId,
				year = var12.year
			}),
			SecondPane = reactModule.createElement(twoMonthCalendarPaneModule, {
				LayoutOrder = 2,
				cellSize = var11,
				hoveredDate = var14,
				month = nextMonthInfo,
				onDayActivated = var20,
				onHoverEnter = var19,
				paneWidth = var10,
				selectableDateRange = p0.selectableDateRange,
				selectedDates = p0.selectedDates,
				testId = p0.testId,
				year = nextMonthInfo_1
			})
		})
	})
end