local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local _ = require(buildExperience.Chat.chatTypes)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local turnDisplayModule = require(buildExperience.Chat.turnDisplay)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local icon = foundationModule.Icon
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local t = {}

local function constantSource() --[[ line: 47 ]]
	return 0
end

local function useReactiveValue(p0) --[[ line: 51 ]]
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 52 ]]
		-- upvalues: p0 (ref), constantSource (copy)
		if typeof(p0) == "function" then
			return p0(p1)
		elseif typeof(p1) == "function" then
			p1(constantSource)
		end
		return p0
	end, { p0 }))
end

local function createThinkingGradient(p2, p3) --[[ line: 65 ]]
	-- upvalues: reactModule (ref), chatConstantsModule (ref)
	return reactModule.createElement("UIGradient", {
		Enabled = p3,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.55),
			NumberSequenceKeypoint.new(0.5, 0),
			NumberSequenceKeypoint.new(1, 0.55)
		}),
		Offset = p2:map(function(p4) --[[ line: 73 ]]
			-- upvalues: chatConstantsModule (copy)
			return Vector2.new(p4 * chatConstantsModule.THINKING_GRADIENT_ANIMATION_SPEED % chatConstantsModule.THINKING_GRADIENT_OFFSET - chatConstantsModule.THINKING_GRADIENT_OFFSET / 2, 0)
		end)
	})
end

local function createActivityText(p5, p6) --[[ line: 83 ]]
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
		LayoutOrder = p6,
		Text = p5
	})
end

local function _(p7, p8) --[[ line: 91 | named "createActivityItem" ]]
	-- upvalues: createActivityText (ref), turnDisplayModule (ref)
	return if p7.kind == "tool_call" then createActivityText(turnDisplayModule.getToolActivityLabel(p7), p8) else nil
end

local function createActivitySummaryActionText(p9, p10, p11, p12) --[[ line: 99 ]]
	-- upvalues: reactModule (ref), text (ref), createThinkingGradient (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-muted",
		LayoutOrder = p10,
		Text = p9,
		Size = UDim2.new(1, 0, 0, 0)
	}, { ThinkingGradient = createThinkingGradient(p11, p12) })
end

local _ = function(p13, p14, p15, p16, p17, p18) --[[ line: 115 | named "getActivitySummaryActionText" ]]
	-- upvalues: chatConstantsModule (ref)
	return if p14 then p17:map(function(p19) --[[ line: 127 ]]
		-- upvalues: p18 (ref), p15 (ref), chatConstantsModule (copy), p16 (ref)
		if not p18.isThinking then
			return p15
		elseif p18.startedAt == nil then
			p18.startedAt = p19
		end
		local maxValue = math.max(0, p19 - p18.startedAt)
		
		return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then chatConstantsModule.formatAssistantLoadingText(maxValue) else p15 else p16
	end) else p13
end

local function localizeActivityLabel(p20, p21, p22, p23, p24) --[[ line: 143 ]]
	-- upvalues: localizationStringsModule (ref)
	local var16 = p22[p20]
	
	if var16 ~= nil then
		return var16
	elseif p21 == nil or p21.kind ~= "tool_call" then
		return p20
	end
	local var17 = if typeof(p21.title) == "string" and p21.title ~= "" then p21.title else localizationStringsModule.CHAT_TOOL
	local chatToolActivityLocalizationKey = localizationStringsModule.getChatToolActivityLocalizationKey(p21.title, p21.status)
	
	if chatToolActivityLocalizationKey ~= nil then
		return p24:Format(chatToolActivityLocalizationKey)
	end
	local var19 = if var17 == localizationStringsModule.CHAT_TOOL then p23 else var17
	
	return if p21.status == "completed" then p24:Format(localizationStringsModule.CHAT_TOOL_FINISHED, { TITLE = var19 }) elseif p21.status == "failed" then p24:Format(localizationStringsModule.CHAT_TOOL_FAILED, { TITLE = var19 }) else p24:Format(localizationStringsModule.CHAT_TOOL_RUNNING, { title = var19 })
end

