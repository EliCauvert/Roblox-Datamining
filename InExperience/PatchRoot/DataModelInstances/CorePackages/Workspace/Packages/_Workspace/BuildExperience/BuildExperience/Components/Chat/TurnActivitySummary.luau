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

local function createActivityItem(p7, p8) --[[ line: 91 ]]
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

local function _(p13, p14, p15, p16, p17, p18, p19) --[[ line: 115 | named "getActivitySummaryActionText" ]]
	-- upvalues: chatConstantsModule (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref)
	return if p14 then p17:map(function(p20) --[[ line: 128 ]]
		-- upvalues: p18 (ref), p15 (ref), chatConstantsModule (copy), fFlagBuildLocalization (copy), p19 (ref), localizationStringsModule (copy), p16 (ref)
		if not p18.isThinking then
			return p15
		elseif p18.startedAt == nil then
			p18.startedAt = p20
		end
		local maxValue = math.max(0, p20 - p18.startedAt)
		
		return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then if fFlagBuildLocalization then p19:Format(localizationStringsModule.CHAT_THINKING_SECONDS, { SECONDS = math.max(0, math.floor(maxValue)) }) else chatConstantsModule.formatAssistantLoadingText(maxValue) else p15 else p16
	end) else p13
end

local function localizeActivityLabel(p21, p22, p23, p24, p25) --[[ line: 151 ]]
	-- upvalues: localizationStringsModule (ref)
	local var17 = p23[p21]
	
	if var17 ~= nil then
		return var17
	elseif p22 == nil or p22.kind ~= "tool_call" then
		return p21
	end
	local var18 = if typeof(p22.title) == "string" and p22.title ~= "" then p22.title else localizationStringsModule.CHAT_TOOL
	local chatToolActivityLocalizationKey = localizationStringsModule.getChatToolActivityLocalizationKey(p22.title, p22.status)
	
	if chatToolActivityLocalizationKey ~= nil then
		return p25:Format(chatToolActivityLocalizationKey)
	end
	local var20 = if var18 == localizationStringsModule.CHAT_TOOL then p24 else var18
	
	return if p22.status == "completed" then p25:Format(localizationStringsModule.CHAT_TOOL_FINISHED, { TITLE = var20 }) elseif p22.status == "failed" then p25:Format(localizationStringsModule.CHAT_TOOL_FAILED, { TITLE = var20 }) else p25:Format(localizationStringsModule.CHAT_TOOL_RUNNING, { title = var20 })
end

