local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.chatTypes)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local TurnDisplayModule = require(BuildExperience.Chat.turnDisplay)
local Icon = FoundationModule.Icon
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local t = {}

local function constantSource(): number
	return 0
end

local function useReactiveValue(Callback)
	-- upvalues: ReactModule (copy), constantSource (copy), SignalsReactModule (copy)
	return (SignalsReactModule.useSignalState((ReactModule.useCallback(function(Callback1: (any) -> ())
		-- upvalues: Callback (copy), constantSource (upval)
		if typeof(Callback) == "function" then
			return (Callback(Callback1))
		end
		if typeof(Callback1) == "function" then
			Callback1(constantSource)
		end
		return Callback
	end, { Callback }))))
end

local function createThinkingGradient(p1)
	-- upvalues: ReactModule (copy), ChatConstantsModule (copy)
	return ReactModule.createElement("UIGradient", {
		Enabled = true,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.55),
			NumberSequenceKeypoint.new(0.5, 0),
			NumberSequenceKeypoint.new(1, 0.55)
		}),
		Offset = p1:map(function(p2): Vector2
			-- upvalues: ChatConstantsModule (upval)
			return Vector2.new(p2 * ChatConstantsModule.THINKING_GRADIENT_ANIMATION_SPEED % ChatConstantsModule.THINKING_GRADIENT_OFFSET - ChatConstantsModule.THINKING_GRADIENT_OFFSET / 2, 0)
		end)
	})
end

local function createActivityText(Text1, LayoutOrder)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
		LayoutOrder = LayoutOrder,
		Text = Text1
	})
end

local function _(p1, LayoutOrder)
	-- upvalues: createActivityText (copy), TurnDisplayModule (copy)
	return if p1.kind == "tool_call" then createActivityText(TurnDisplayModule.getToolActivityLabel(p1), LayoutOrder) else nil
end

local function createActivitySummaryActionText(Text1, LayoutOrder, ClockBinding, p1)
	-- upvalues: ReactModule (copy), Text (copy), createThinkingGradient (copy)
	return ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-muted",
		LayoutOrder = LayoutOrder,
		Text = Text1,
		Size = UDim2.new(1, 0, 0, 0)
	}, if p1 then { ThinkingGradient = createThinkingGradient(ClockBinding) } else nil)
end

return function(Frame)
	-- upvalues: useReactiveValue (copy), t (copy), ReactModule (copy), FoundationModule (copy), TurnDisplayModule (copy), Text (copy), View (copy), createActivitySummaryActionText (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), ScrollView (copy)
	local Segment = Frame.segment
	local UseReactiveValueResult = useReactiveValue(Segment.label)
	local UseReactiveValueResult1 = useReactiveValue(Segment.activityItems or t)
	local UseReactiveValueResult2 = useReactiveValue(Segment.isLoading or false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult (copy)
		if ScrollFrame ~= nil then
			task.defer(function()
				-- upvalues: UseRefResult (upval), ScrollFrame (copy)
				if UseRefResult.current == ScrollFrame then
					ScrollFrame.CanvasPosition = Vector2.new(0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y)))
					
					return
				end
			end)
			
			return
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult1 (copy)
		UseRefResult.current = Current
		
		if Current then
			UseResult1(Current)
		end
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseBindingResult2 (copy), UseResult1 (copy)
		UseBindingResult2(ScrollFrame.AbsoluteCanvasSize.Y)
		UseResult1(ScrollFrame)
	end, { UseBindingResult2, UseResult1 })
	local UseResult4 = ReactModule.useCallback(function(p1)
		-- upvalues: UseResult1 (copy)
		UseResult1(p1)
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy), UseRefResult (copy)
		UseResult1(UseRefResult.current)
		
		return function() end
	end, { UseResult1, UseReactiveValueResult1 })
	local Elements = {}
	
	for LayoutOrder, value in UseReactiveValueResult1 do
		local Element = if value.kind == "tool_call" then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
			LayoutOrder = LayoutOrder,
			Text = TurnDisplayModule.getToolActivityLabel(value)
		}) else nil
		
		if Element ~= nil then
			Elements[`Tool{LayoutOrder}`] = Element
		end
	end
	local HasNextEntry = next(Elements) ~= nil
	
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "TurnActivitySummary",
		LayoutOrder = Frame.LayoutOrder
	}, {
		ActivitySummary = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "TurnActivitySummary.Summary",
			onActivated = UseResult,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Chevron = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = if UseStateResult then IconName.ChevronLargeDown else IconName.ChevronLargeRight,
				size = IconSize.XSmall,
				style = UseTokensResult.Color.Content.Muted
			}),
			Label = if UseReactiveValueResult2 then ReactModule.createElement(View, { LayoutOrder = 2, tag = "col fill gap-xxsmall auto-y" }, {
				CurrentAction = createActivitySummaryActionText(UseReactiveValueResult, 1, Frame.clockBinding, true)
			}) else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = UseReactiveValueResult
			})
		}),
		ActivityHistory = if UseStateResult and HasNextEntry then ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			tag = "size-full-0 clip",
			testId = "TurnActivitySummary.ActivityHistory",
			Size = UseBindingResult:map(function(Value: number): UDim2
				return UDim2.new(1, 0, 0, (math.clamp(Value, 24, 220)))
			end),
			scrollingFrameRef = UseResult2,
			onAbsoluteCanvasSizeChanged = UseResult3,
			onAbsoluteWindowSizeChanged = UseResult4,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			ActivityColumn = ReactModule.createElement(View, {
				tag = "col gap-xsmall size-full-0 auto-y padding-left-large"
			}, Elements)
		}) else nil
	})
end