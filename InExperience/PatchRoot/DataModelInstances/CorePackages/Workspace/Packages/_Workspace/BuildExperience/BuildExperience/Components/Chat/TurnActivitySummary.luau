local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Chat.chatTypes)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local turnDisplayModule = require(buildExperience.Chat.turnDisplay)
local icon = foundationModule.Icon
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local t = {}

local function constantSource() --[[ line: 41 ]]
	return 0
end

local function useReactiveValue(p0) --[[ line: 45 ]]
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 46 ]]
		-- upvalues: p0 (ref), constantSource (copy)
		if typeof(p0) == "function" then
			return p0(p1)
		elseif typeof(p1) == "function" then
			p1(constantSource)
		end
		return p0
	end, { p0 }))
end

local function createThinkingGradient(p2, p3) --[[ line: 59 ]]
	-- upvalues: reactModule (ref), chatConstantsModule (ref)
	return reactModule.createElement("UIGradient", {
		Enabled = p3,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.55),
			NumberSequenceKeypoint.new(0.5, 0),
			NumberSequenceKeypoint.new(1, 0.55)
		}),
		Offset = p2:map(function(p4) --[[ line: 67 ]]
			-- upvalues: chatConstantsModule (copy)
			return Vector2.new(p4 * chatConstantsModule.THINKING_GRADIENT_ANIMATION_SPEED % chatConstantsModule.THINKING_GRADIENT_OFFSET - chatConstantsModule.THINKING_GRADIENT_OFFSET / 2, 0)
		end)
	})
end

local function createActivityText(p5, p6) --[[ line: 77 ]]
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
		LayoutOrder = p6,
		Text = p5
	})
end

local function _(p7, p8) --[[ line: 85 | named "createActivityItem" ]]
	-- upvalues: createActivityText (ref), turnDisplayModule (ref)
	return if p7.kind == "tool_call" then createActivityText(turnDisplayModule.getToolActivityLabel(p7), p8) else nil
end

local function createActivitySummaryActionText(p9, p10, p11, p12) --[[ line: 93 ]]
	-- upvalues: reactModule (ref), text (ref), createThinkingGradient (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-muted",
		LayoutOrder = p10,
		Text = p9,
		Size = UDim2.new(1, 0, 0, 0)
	}, { ThinkingGradient = createThinkingGradient(p11, p12) })
end

local _ = function(p13, p14, p15) --[[ line: 109 | named "getActivitySummaryActionText" ]]
	-- upvalues: chatConstantsModule (ref)
	return if p13 == chatConstantsModule.ASSISTANT_LOADING_TEXT then p14:map(function(p16) --[[ line: 118 ]]
		-- upvalues: p15 (ref), chatConstantsModule (copy)
		if not p15.isThinking then
			return chatConstantsModule.ASSISTANT_LOADING_TEXT
		elseif p15.startedAt == nil then
			p15.startedAt = p16
		end
		local maxValue = math.max(0, p16 - p15.startedAt)
		
		return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then chatConstantsModule.formatAssistantLoadingText(maxValue) else chatConstantsModule.ASSISTANT_LOADING_TEXT else chatConstantsModule.ASSISTANT_STILL_WORKING_TEXT
	end) else p13
end