return function(p26) --[[ line: 190 | named "TurnActivitySummary" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), useReactiveValue (ref), t (ref), localizeActivityLabel (ref), createActivityText (ref), chatConstantsModule (ref), createActivityItem (ref), foundationModule (ref), view (ref), createActivitySummaryActionText (ref), text (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), scrollView (ref)
	local ASSISTANT_LOADING_TEXT, ASSISTANT_STILL_WORKING_TEXT, var25
	local segment = p26.segment
	local actionCount = segment.actionCount
	local var21 = if fFlagBuildLocalization then useLocalization({
		assigningTasks = localizationStringsModule.CHAT_ASSIGNING_TASKS,
		assistantLoading = localizationStringsModule.CHAT_ASSISTANT_LOADING,
		assistantStillWorking = localizationStringsModule.CHAT_ASSISTANT_STILL_WORKING,
		questionComposerAnswer = localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER,
		questionMultiple = localizationStringsModule.CHAT_QUESTION_MULTIPLE,
		questionSingle = localizationStringsModule.CHAT_QUESTION_SINGLE,
		taskCount = if actionCount == nil or actionCount <= 1 then nil else {
			localizationStringsModule.CHAT_TASKS_COMPLETED,
			NUM_COMPLETED_TASKS = actionCount
		},
		tool = localizationStringsModule.CHAT_TOOL
	}) else nil
	local var22 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var23 = useReactiveValue(segment.label or "")
	local var24 = useReactiveValue(segment.activityItems or t)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		ASSISTANT_LOADING_TEXT = var21.assistantLoading
		ASSISTANT_STILL_WORKING_TEXT = var21.assistantStillWorking
		local t_1 = {
			[localizationStringsModule.CHAT_ASSIGNING_TASKS] = var21.assigningTasks,
			[localizationStringsModule.CHAT_ASSISTANT_LOADING] = ASSISTANT_LOADING_TEXT,
			[localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER] = var21.questionComposerAnswer,
			[localizationStringsModule.CHAT_QUESTION_MULTIPLE] = var21.questionMultiple,
			[localizationStringsModule.CHAT_QUESTION_SINGLE] = var21.questionSingle
		}
		var25 = if actionCount == nil or actionCount <= 1 or segment.summaryToolActivity ~= nil then localizeActivityLabel(var23, segment.summaryToolActivity, t_1, var21.tool, var22) else var21.taskCount
		
		local var26 = function(p27, p28) --[[ line: 238 ]]
			-- upvalues: localizeActivityLabel (copy), localizationStringsModule (copy), t_1 (ref), var21 (ref), var22 (ref), createActivityText (copy)
			return if p27.kind == "tool_call" then createActivityText(localizeActivityLabel(localizationStringsModule.CHAT_TOOL, p27, t_1, var21.tool, var22), p28) else nil
		end
	else
		var25 = var23
		ASSISTANT_LOADING_TEXT = chatConstantsModule.ASSISTANT_LOADING_TEXT
		ASSISTANT_STILL_WORKING_TEXT = chatConstantsModule.ASSISTANT_STILL_WORKING_TEXT
		local var26 = createActivityItem
	end
	local var28 = useReactiveValue(segment.isLoading or false)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useBinding(0)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef({ isThinking = false, startedAt = nil })
	local var35 = foundationModule.Hooks.useTokens()
	local var36 = var23 == chatConstantsModule.ASSISTANT_LOADING_TEXT
	local current = var34.current
	
	if current.isThinking ~= var36 then
		current.isThinking = var36
		current.startedAt = nil
	end
	local var37 = reactModule.useCallback(function() --[[ line: 274 ]]
		-- upvalues: var30 (ref)
		var30(function(p29) --[[ line: 275 ]]
			return not p29
		end)
	end, {})
	local var38 = reactModule.useCallback(function(p30) --[[ line: 280 ]]
		-- upvalues: var33 (ref)
		if p30 == nil then
			return
		end
		task.defer(function() --[[ line: 285 ]]
			-- upvalues: var33 (copy), p30 (ref)
			if var33.current == p30 then
				p30.CanvasPosition = Vector2.new(0, math.max(0, p30.AbsoluteCanvasSize.Y - p30.AbsoluteWindowSize.Y))
				
				return
			end
		end)
	end, {})
	local var39 = reactModule.useCallback(function(p31) --[[ line: 296 ]]
		-- upvalues: var33 (ref), var38 (ref)
		var33.current = p31
		
		if p31 then
			var38(p31)
		end
	end, { var38 })
	local var40 = reactModule.useCallback(function(p32) --[[ line: 303 ]]
		-- upvalues: var32 (ref), var38 (ref)
		var32(p32.AbsoluteCanvasSize.Y)
		var38(p32)
	end, { var32, var38 })
	local var41 = reactModule.useCallback(function(p33) --[[ line: 308 ]]
		-- upvalues: var38 (ref)
		var38(p33)
	end, { var38 })
	reactModule.useEffect(function() --[[ line: 312 ]]
		-- upvalues: var38 (ref), var33 (ref)
		var38(var33.current)
		
		return function() --[[ line: 314 ]] end
	end, { var38, var24 })
	local t_1 = {}
	local var43 = 0
	
	for i, v in var24 do
		local var45 = var26(v, i)
		
		if var45 ~= nil then
			t_1[`Tool{i}`] = var45
			var43 += 1
		end
	end
	local var44 = var43 > 1
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "TurnActivitySummary",
		LayoutOrder = p26.LayoutOrder
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
				CurrentAction = createActivitySummaryActionText(if not var36 then var25 else p26.clockBinding:map(function(p34) --[[ line: 128 ]]
					-- upvalues: current (ref), ASSISTANT_LOADING_TEXT (ref), chatConstantsModule (copy), fFlagBuildLocalization (copy), var22 (ref), localizationStringsModule (copy), ASSISTANT_STILL_WORKING_TEXT (ref)
					if not current.isThinking then
						return ASSISTANT_LOADING_TEXT
					elseif current.startedAt == nil then
						current.startedAt = p34
					end
					local maxValue = math.max(0, p34 - current.startedAt)
					
					return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then if fFlagBuildLocalization then var22:Format(localizationStringsModule.CHAT_THINKING_SECONDS, { SECONDS = math.max(0, math.floor(maxValue)) }) else chatConstantsModule.formatAssistantLoadingText(maxValue) else ASSISTANT_LOADING_TEXT else ASSISTANT_STILL_WORKING_TEXT
				end), 1, p26.clockBinding, segment.isWaitingForLocalTool ~= true)
			}) else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var25
			})
		}),
		ActivityHistory = if var29 and next(t_1) ~= nil and var44 then reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "size-full-0 clip",
			testId = "TurnActivitySummary.ActivityHistory",
			Size = var31:map(function(p35) --[[ line: 383 ]]
				return UDim2.new(1, 0, 0, math.clamp(p35, 24, 220))
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