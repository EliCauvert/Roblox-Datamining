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

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), dateTimeLayoutUtilitiesModule (ref), reactModule (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), textModule (ref), stateLayerModeModule (ref), scrollViewModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local size900 = var2.Size.Size_900
	local width = var1.width or UDim.new(0, dateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(true)
	local var6 = reactModule.useRef(nil)
	local var7, var8 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), dateTimeCalendarViewUtilitiesModule (copy)
		return dateTimeCalendarViewUtilitiesModule.getTimeSlotsForDay(var1.dateTime or (var1.dayAnchor or DateTime.now()))
	end, { var1.dateTime, var1.dayAnchor })
	local var9 = if var1.dateTime then var8 else nil
	
	local function _(p2)
		-- upvalues: dateTimeUtilitiesModule (copy)
		if p2 == nil then
			return nil
		end
		local var10 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(p2))
		
		return string.format("%02d:%02d", var10.Hour, var10.Minute)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), dateTimeUtilitiesModule (copy), var4 (ref), var6 (ref), var5 (ref), var3 (ref), dateTimeCalendarViewUtilitiesModule (copy), var7 (ref), size900 (ref), var1 (ref)
		local formattedText
		if var9 == nil then
			formattedText = nil
		else
			local var10 = dateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(var9))
			formattedText = string.format("%02d:%02d", var10.Hour, var10.Minute)
		end
		if var4.current then
			var4.current = false
			var6.current = formattedText
			var5.current = false
			
			return
		end
		local current = var3.current
		
		if not current then return end
		local current_1 = var5.current
		var5.current = false
		
		if formattedText == nil then
			var6.current = nil
			
			return
		elseif formattedText == var6.current then return end
		if not current_1 and var6.current == nil then
			var6.current = formattedText
			
			return
		end
		var6.current = formattedText
		local timeSlotIndex = dateTimeCalendarViewUtilitiesModule.getTimeSlotIndex(var7, var9)
		
		if timeSlotIndex then
			current.CanvasPosition = Vector2.new(0, math.max(0, (timeSlotIndex - 1) * size900 - var1.height / 2 + size900 / 2))
			
			return
		end
	end, { var9, var7, size900, var1.height })
	local t_1 = {}
	
	for i, v in var7 do
		local var10 = v.id == var9
		t_1[`slot-{v.id}`] = reactModule.createElement(textModule, {
			tag = "size-full-0 auto-y padding-x-medium text-body-medium text-align-x-left text-align-y-center radius-medium",
			LayoutOrder = i,
			Size = UDim2.new(1, 0, 0, size900),
			Text = v.text,
			textStyle = if var10 then var2.Inverse.Content.Emphasis else nil,
			backgroundStyle = if var10 then var2.Color.System.Contrast else nil,
			stateLayer = {
				mode = if var10 then stateLayerModeModule.Inverse else stateLayerModeModule.Default
			},
			onActivated = function()
				-- upvalues: var4 (ref), var1 (ref), v (ref)
				var4.current = true
				var1.onItemChanged(v.id)
			end,
			testId = `{var1.testId}--slot-{i}`
		})
	end
	return reactModule.createElement(scrollViewModule, {
		LayoutOrder = var1.LayoutOrder,
		Size = UDim2.new(width.Scale, width.Offset, 0, var1.height),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		scrollingFrameRef = var3,
		testId = var1.testId
	}, t_1)
end