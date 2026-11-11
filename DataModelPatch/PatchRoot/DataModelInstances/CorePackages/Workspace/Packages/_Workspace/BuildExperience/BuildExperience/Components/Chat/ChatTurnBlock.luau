local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.chatTypes)
local TurnProjectionModule = require(BuildExperience.Chat.turnProjection)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local ReportTurnActivityGapModule = require(BuildExperience.Telemetry.reportTurnActivityGap)
local GetMarkdownRendererPropsModule = require(BuildExperience.utils.getMarkdownRendererProps)
local AgentPlanCardModule = require(BuildExperience.Components.AgentCard.AgentPlanCard)
local AnswerStackModule = require(BuildExperience.Components.AnswerStack.AnswerStack)
local OptionSelectorModule = require(BuildExperience.Components.AnswerStack.OptionSelector)
local AgentTurnFeedbackModule = require(script.Parent.AgentTurnFeedback)
local ChatUserMessageModule = require(script.Parent.ChatUserMessage)
local PlaytestCompletedCardModule = require(script.Parent.PlaytestCompletedCard)
local TurnActivitySummaryModule = require(script.Parent.TurnActivitySummary)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local MarkdownViewer = require(Parent.Markdown).Components.MarkdownViewer
local t = {}
local config = {
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {}
}

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

local function _(p1): boolean
	return typeof(p1) == "string" or typeof(p1) == "table" and #p1 > 0
end

local function AnswerStackSection(Frame)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), OptionSelectorModule (copy), AnswerStackModule (copy)
	local Prompt = Frame.prompt
	local Question = Prompt.question
	local CustomResponseText = Prompt.customResponseText
	local IsIsActive = Frame.isActive == true
	local IsMultiSelect = Question.responseType == "multi_select"
	local Next: string = if Prompt.isLastQuestion == false then "Next" else "Submit"
	local CreateElementFunction = ReactModule.createElement
	local config = {
		tag = "col gap-xsmall size-full-0 auto-y padding-top-small",
		LayoutOrder = Frame.LayoutOrder,
		testId = `ChatTurnBlock.AnswerStack.{Question.id}`
	}
	local config1 = {
		Question = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = Question.question
		})
	}
	local Element = nil
	
	if CustomResponseText == nil then
		if #Question.options > 0 then
			local SelectedOptionId = Prompt.selectedOptionId
			Element = ReactModule.createElement(AnswerStackModule, {
				LayoutOrder = 2,
				options = Question.options,
				selectedOptionId = Prompt.selectedOptionId,
				selectionMode = if IsMultiSelect then "multi" else "single",
				confirmLabel = Next,
				isConfirmDisabled = not (typeof(SelectedOptionId) == "string" or typeof(SelectedOptionId) == "table" and #SelectedOptionId > 0),
				onConfirm = if IsMultiSelect and IsIsActive then Frame.onAnswerConfirmed else nil,
				testId = `AnswerStack.{Question.id}`,
				onOptionSelected = function(p1)
					-- upvalues: Frame (copy), IsMultiSelect (copy), IsIsActive (copy), Question (copy), Prompt (copy)
					if Frame.onAnswerSelected == nil then return end
					if IsMultiSelect then
						if IsIsActive then
							Frame.onAnswerSelected(Question, p1)
						end
						return
					elseif Prompt.selectedOptionId == nil then
						Frame.onAnswerSelected(Question, p1)
					end
				end
			})
		else
			Element = nil
		end
	else
		Element = ReactModule.createElement(OptionSelectorModule, {
			LayoutOrder = 2,
			title = "Custom Answer",
			isSelected = true,
			description = CustomResponseText,
			testId = `AnswerStack.{Question.id}.CustomAnswer`,
			onActivated = function() end
		})
	end
	config1.Answers = Element
	
	return CreateElementFunction(View, config, config1)
end

local function PlanProposalSection(Frame: Frame)
	-- upvalues: ReactModule (copy), AgentPlanCardModule (copy), View (copy), ChatUserMessageModule (copy)
	local PlanProposal = Frame.planProposal
	local Element = ReactModule.createElement(AgentPlanCardModule, {
		layoutOrder = 1,
		testId = "ChatTurnBlock.PlanProposal",
		title = PlanProposal.title,
		textContent = PlanProposal.textContent,
		summary = PlanProposal.summary,
		onBuild = Frame.onPlanAccepted or function() end,
		isBuildDisabled = not (PlanProposal.isAccepted ~= true and PlanProposal.feedbackText == nil)
	})
	
	return if PlanProposal.feedbackText == nil then ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, { Plan = Element }) else ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Plan = Element,
		Feedback = ReactModule.createElement(ChatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = PlanProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(Frame)
	-- upvalues: useReactiveValue (copy), FoundationModule (copy), ReactModule (copy), GetMarkdownRendererPropsModule (copy), MarkdownViewer (copy)
	local UseReactiveValueResult = useReactiveValue(Frame.segment.text)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetMarkdownRendererPropsModule (upval), UseTokensResult (copy), Frame (copy)
		return GetMarkdownRendererPropsModule(UseTokensResult, Frame.markdownTextStyle)
	end, { UseTokensResult, Frame.markdownTextStyle })
	
	return if UseReactiveValueResult == "" then nil else ReactModule.createElement(MarkdownViewer, {
		Markdown = UseReactiveValueResult,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = Frame.LayoutOrder
		},
		MarkdownRendererProps = UseMemoResult
	})
