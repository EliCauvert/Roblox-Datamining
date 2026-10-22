local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local ChatScrollAnchorContextModule = require(BuildExperience.Chat.ChatScrollAnchorContext)
local _ = require(BuildExperience.Chat.chatTypes)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceManageMonetizationTool = require(Parent.SharedFlags).FFlagBuildExperienceManageMonetizationTool
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperiencePromptStallMessageModule = require(BuildExperience.Flags.FFlagBuildExperiencePromptStallMessage)
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

local function createThinkingGradient(p1, Enabled)
	-- upvalues: ReactModule (copy), ChatConstantsModule (copy)
	return ReactModule.createElement("UIGradient", {
		Enabled = Enabled,
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

local function createActivitySummaryActionText(Text1, LayoutOrder, ClockBinding, Enabled)
	-- upvalues: ReactModule (copy), Text (copy), createThinkingGradient (copy)
	return ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-muted",
		LayoutOrder = LayoutOrder,
		Text = Text1,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		ThinkingGradient = createThinkingGradient(ClockBinding, Enabled)
	})
end

local function _(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: FFlagBuildExperiencePromptStallMessageModule (copy), ChatConstantsModule (copy), LocalizationStringsModule (copy)
	return if p2 then p5:map(function(StartedAt)
		-- upvalues: p6 (copy), p3 (copy), FFlagBuildExperiencePromptStallMessageModule (upval), p8 (copy), p9 (copy), ChatConstantsModule (upval), p7 (copy), LocalizationStringsModule (upval), p4 (copy)
		if not p6.isThinking then
			return p3
		end
		if p6.startedAt == nil then
			p6.startedAt = StartedAt
		end
		local Largest = math.max(0, StartedAt - p6.startedAt)
		
		if FFlagBuildExperiencePromptStallMessageModule and p8 ~= nil and p9 ~= nil then
			local LastProgressAt = p8.lastProgressAt or StartedAt
			p8.lastProgressAt = LastProgressAt
			
			if ChatConstantsModule.PROMPT_STALL_SECONDS <= StartedAt - LastProgressAt then
				return p9
			end
		end
		local ASSISTANTSTATUSSWAPINTERVALSECONDS = ChatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS
		local FormatResult = if ChatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= Largest then p7:Format(LocalizationStringsModule.CHAT_THINKING_SECONDS, { SECONDS = math.max(0, (math.floor(Largest))) }) else p3
		
		return if math.floor(Largest / ASSISTANTSTATUSSWAPINTERVALSECONDS) % 2 == 0 then FormatResult else p4
	end) else p1
end

local function localizeActivityLabel(CHATTOOL, SummaryToolActivity, p1, Tool, UseContextResult)
	-- upvalues: LocalizationStringsModule (copy), FFlagBuildExperienceManageMonetizationTool (copy)
	local v1 = p1[CHATTOOL]
	
	if v1 ~= nil then
		return v1
	end
	if SummaryToolActivity == nil or SummaryToolActivity.kind ~= "tool_call" then
		return CHATTOOL
	end
	local Title = if typeof(SummaryToolActivity.title) == "string" and SummaryToolActivity.title ~= "" then SummaryToolActivity.title else LocalizationStringsModule.CHAT_TOOL
	local ChatToolActivityLocalizationKey = LocalizationStringsModule.getChatToolActivityLocalizationKey(SummaryToolActivity.title, SummaryToolActivity.status)
	
	if ChatToolActivityLocalizationKey ~= nil then
		if not FFlagBuildExperienceManageMonetizationTool then
			return UseContextResult:Format(ChatToolActivityLocalizationKey)
		end
		local Success, Result = pcall(UseContextResult.Format, UseContextResult, ChatToolActivityLocalizationKey)
		
		if Success then
			return Result
		end
	end
	local Tool1 = if Title == LocalizationStringsModule.CHAT_TOOL then Tool else Title
	
	return if SummaryToolActivity.status == "completed" then UseContextResult:Format(LocalizationStringsModule.CHAT_TOOL_FINISHED, { TITLE = Tool1 }) elseif SummaryToolActivity.status == "failed" then UseContextResult:Format(LocalizationStringsModule.CHAT_TOOL_FAILED, { TITLE = Tool1 }) else UseContextResult:Format(LocalizationStringsModule.CHAT_TOOL_RUNNING, { title = Tool1 })
end

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperiencePromptStallMessageModule (copy), ReactModule (copy), LocalizationRoactContext (copy), useReactiveValue (copy), t (copy), localizeActivityLabel (copy), createActivityText (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), ChatScrollAnchorContextModule (copy), FoundationModule (copy), ChatConstantsModule (copy), View (copy), createActivitySummaryActionText (copy), Text (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), ScrollView (copy)
	local Segment = Frame.segment
	local ActionCount: number = Segment.actionCount
	local UseLocalizationResult = UseLocalizationFunction({
		assigningTasks = LocalizationStringsModule.CHAT_ASSIGNING_TASKS,
		assistantLoading = LocalizationStringsModule.CHAT_ASSISTANT_LOADING,
		assistantStillWorking = LocalizationStringsModule.CHAT_ASSISTANT_STILL_WORKING,
		assistantTakingLonger = if FFlagBuildExperiencePromptStallMessageModule then LocalizationStringsModule.CHAT_ASSISTANT_TAKING_LONGER else nil,
		questionComposerAnswer = LocalizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER,
		questionMultiple = LocalizationStringsModule.CHAT_QUESTION_MULTIPLE,
		questionSingle = LocalizationStringsModule.CHAT_QUESTION_SINGLE,
		taskCount = if ActionCount == nil or ActionCount <= 1 then nil else {
			LocalizationStringsModule.CHAT_TASKS_COMPLETED,
			NUM_COMPLETED_TASKS = ActionCount
		},
		tool = LocalizationStringsModule.CHAT_TOOL
	})
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseReactiveValueResult = useReactiveValue(Segment.label or "")
	local UseReactiveValueResult1 = useReactiveValue(Segment.activityItems or t)
	local AssistantLoading = UseLocalizationResult.assistantLoading
	local AssistantStillWorking = UseLocalizationResult.assistantStillWorking
	local config = {
		[LocalizationStringsModule.CHAT_ASSIGNING_TASKS] = UseLocalizationResult.assigningTasks,
		[LocalizationStringsModule.CHAT_ASSISTANT_LOADING] = AssistantLoading,
		[LocalizationStringsModule.CHAT_QUESTION_COMPOSER_ANSWER] = UseLocalizationResult.questionComposerAnswer,
		[LocalizationStringsModule.CHAT_QUESTION_MULTIPLE] = UseLocalizationResult.questionMultiple,
		[LocalizationStringsModule.CHAT_QUESTION_SINGLE] = UseLocalizationResult.questionSingle
	}
	local LocalizeActivityLabelResult = if ActionCount == nil or ActionCount <= 1 or Segment.summaryToolActivity ~= nil then localizeActivityLabel(UseReactiveValueResult, Segment.summaryToolActivity, config, UseLocalizationResult.tool, UseContextResult) else UseLocalizationResult.taskCount
	
	local function v48(p1, LayoutOrder)
		-- upvalues: localizeActivityLabel (upval), LocalizationStringsModule (upval), config (copy), UseLocalizationResult (copy), UseContextResult (copy), createActivityText (upval)
		return if p1.kind == "tool_call" then createActivityText(localizeActivityLabel(LocalizationStringsModule.CHAT_TOOL, p1, config, UseLocalizationResult.tool, UseContextResult), LayoutOrder) else nil
	end
	
	local UseReactiveValueResult2 = useReactiveValue(Segment.isLoading or false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = nil
	local Callback = nil
	
	if FFlagBuildExperienceChatAccordionScrollAnchorModule then
		UseRefResult1 = ReactModule.useRef(nil)
		Callback = ReactModule.useContext(ChatScrollAnchorContextModule)
	end
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsUseReactiveValueResultMatch = UseReactiveValueResult == ChatConstantsModule.ASSISTANT_LOADING_TEXT
	local Current = ReactModule.useRef({ isThinking = false, startedAt = nil }).current
	
	if Current.isThinking ~= IsUseReactiveValueResultMatch then
		Current.isThinking = IsUseReactiveValueResultMatch
		Current.startedAt = nil
	end
	local v1 = nil
	
	if FFlagBuildExperiencePromptStallMessageModule then
		local Current1 = ReactModule.useRef({
			segment = nil,
			label = "",
			activityCount = 0,
			lastProgressAt = nil
		}).current
		local CountUseReactiveValueResult1 = #UseReactiveValueResult1
		
		if Current1.segment ~= Segment or Current1.label ~= UseReactiveValueResult or Current1.activityCount ~= CountUseReactiveValueResult1 then
			Current1.segment = Segment
			Current1.label = UseReactiveValueResult
			Current1.activityCount = CountUseReactiveValueResult1
			Current1.lastProgressAt = nil
		end
		v1 = Current1
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceChatAccordionScrollAnchorModule (upval), Callback (ref), UseRefResult1 (ref), UseStateResult2 (copy)
		if FFlagBuildExperienceChatAccordionScrollAnchorModule and Callback ~= nil and UseRefResult1 ~= nil then
			Callback(UseRefResult1.current)
		end
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, { Callback })
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
	local t1 = {}
	local Count = 0
	
	for i, value in UseReactiveValueResult1 do
		local v2 = v48(value, i)
		
		if v2 ~= nil then
			t1[`Tool{i}`] = v2
			Count += 1
		end
	end
	local HasNextEntry = next(t1) ~= nil
	local IsCountAbove = Count > 1
	local Element = nil
	
	if UseReactiveValueResult2 then
		local CreateElementFunction = ReactModule.createElement
		local config1 = {
			CurrentAction = createActivitySummaryActionText(if IsUseReactiveValueResultMatch then ClockBinding:map(function(StartedAt)
				-- upvalues: Current (copy), AssistantLoading (copy), FFlagBuildExperiencePromptStallMessageModule (upval), v75 (copy), AssistantTakingLonger (copy), ChatConstantsModule (upval), UseContextResult (copy), LocalizationStringsModule (upval), AssistantStillWorking (copy)
				if not Current.isThinking then
					return AssistantLoading
				end
				if Current.startedAt == nil then
					Current.startedAt = StartedAt
				end
				local Largest = math.max(0, StartedAt - Current.startedAt)
				
				if FFlagBuildExperiencePromptStallMessageModule and v75 ~= nil and AssistantTakingLonger ~= nil then
					local LastProgressAt = v75.lastProgressAt or StartedAt
					v75.lastProgressAt = LastProgressAt
					
					if ChatConstantsModule.PROMPT_STALL_SECONDS <= StartedAt - LastProgressAt then
						return AssistantTakingLonger
					end
				end
				local ASSISTANTSTATUSSWAPINTERVALSECONDS = ChatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS
				local FormatResult = if ChatConstantsModule.ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS <= Largest then UseContextResult:Format(LocalizationStringsModule.CHAT_THINKING_SECONDS, { SECONDS = math.max(0, (math.floor(Largest))) }) else AssistantLoading
				
				return if math.floor(Largest / ASSISTANTSTATUSSWAPINTERVALSECONDS) % 2 == 0 then FormatResult else AssistantStillWorking
			end) else TaskCount, 1, Frame.clockBinding, Segment.isWaitingForLocalTool ~= true)
		}
		local TaskCount = LocalizeActivityLabelResult
		local ClockBinding = Frame.clockBinding
		local v3 = v1
		local AssistantTakingLonger = if FFlagBuildExperiencePromptStallMessageModule and Segment.isWaitingForLocalTool ~= true then UseLocalizationResult.assistantTakingLonger else nil
		Element = CreateElementFunction(View, { LayoutOrder = 2, tag = "col fill gap-xxsmall auto-y" }, config1)
	else
		Element = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
			Text = LocalizeActivityLabelResult
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "TurnActivitySummary",
		LayoutOrder = Frame.LayoutOrder
	}, {
		ActivitySummary = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "TurnActivitySummary.Summary",
			ref = UseRefResult1,
			onActivated = if IsCountAbove then UseResult else nil,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Chevron = if IsCountAbove then ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				testId = "TurnActivitySummary.Chevron",
				name = if UseStateResult then IconName.ChevronLargeDown else IconName.ChevronLargeRight,
				size = IconSize.XSmall,
				style = UseTokensResult.Color.Content.Muted
			}) else nil,
			Label = Element
		}),
		ActivityHistory = if UseStateResult and HasNextEntry and IsCountAbove then ReactModule.createElement(ScrollView, {
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
			}, t1)
		}) else nil
	})
end