return function(p25) --[[ line: 182 | named "TurnActivitySummary" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), useReactiveValue (ref), t (ref), chatConstantsModule (ref), localizeActivityLabel (ref), foundationModule (ref), turnDisplayModule (ref), text (ref), view (ref), createActivitySummaryActionText (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), scrollView (ref)
	local segment = p25.segment
	local var20 = if fFlagBuildLocalization then useLocalization({
		assigningTasks = localizationStringsModule.CHAT_ASSIGNING_TASKS,
		assistantLoading = localizationStringsModule.CHAT_ASSISTANT_LOADING,
		assistantStillWorking = localizationStringsModule.CHAT_ASSISTANT_STILL_WORKING,
		questionComposerAnswer = localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER,
		questionMultiple = localizationStringsModule.CHAT_QUESTION_MULTIPLE,
		questionSingle = localizationStringsModule.CHAT_QUESTION_SINGLE,
		tool = localizationStringsModule.CHAT_TOOL
	}) else nil
	local var21 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var22 = useReactiveValue(segment.label)
	local var23 = useReactiveValue(segment.activityItems or t)
	local var24 = if fFlagBuildLocalization then var20.assistantLoading else chatConstantsModule.ASSISTANT_LOADING_TEXT
	local var25 = if fFlagBuildLocalization then var20.assistantStillWorking else chatConstantsModule.ASSISTANT_STILL_WORKING_TEXT
	local var26 = if fFlagBuildLocalization then {
		[localizationStringsModule.CHAT_ASSIGNING_TASKS] = var20.assigningTasks,
		[localizationStringsModule.CHAT_ASSISTANT_LOADING] = var24,
		[localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER] = var20.questionComposerAnswer,
		[localizationStringsModule.CHAT_QUESTION_MULTIPLE] = var20.questionMultiple,
		[localizationStringsModule.CHAT_QUESTION_SINGLE] = var20.questionSingle
	} else nil
	local var27 = if fFlagBuildLocalization then localizeActivityLabel(var22, segment.summaryToolActivity, var26, var20.tool, var21) else var22
	local var28 = useReactiveValue(segment.isLoading or false)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useBinding(0)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef({ isThinking = false, startedAt = nil })
	local var35 = foundationModule.Hooks.useTokens()
	local var36 = var22 == chatConstantsModule.ASSISTANT_LOADING_TEXT
	local current = var34.current
	
	if current.isThinking ~= var36 then
		current.isThinking = var36
		current.startedAt = nil
	end
	local var37 = reactModule.useCallback(function() --[[ line: 239 ]]
		-- upvalues: var30 (ref)
		var30(function(p26) --[[ line: 240 ]]
			return not p26
		end)
	end, {})
	local var38 = reactModule.useCallback(function(p27) --[[ line: 245 ]]
		-- upvalues: var33 (ref)
		if p27 == nil then
			return
		end
		task.defer(function() --[[ line: 250 ]]
			-- upvalues: var33 (copy), p27 (ref)
			if var33.current == p27 then
				p27.CanvasPosition = Vector2.new(0, math.max(0, p27.AbsoluteCanvasSize.Y - p27.AbsoluteWindowSize.Y))
				
				return
			end
		end)
	end, {})
	local var39 = reactModule.useCallback(function(p28) --[[ line: 261 ]]
		-- upvalues: var33 (ref), var38 (ref)
		var33.current = p28
		
		if p28 then
			var38(p28)
		end
	end, { var38 })
	local var40 = reactModule.useCallback(function(p29) --[[ line: 268 ]]
		-- upvalues: var32 (ref), var38 (ref)
		var32(p29.AbsoluteCanvasSize.Y)
		var38(p29)
	end, { var32, var38 })
	local var41 = reactModule.useCallback(function(p30) --[[ line: 273 ]]
		-- upvalues: var38 (ref)
		var38(p30)
	end, { var38 })
	reactModule.useEffect(function() --[[ line: 277 ]]
		-- upvalues: var38 (ref), var33 (ref)
		var38(var33.current)
		
		return function() --[[ line: 279 ]] end
	end, { var38, var23 })
	local t_1 = {}
	local var43 = 0
	
	for i, v in var23 do
		if not fFlagBuildLocalization then
			local var45 = if v.kind == "tool_call" then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
				LayoutOrder = i,
				Text = turnDisplayModule.getToolActivityLabel(v)
			}) else nil
			
			if var45 ~= nil then
				t_1[`Tool{i}`] = var45
				var43 += 1
			end
		elseif v.kind == "tool_call" then
			t_1[`Tool{i}`] = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
				LayoutOrder = i,
				Text = localizeActivityLabel(turnDisplayModule.getToolActivityLabel(v), v, var26, var20.tool, var21)
			})
			var43 += 1
		end
	end
	local var44 = var43 > 1
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "TurnActivitySummary",
		LayoutOrder = p25.LayoutOrder
	}, {
		ActivitySummary = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "TurnActivitySummary.Summary",
			onActivated = if var44 then var37 else nil,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = if var44 then reactModule.createElement(icon, {
				LayoutOrder = 1,
				testId = "TurnActivitySummary.Chevron",
				name = if var29 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var35.Color.Content.Muted
			}) else nil,
			Label = if var28 then reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill gap-xxsmall auto-y" }, {
				CurrentAction = createActivitySummaryActionText(if not var36 then var27 else p25.clockBinding:map(function(p31) --[[ line: 127 ]]
					-- upvalues: current (ref), var24 (ref), chatConstantsModule (copy), var25 (ref)
					if not current.isThinking then
						return var24
					elseif current.startedAt == nil then
						current.startedAt = p31
					end
					local maxValue = math.max(0, p31 - current.startedAt)
					
					return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then chatConstantsModule.formatAssistantLoadingText(maxValue) else var24 else var25
				end), 1, p25.clockBinding, segment.isWaitingForLocalTool ~= true)
			}) else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var27
			})
		}),
		ActivityHistory = if var29 and next(t_1) ~= nil and var44 then reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "size-full-0 clip",
			testId = "TurnActivitySummary.ActivityHistory",
			Size = var31:map(function(p32) --[[ line: 361 ]]
				return UDim2.new(1, 0, 0, math.clamp(p32, 24, 220))
			end),
			scrollingFrameRef = var39,
			onAbsoluteCanvasSizeChanged = var40,
			onAbsoluteWindowSizeChanged = var41,
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