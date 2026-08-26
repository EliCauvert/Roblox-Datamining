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

return function(p1)
	-- upvalues: useScaledValueModule (ref), dateTimeLayoutUtilitiesModule (ref), reactModule (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), viewModule (ref), twoMonthCalendarHeaderModule (ref), dividerModule (ref), twoMonthCalendarPaneModule (ref)
	local var1 = useScaledValueModule(dateTimeLayoutUtilitiesModule.PANE_WIDTH)
	local var2 = var1 / 7
	local var3, var4 = reactModule.useState(dateTimeCalendarViewUtilitiesModule.toViewDate(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p1.selectedDates, p1.referenceDate)))
	local var5, var6 = reactModule.useState(function()
		return nil
	end)
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		if p1.viewAnchorDate then
			var4(dateTimeCalendarViewUtilitiesModule.toViewDate(p1.viewAnchorDate))
			
			return
		end
	end, { p1.viewAnchorDate })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		if p1.viewAnchorDate or p1.selectedDates and p1.selectedDates[1] then return end
		if p1.referenceDate then
			var4(dateTimeCalendarViewUtilitiesModule.toViewDate(p1.referenceDate))
		end
	end, { p1.viewAnchorDate, p1.referenceDate, p1.selectedDates })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref)
		local selectedDates = p1.selectedDates
		
		if not selectedDates or not selectedDates[1] or selectedDates[2] then
			var6(nil)
		end
	end, { p1.selectedDates })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var6 (ref)
		local current = var7.current
		
		if current == nil then
			return
		end
		local mouseLeaveConnection = current.MouseLeave:Connect(function()
			-- upvalues: var6 (copy)
			var6(nil)
		end)
		
		return function()
			-- upvalues: mouseLeaveConnection (ref)
			mouseLeaveConnection:Disconnect()
		end
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), dateTimeUtilitiesModule (copy)
		var4(function(p2)
			-- upvalues: dateTimeUtilitiesModule (copy)
			local prevMonthInfo, prevMonthInfo_1 = dateTimeUtilitiesModule.getPrevMonthInfo(p2.month, p2.year)
			
			return { month = prevMonthInfo, year = prevMonthInfo_1 }
		end)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), dateTimeUtilitiesModule (copy)
		var4(function(p2)
			-- upvalues: dateTimeUtilitiesModule (copy)
			local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(p2.month, p2.year)
			
			return { month = nextMonthInfo, year = nextMonthInfo_1 }
		end)
	end, {})
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2)
	end, {})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), p1 (ref)
		var6(nil)
		p1.onDayActivated(p2)
	end, { p1.onDayActivated })
	local nextMonthInfo, nextMonthInfo_1 = dateTimeUtilitiesModule.getNextMonthInfo(var3.month, var3.year)
	
	return reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Header = reactModule.createElement(twoMonthCalendarHeaderModule, {
			currViewDate = var3,
			onNextMonth = var9,
			onPreviousMonth = var8,
			secondMonth = nextMonthInfo,
			secondYear = nextMonthInfo_1,
			testId = p1.testId
		}),
		HeaderDivider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
		Panes = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			tag = "row align-y-top gap-large auto-xy padding-x-large padding-y-small",
			ref = var7
		}, {
			FirstPane = reactModule.createElement(twoMonthCalendarPaneModule, {
				LayoutOrder = 1,
				cellSize = var2,
				hoveredDate = var5,
				month = var3.month,
				onDayActivated = var11,
				onHoverEnter = var10,
				paneWidth = var1,
				selectableDateRange = p1.selectableDateRange,
				selectedDates = p1.selectedDates,
				testId = p1.testId,
				year = var3.year
			}),
			SecondPane = reactModule.createElement(twoMonthCalendarPaneModule, {
				LayoutOrder = 2,
				cellSize = var2,
				hoveredDate = var5,
				month = nextMonthInfo,
				onDayActivated = var11,
				onHoverEnter = var10,
				paneWidth = var1,
				selectableDateRange = p1.selectableDateRange,
				selectedDates = p1.selectedDates,
				testId = p1.testId,
				year = nextMonthInfo_1
			})
		})
	})
end