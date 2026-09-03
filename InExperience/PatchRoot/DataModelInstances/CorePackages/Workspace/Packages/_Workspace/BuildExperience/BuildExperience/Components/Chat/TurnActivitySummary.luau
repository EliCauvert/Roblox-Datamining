local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local _ = require(buildExperience.Chat.chatTypes)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local icon = foundationModule.Icon
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local t = {}

local function constantSource()
	return 0
end

local function useReactiveValue(p1)
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), constantSource (copy)
		if typeof(p1) == "function" then
			return p1(p2)
		elseif typeof(p2) == "function" then
			p2(constantSource)
		end
		return p1
	end, { p1 }))
end

local function createThinkingGradient(p1, p2)
	-- upvalues: reactModule (ref), chatConstantsModule (ref)
	return reactModule.createElement("UIGradient", {
		Enabled = p2,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.55),
			NumberSequenceKeypoint.new(0.5, 0),
			NumberSequenceKeypoint.new(1, 0.55)
		}),
		Offset = p1:map(function(p3)
			-- upvalues: chatConstantsModule (copy)
			return Vector2.new(p3 * chatConstantsModule.THINKING_GRADIENT_ANIMATION_SPEED % chatConstantsModule.THINKING_GRADIENT_OFFSET - chatConstantsModule.THINKING_GRADIENT_OFFSET / 2, 0)
		end)
	})
end

local function createActivityText(p1, p2)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
		LayoutOrder = p2,
		Text = p1
	})
end

local function createActivitySummaryActionText(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), text (ref), createThinkingGradient (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-muted",
		LayoutOrder = p2,
		Text = p1,
		Size = UDim2.new(1, 0, 0, 0)
	}, { ThinkingGradient = createThinkingGradient(p3, p4) })
end