end

local function renderClientToolSegment(Segment, LayoutOrder, p1)
	-- upvalues: ReactModule (copy), AnswerStackSection (copy), PlanProposalSection (copy)
	return if Segment.answerStackPrompt == nil then if Segment.planProposal == nil then nil else ReactModule.createElement(PlanProposalSection, {
		LayoutOrder = LayoutOrder,
		planProposal = Segment.planProposal,
		onPlanAccepted = if Segment.isActive then p1.onPlanAcceptedByToolCallId[Segment.toolCallId] else nil
	}) else ReactModule.createElement(AnswerStackSection, {
		LayoutOrder = LayoutOrder,
		prompt = Segment.answerStackPrompt,
		isActive = Segment.isActive,
		onAnswerSelected = if Segment.isActive then p1.onAnswerSelectedByToolCallId[Segment.toolCallId] else nil,
		onAnswerConfirmed = if Segment.isActive then p1.onAnswerConfirmedByToolCallId[Segment.toolCallId] else nil
	})
end

local function renderWorkSegment(Segment, LayoutOrder, MarkdownTextStyle, ClockBinding, LocalToolActions)
	-- upvalues: ReactModule (copy), AgentMessageSegment (copy), TurnActivitySummaryModule (copy), renderClientToolSegment (copy)
	return if Segment.kind == "agent_message" then ReactModule.createElement(AgentMessageSegment, {
		LayoutOrder = LayoutOrder,
		segment = Segment,
		markdownTextStyle = MarkdownTextStyle
	}) elseif Segment.kind == "activity_summary" then ReactModule.createElement(TurnActivitySummaryModule, {
		LayoutOrder = LayoutOrder,
		segment = Segment,
		clockBinding = ClockBinding
	}) elseif Segment.kind == "client_tool" then renderClientToolSegment(Segment, LayoutOrder, LocalToolActions) else nil
end

local function TurnWorkSegment(Frame)
	-- upvalues: useReactiveValue (copy), ReactModule (copy), FoundationModule (copy), renderWorkSegment (copy), View (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseReactiveValueResult = useReactiveValue(Frame.segment.label)
	local UseReactiveValueResult1 = useReactiveValue(Frame.segment.segments)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsDone = Frame.isDone
	local NoIsDone = not Frame.isDone or UseStateResult
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, {})
	local t = {}
	
	if NoIsDone then
		local Count = 1
		
		for _, value in UseReactiveValueResult1 do
			local RenderWorkSegmentResult = renderWorkSegment(value, Count, Frame.markdownTextStyle, Frame.clockBinding, Frame.localToolActions)
			
			if RenderWorkSegmentResult ~= nil then
				t[value.key] = RenderWorkSegmentResult
				Count += 1
			end
		end
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		testId = "ChatTurnBlock.TurnWork",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Summary = if IsDone then ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "ChatTurnBlock.TurnWork.Summary",
			onActivated = UseResult,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Chevron = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = if UseStateResult then IconName.ChevronLargeDown else IconName.ChevronLargeRight,
				size = IconSize.XSmall,
				style = UseTokensResult.Color.Content.Muted
			}),
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = UseReactiveValueResult
			})
		}) else nil,
		Work = if NoIsDone then ReactModule.createElement(View, {
			testId = "ChatTurnBlock.TurnWork.Content",
			LayoutOrder = if IsDone then 2 else 1,
			tag = {
				["col gap-xsmall size-full-0 auto-y padding-left-large"] = IsDone,
				["col gap-xsmall size-full-0 auto-y"] = not IsDone
			}
		}, t) else nil
	})