return function(p17) --[[ line: 136 | named "TurnActivitySummary" ]]
	-- upvalues: useReactiveValue (ref), t (ref), reactModule (ref), foundationModule (ref), chatConstantsModule (ref), turnDisplayModule (ref), text (ref), view (ref), createActivitySummaryActionText (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), scrollView (ref)
	local segment = p17.segment
	local var13 = useReactiveValue(segment.label)
	local var14 = useReactiveValue(segment.activityItems or t)
	local var15 = useReactiveValue(segment.isLoading or false)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useBinding(0)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef({ isThinking = false, startedAt = nil })
	local var22 = foundationModule.Hooks.useTokens()
	local var23 = var13 == chatConstantsModule.ASSISTANT_LOADING_TEXT
	local current = var21.current
	
	if current.isThinking ~= var23 then
		current.isThinking = var23
		current.startedAt = nil
	end
	local var24 = reactModule.useCallback(function() --[[ line: 157 ]]
		-- upvalues: var17 (ref)
		var17(function(p18) --[[ line: 158 ]]
			return not p18
		end)
	end, {})
	local var25 = reactModule.useCallback(function(p19) --[[ line: 163 ]]
		-- upvalues: var20 (ref)
		if p19 == nil then
			return
		end
		task.defer(function() --[[ line: 168 ]]
			-- upvalues: var20 (copy), p19 (ref)
			if var20.current == p19 then
				p19.CanvasPosition = Vector2.new(0, math.max(0, p19.AbsoluteCanvasSize.Y - p19.AbsoluteWindowSize.Y))
				
				return
			end
		end)
	end, {})
	local var26 = reactModule.useCallback(function(p20) --[[ line: 179 ]]
		-- upvalues: var20 (ref), var25 (ref)
		var20.current = p20
		
		if p20 then
			var25(p20)
		end
	end, { var25 })
	local var27 = reactModule.useCallback(function(p21) --[[ line: 186 ]]
		-- upvalues: var19 (ref), var25 (ref)
		var19(p21.AbsoluteCanvasSize.Y)
		var25(p21)
	end, { var19, var25 })
	local var28 = reactModule.useCallback(function(p22) --[[ line: 191 ]]
		-- upvalues: var25 (ref)
		var25(p22)
	end, { var25 })
	reactModule.useEffect(function() --[[ line: 195 ]]
		-- upvalues: var25 (ref), var20 (ref)
		var25(var20.current)
		
		return function() --[[ line: 197 ]] end
	end, { var25, var14 })
	local t_1 = {}
	local var30 = 0
	
	for i, v in var14 do
		local var32 = if v.kind == "tool_call" then reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
			LayoutOrder = i,
			Text = turnDisplayModule.getToolActivityLabel(v)
		}) else nil
		
		if var32 ~= nil then
			t_1[`Tool{i}`] = var32
			var30 += 1
		end
	end
	local var31 = var30 > 1
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "TurnActivitySummary",
		LayoutOrder = p17.LayoutOrder
	}, {
		ActivitySummary = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "TurnActivitySummary.Summary",
			onActivated = if var31 then var24 else nil,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = if var31 then reactModule.createElement(icon, {
				LayoutOrder = 1,
				testId = "TurnActivitySummary.Chevron",
				name = if var16 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var22.Color.Content.Muted
			}) else nil,
			Label = if var15 then reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill gap-xxsmall auto-y" }, {
				CurrentAction = createActivitySummaryActionText(if var13 ~= chatConstantsModule.ASSISTANT_LOADING_TEXT then p17.clockBinding:map(function(p23) --[[ line: 118 ]]
					-- upvalues: current (ref), chatConstantsModule (copy)
					if not current.isThinking then
						return chatConstantsModule.ASSISTANT_LOADING_TEXT
					elseif current.startedAt == nil then
						current.startedAt = p23
					end
					local maxValue = math.max(0, p23 - current.startedAt)
					
					return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then chatConstantsModule.formatAssistantLoadingText(maxValue) else chatConstantsModule.ASSISTANT_LOADING_TEXT else chatConstantsModule.ASSISTANT_STILL_WORKING_TEXT
				end) else var13, 1, p17.clockBinding, segment.isWaitingForLocalTool ~= true)
			}) else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var13
			})
		}),
		ActivityHistory = if var16 and next(t_1) ~= nil and var31 then reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "size-full-0 clip",
			testId = "TurnActivitySummary.ActivityHistory",
			Size = var18:map(function(p24) --[[ line: 258 ]]
				return UDim2.new(1, 0, 0, math.clamp(p24, 24, 220))
			end),
			scrollingFrameRef = var26,
			onAbsoluteCanvasSizeChanged = var27,
			onAbsoluteWindowSizeChanged = var28,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			ActivityColumn = reactModule.createElement(view, {
				tag = "col gap-xsmall size-full-0 auto-y padding-left-large"
			}, t_1)
		}) else nil
	})
end