local function _(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: chatConstantsModule (ref), localizationStringsModule (ref)
	return if p2 then p5:map(function(p8)
		-- upvalues: p6 (ref), p3 (ref), chatConstantsModule (copy), p7 (ref), localizationStringsModule (copy), p4 (ref)
		if not p6.isThinking then
			return p3
		elseif p6.startedAt == nil then
			p6.startedAt = p8
		end
		local maxValue = math.max(0, p8 - p6.startedAt)
		
		return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then p7:Format(localizationStringsModule.CHAT_THINKING_SECONDS, { SECONDS = math.max(0, math.floor(maxValue)) }) else p3 else p4
	end) else p1
end

local function localizeActivityLabel(p1, p2, p3, p4, p5)
	-- upvalues: localizationStringsModule (ref)
	local var1 = p3[p1]
	
	if var1 ~= nil then
		return var1
	elseif p2 == nil or p2.kind ~= "tool_call" then
		return p1
	end
	local var2 = if typeof(p2.title) == "string" and p2.title ~= "" then p2.title else localizationStringsModule.CHAT_TOOL
	local chatToolActivityLocalizationKey = localizationStringsModule.getChatToolActivityLocalizationKey(p2.title, p2.status)
	
	if chatToolActivityLocalizationKey ~= nil then
		return p5:Format(chatToolActivityLocalizationKey)
	end
	local var3 = if var2 == localizationStringsModule.CHAT_TOOL then p4 else var2
	
	return if p2.status == "completed" then p5:Format(localizationStringsModule.CHAT_TOOL_FINISHED, { TITLE = var3 }) elseif p2.status == "failed" then p5:Format(localizationStringsModule.CHAT_TOOL_FAILED, { TITLE = var3 }) else p5:Format(localizationStringsModule.CHAT_TOOL_RUNNING, { title = var3 })
end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), useReactiveValue (ref), t (ref), localizeActivityLabel (ref), createActivityText (ref), foundationModule (ref), chatConstantsModule (ref), view (ref), createActivitySummaryActionText (ref), text (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), scrollView (ref)
	local segment = p1.segment
	local actionCount = segment.actionCount
	local var1 = useLocalization({
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
	})
	local var2 = reactModule.useContext(localizationRoactContext)
	local var3 = useReactiveValue(segment.label or "")
	local var4 = useReactiveValue(segment.activityItems or t)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local assistantLoading = var1.assistantLoading
	local assistantStillWorking = var1.assistantStillWorking
	local t_1 = {
		[localizationStringsModule.CHAT_ASSIGNING_TASKS] = var1.assigningTasks,
		[localizationStringsModule.CHAT_ASSISTANT_LOADING] = assistantLoading,
		[localizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER] = var1.questionComposerAnswer,
		[localizationStringsModule.CHAT_QUESTION_MULTIPLE] = var1.questionMultiple,
		[localizationStringsModule.CHAT_QUESTION_SINGLE] = var1.questionSingle
	}
	local var5 = if actionCount == nil or actionCount <= 1 or segment.summaryToolActivity ~= nil then localizeActivityLabel(var3, segment.summaryToolActivity, t_1, var1.tool, var2) else var1.taskCount
	
	local var6 = function(p2, p3)
		-- upvalues: localizeActivityLabel (copy), localizationStringsModule (copy), t_1 (ref), var1 (ref), var2 (ref), createActivityText (copy)
		return if p2.kind == "tool_call" then createActivityText(localizeActivityLabel(localizationStringsModule.CHAT_TOOL, p2, t_1, var1.tool, var2), p3) else nil
	end
	
	local var7 = useReactiveValue(segment.isLoading or false)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useBinding(0)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef({ isThinking = false, startedAt = nil })
	local var14 = foundationModule.Hooks.useTokens()
	local var15 = var3 == chatConstantsModule.ASSISTANT_LOADING_TEXT
	local current = var13.current
	
	if current.isThinking ~= var15 then
		current.isThinking = var15
		current.startedAt = nil
	end
	local var16 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(function(p2)
			return not p2
		end)
	end, {})
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref)
		if p2 == nil then
			return
		end
		task.defer(function()
			-- upvalues: var12 (copy), p2 (ref)
			if var12.current == p2 then
				p2.CanvasPosition = Vector2.new(0, math.max(0, p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y))
				
				return
			end
		end)
	end, {})
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref), var17 (ref)
		var12.current = p2
		
		if p2 then
			var17(p2)
		end
	end, { var17 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref), var17 (ref)
		var11(p2.AbsoluteCanvasSize.Y)
		var17(p2)
	end, { var11, var17 })
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref)
		var17(p2)
	end, { var17 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var12 (ref)
		var17(var12.current)
		
		return function() end
	end, { var17, var4 })
	local t_2 = {}
	local var21 = 0
	
	for i, v in var4 do
		local var22 = var6(v, i)
		
		if var22 ~= nil then
			t_2[`Tool{i}`] = var22
			var21 += 1
		end
	end
	local var23 = var21 > 1
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "TurnActivitySummary",
		LayoutOrder = p1.LayoutOrder
	}, {
		ActivitySummary = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "TurnActivitySummary.Summary",
			onActivated = if var23 then var16 else nil,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = if var23 then reactModule.createElement(icon, {
				LayoutOrder = 1,
				testId = "TurnActivitySummary.Chevron",
				name = if var8 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var14.Color.Content.Muted
			}) else nil,
			Label = if var7 then reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill gap-xxsmall auto-y" }, {
				CurrentAction = createActivitySummaryActionText(if not var15 then var5 else p1.clockBinding:map(function(p2)
					-- upvalues: current (ref), assistantLoading (ref), chatConstantsModule (copy), var2 (ref), localizationStringsModule (copy), assistantStillWorking (ref)
					if not current.isThinking then
						return assistantLoading
					elseif current.startedAt == nil then
						current.startedAt = p2
					end
					local maxValue = math.max(0, p2 - current.startedAt)
					
					return if math.floor(maxValue / chatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 0 then if chatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= maxValue then var2:Format(localizationStringsModule.CHAT_THINKING_SECONDS, { SECONDS = math.max(0, math.floor(maxValue)) }) else assistantLoading else assistantStillWorking
				end), 1, p1.clockBinding, segment.isWaitingForLocalTool ~= true)
			}) else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var5
			})
		}),
		ActivityHistory = if var8 and next(t_2) ~= nil and var23 then reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "size-full-0 clip",
			testId = "TurnActivitySummary.ActivityHistory",
			Size = var10:map(function(p2)
				return UDim2.new(1, 0, 0, math.clamp(p2, 24, 220))
			end),
			scrollingFrameRef = var18,
			onAbsoluteCanvasSizeChanged = var19,
			onAbsoluteWindowSizeChanged = var20,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			ActivityColumn = reactModule.createElement(view, {
				tag = "col gap-xsmall size-full-0 auto-y padding-left-large"
			}, t_2)
		}) else nil
	})
end