end

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), TurnProjectionModule (copy), ReportTurnActivityGapModule (copy), useReactiveValue (copy), t (copy), config (copy), FoundationModule (copy), SendBuildExperienceEventModule (copy), renderWorkSegment (copy), TurnWorkSegment (copy), PlaytestCompletedCardModule (copy), AgentTurnFeedbackModule (copy), View (copy)
	local Turn = Frame.turn
	local TurnState = Turn.turnState
	local TurnKey = Turn.turnKey
	local StartSequenceId = Turn.startSequenceId
	local EndSequenceId = Turn.endSequenceId
	local OptimisticLocalTools = Turn.optimisticLocalTools
	local SetupErrorText = Turn.setupErrorText
	local UniverseId = Turn.universeId
	local SessionId = Turn.sessionId
	local IsDone = Turn.isDone
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: TurnState (copy), TurnProjectionModule (upval), TurnKey (copy), UniverseId (copy), SessionId (copy), StartSequenceId (copy), EndSequenceId (copy), OptimisticLocalTools (copy), SetupErrorText (copy)
		return if TurnState == nil then if SetupErrorText == nil then TurnProjectionModule.projectLoadingTurnSegments({ turnKey = TurnKey }) else TurnProjectionModule.projectSetupErrorSegments(SetupErrorText, { turnKey = TurnKey }) else TurnProjectionModule.projectActiveTurnSegments(TurnState, {
			turnKey = TurnKey,
			universeId = UniverseId,
			sessionId = SessionId,
			startSequenceId = StartSequenceId,
			endSequenceId = EndSequenceId,
			optimisticLocalTools = OptimisticLocalTools
		})
	end, {
		TurnState, TurnKey, StartSequenceId, EndSequenceId, OptimisticLocalTools,
		SetupErrorText, UniverseId, SessionId
	})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: IsDone (copy), UseRefResult (copy), ReportTurnActivityGapModule (upval), UniverseId (copy)
		if IsDone then
			UseRefResult.current = nil
			
			return
		else
			local ClockTime = os.clock()
			ReportTurnActivityGapModule.log(if UseRefResult.current == nil then 0 else (ClockTime - UseRefResult.current) * 1000, UseRefResult.current == nil, UniverseId)
			UseRefResult.current = ClockTime
		end
	end, { IsDone, UseMemoResult, UniverseId })
	local UseReactiveValueResult = useReactiveValue(Turn.turnFeedbackIds or t)
	local LocalToolActions = Frame.localToolActions or config
	local Emphasis = FoundationModule.Hooks.useTokens().Color.Content.Emphasis
	local OnPlaytestFunction = Frame.onPlaytest
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SendBuildExperienceEventModule (upval), UseReactiveValueResult (copy), OnPlaytestFunction (copy)
		SendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = UseReactiveValueResult.universeId,
			placeId = UseReactiveValueResult.placeId,
			conversationId = UseReactiveValueResult.sessionId,
			messageId = UseReactiveValueResult.sequenceId
		})
		
		if OnPlaytestFunction ~= nil then
			OnPlaytestFunction()
		end
	end, { OnPlaytestFunction, UseReactiveValueResult })
	local Elements = {}
	local LayoutOrder = 1
	
	for _, Segment in UseMemoResult do
		local Element = nil
		
		if Segment.kind == "agent_message" or Segment.kind == "activity_summary" or Segment.kind == "client_tool" then
			Element = renderWorkSegment(Segment, LayoutOrder, Emphasis, Frame.clockBinding, LocalToolActions)
		elseif Segment.kind == "turn_work" then
			Element = ReactModule.createElement(TurnWorkSegment, {
				LayoutOrder = LayoutOrder,
				segment = Segment,
				isDone = IsDone,
				markdownTextStyle = Emphasis,
				clockBinding = Frame.clockBinding,
				localToolActions = LocalToolActions
			})
		elseif Segment.kind == "playtest_cta" and OnPlaytestFunction ~= nil then
			Element = ReactModule.createElement(PlaytestCompletedCardModule, {
				LayoutOrder = LayoutOrder,
				onPlaytest = UseResult,
				isLoading = Frame.isPlaytestLoading
			})
		end
		if Element ~= nil then
			Elements[Segment.key] = Element
			LayoutOrder += 1
		end
	end
	if IsDone then
		Elements.Feedback = ReactModule.createElement(AgentTurnFeedbackModule, {
			testId = "ChatTurnBlock.UserFeedback",
			LayoutOrder = LayoutOrder,
			turnFeedbackIds = UseReactiveValueResult
		})
	end
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Message = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xsmall size-full-0 auto-y"
		}, Elements)
	})
end)