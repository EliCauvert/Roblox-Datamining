local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimeCalendarViewUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeLayoutUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local TextModule = require(Foundation.Components.Text)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { testId = "--foundation-time-list" }

return function(p1) --[[ Line: 34 | Named "TimeList" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), DateTimeLayoutUtilitiesModule (copy), ReactModule (copy), DateTimeCalendarViewUtilitiesModule (copy), DateTimeUtilitiesModule (copy), TextModule (copy), StateLayerModeModule (copy), ScrollViewModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local Size900 = UseTokensModuleResult.Size.Size_900
	local Width = WithDefaultsModuleResult.width or UDim.new(0, DateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(true)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 45 ]]
		-- upvalues: WithDefaultsModuleResult (copy), DateTimeCalendarViewUtilitiesModule (upval)
		return DateTimeCalendarViewUtilitiesModule.getTimeSlotsForDay(WithDefaultsModuleResult.dateTime or (WithDefaultsModuleResult.dayAnchor or DateTime.now()))
	end, {
		WithDefaultsModuleResult.dateTime,
		WithDefaultsModuleResult.dayAnchor
	})
	local UseMemoResult1 = if WithDefaultsModuleResult.dateTime then UseMemoResult2 else nil
	
	local function _(p2): string? --[[ Line: 52 | Named "getTimeKey" ]]
		-- upvalues: DateTimeUtilitiesModule (upval)
		if p2 == nil then
			return nil
		else
			local LocalTime = DateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(p2))
			
			return string.format("%02d:%02d", LocalTime.Hour, LocalTime.Minute)
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 63 ]]
		-- upvalues: UseMemoResult1 (copy), DateTimeUtilitiesModule (upval), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult (copy), DateTimeCalendarViewUtilitiesModule (upval), UseMemoResult (copy), Size900 (copy), WithDefaultsModuleResult (copy)
		local Current = nil
		if UseMemoResult1 == nil then
			Current = nil
		else
			local LocalTime = DateTimeUtilitiesModule.toLocalTime(DateTime.fromUnixTimestamp(UseMemoResult1))
			Current = string.format("%02d:%02d", LocalTime.Hour, LocalTime.Minute)
		end
		if UseRefResult1.current then
			UseRefResult1.current = false
			UseRefResult3.current = Current
			UseRefResult2.current = false
			
			return
		end
		local Current1 = UseRefResult.current
		
		if not Current1 then return end
		local Current2 = UseRefResult2.current
		UseRefResult2.current = false
		
		if Current == nil then
			UseRefResult3.current = nil
			
			return
		end
		if Current == UseRefResult3.current then return end
		if not Current2 and UseRefResult3.current == nil then
			UseRefResult3.current = Current
			
			return
		end
		UseRefResult3.current = Current
		local TimeSlotIndex: number = DateTimeCalendarViewUtilitiesModule.getTimeSlotIndex(UseMemoResult, UseMemoResult1)
		
		if TimeSlotIndex then
			Current1.CanvasPosition = Vector2.new(0, (math.max(0, (TimeSlotIndex - 1) * Size900 - WithDefaultsModuleResult.height / 2 + Size900 / 2)))
			
			return
		end
	end, {
		UseMemoResult1,
		UseMemoResult,
		Size900,
		WithDefaultsModuleResult.height
	})
	local Elements = {}
	
	for LayoutOrder, value in UseMemoResult do
		local IsIdMatch = value.id == UseMemoResult1
		Elements[`slot-{value.id}`] = ReactModule.createElement(TextModule, {
			tag = "size-full-0 auto-y padding-x-medium text-body-medium text-align-x-left text-align-y-center radius-medium",
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, Size900),
			Text = value.text,
			textStyle = if IsIdMatch then UseTokensModuleResult.Inverse.Content.Emphasis else nil,
			backgroundStyle = if IsIdMatch then UseTokensModuleResult.Color.System.Contrast else nil,
			stateLayer = {
				mode = if IsIdMatch then StateLayerModeModule.Inverse else StateLayerModeModule.Default
			},
			onActivated = function() --[[ Line: 120 ]]
				-- upvalues: UseRefResult1 (copy), WithDefaultsModuleResult (copy), value (copy)
				UseRefResult1.current = true
				WithDefaultsModuleResult.onItemChanged(value.id)
			end,
			testId = `{WithDefaultsModuleResult.testId}--slot-{LayoutOrder}`
		})
	end
	return ReactModule.createElement(ScrollViewModule, {
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		Size = UDim2.new(Width.Scale, Width.Offset, 0, WithDefaultsModuleResult.height),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		scrollingFrameRef = UseRefResult,
		testId = WithDefaultsModuleResult.testId
	}, Elements)
end