local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeLayoutUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local scrollViewModule = require(foundation.Components.ScrollView)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local textModule = require(foundation.Components.Text)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { testId = "--foundation-time-list" }

return function(p0)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), dateTimeLayoutUtilitiesModule (ref), reactModule (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), textModule (ref), stateLayerModeModule (ref), scrollViewModule (ref)
	local var11 = withDefaultsModule(p0, t)
	local var12 = useTokensModule()
	local size900 = var12.Size.Size_900
	local width = var11.width or UDim.new(0, dateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useRef(true)
	local var17 = reactModule.useRef(nil)
	local var18, var19 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		return dateTimeCalendarViewUtilitiesModule.getTimeSlotsForDay(var11.dateTime or (var11.dayAnchor or DateTime.now()))
	end, { var11.dateTime, var11.dayAnchor })
	local var20 = if var11.dateTime then var19 else nil
	
	local function _(p1)
		-- upvalues: dateTimeUtilitiesModule (copy)
		if p1 == nil then
			return nil
		end
		local var23 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(p1))
		
		return string.format("%02d:%02d", var23.Hour, var23.Minute)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), dateTimeUtilitiesModule (copy), var15 (ref), var17 (ref), var16 (ref), var14 (ref), dateTimeCalendarViewUtilitiesModule (copy), var18 (ref), size900 (ref), var11 (ref)
		local formattedText
		if var20 == nil then
			formattedText = nil
		else
			local var25 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(var20))
			formattedText = string.format("%02d:%02d", var25.Hour, var25.Minute)
		end
		if var15.current then
			var15.current = false
			var17.current = formattedText
			var16.current = false
			
			return
		end
		local current = var14.current
		
		if not current then return end
		local current_1 = var16.current
		var16.current = false
		
		if formattedText == nil then
			var17.current = nil
			
			return
		elseif formattedText == var17.current then return end
		if not current_1 and var17.current == nil then
			var17.current = formattedText
			
			return
		end
		var17.current = formattedText
		local timeSlotIndex = dateTimeCalendarViewUtilitiesModule.getTimeSlotIndex(var18, var20)
		
		if timeSlotIndex then
			current.CanvasPosition = Vector2.new(0, math.max(0, (timeSlotIndex - 1) * size900 - var11.height / 2 + size900 / 2))
			
			return
		end
	end, { var20, var18, size900, var11.height })
	local t_1 = {}
	
	for i, v in var18 do
		local var22 = v.id == var20
		t_1[`slot-{v.id}`] = reactModule.createElement(textModule, {
			tag = "size-full-0 auto-y padding-x-medium text-body-medium text-align-x-left text-align-y-center radius-medium",
			LayoutOrder = i,
			Size = UDim2.new(1, 0, 0, size900),
			Text = v.text,
			textStyle = if var22 then var12.Inverse.Content.Emphasis else nil,
			backgroundStyle = if var22 then var12.Color.System.Contrast else nil,
			stateLayer = {
				mode = if var22 then stateLayerModeModule.Inverse else stateLayerModeModule.Default
			},
			onActivated = function()
				-- upvalues: var15 (ref), var11 (ref), v (ref)
				var15.current = true
				var11.onItemChanged(v.id)
			end,
			testId = `{var11.testId}--slot-{i}`
		})
	end
	return reactModule.createElement(scrollViewModule, {
		LayoutOrder = var11.LayoutOrder,
		Size = UDim2.new(width.Scale, width.Offset, 0, var11.height),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		scrollingFrameRef = var14,
		testId = var11.testId
	}, t_1)
end