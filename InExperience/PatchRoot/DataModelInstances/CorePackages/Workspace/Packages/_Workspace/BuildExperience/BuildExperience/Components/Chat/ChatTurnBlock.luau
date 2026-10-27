local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ChatPermissionsContextModule = require(BuildExperience.Chat.ChatPermissionsContext)
local ChatScrollAnchorContextModule = require(BuildExperience.Chat.ChatScrollAnchorContext)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local ChatCardEmphasisPositionProviderModule = require(script.Parent.ChatCardEmphasis.ChatCardEmphasisPositionProvider)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local AnswersCardContainerModule = if FFlagBuildExperienceAnswerFormModule then require(script.Parent.AnswersCardContainer) else nil
local TurnProjectionModule = require(BuildExperience.Chat.turnProjection)
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildAgentAdCampaignRefreshEligibilityModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)
local FFlagBuildEventsUpdate1Module = require(BuildExperience.Flags.FFlagBuildEventsUpdate1)
local FFlagBuildExperiencePlaytestCardPublishCtaModule = require(BuildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local ReportTurnActivityGapModule = require(BuildExperience.Telemetry.reportTurnActivityGap)
local GetMarkdownRendererPropsModule = require(BuildExperience.utils.getMarkdownRendererProps)
local AgentPlanCardModule = require(BuildExperience.Components.AgentCard.AgentPlanCard)
local AgentDevProductCardModule = if FFlagBuildExperienceManageDevProductModule then require(BuildExperience.Components.AgentCard.AgentDevProductCard) else nil
local AnswerStackModule = require(BuildExperience.Components.AnswerStack.AnswerStack)
local OptionSelectorModule = require(BuildExperience.Components.AnswerStack.OptionSelector)
local AgentTurnFeedbackModule = require(script.Parent.AgentTurnFeedback)
local ChatUserMessageModule = require(script.Parent.ChatUserMessage)
local PlaytestCompletedCardModule = require(script.Parent.PlaytestCompletedCard)
local UseIsPlaceVersionLiveModule = if FFlagBuildExperiencePlaytestCardPublishCtaModule then require(script.Parent.useIsPlaceVersionLive) else nil
local AdUpsellCardModule = if FFlagBuildAgentAdCampaignCardModule then require(BuildExperience.Components.Ads.AdUpsellCard) else nil
local AdCampaignIsActiveCardModule = if FFlagBuildAgentAdCampaignCardModule then require(BuildExperience.Components.Ads.AdCampaignIsActiveCard) else nil
local UseAgentAdCampaignTurnCardsModule = if FFlagBuildAgentAdCampaignCardModule then require(script.Parent.useAgentAdCampaignTurnCards) else nil
local TurnActivitySummaryModule = require(script.Parent.TurnActivitySummary)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local MarkdownViewer = require(Parent.Markdown).Components.MarkdownViewer
local t = {}
local config = {
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {},
	onDevProductApprovedByToolCallId = {},
	onDevProductRejectedByToolCallId = {}
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

local function _(): boolean
	-- upvalues: FFlagBuildCheckGamePermissionsModule (copy), ReactModule (copy), ChatPermissionsContextModule (copy)
	if FFlagBuildCheckGamePermissionsModule then
		local UseContextResult = ReactModule.useContext(ChatPermissionsContextModule)
		
		return UseContextResult ~= nil and not UseContextResult.canEditOnBuild
	else
		return false
	end
end

local _ = function(p1): boolean
	return typeof(p1) == "string" or typeof(p1) == "table" and #p1 > 0
end

local function AnswerStackSection(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildCheckGamePermissionsModule (copy), ReactModule (copy), ChatPermissionsContextModule (copy), View (copy), Text (copy), OptionSelectorModule (copy), AnswerStackModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		customAnswer = LocalizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
		next = LocalizationStringsModule.ANSWER_STACK_NEXT,
		submit = LocalizationStringsModule.ANSWER_STACK_SUBMIT
	})
	local NoCanEditOnBuild = nil
	
	if FFlagBuildCheckGamePermissionsModule then
		local UseContextResult = ReactModule.useContext(ChatPermissionsContextModule)
		NoCanEditOnBuild = UseContextResult ~= nil and not UseContextResult.canEditOnBuild
	else
		NoCanEditOnBuild = false
	end
	local Prompt = Frame.prompt
	local Question = Prompt.question
	local CustomResponseText = Prompt.customResponseText
	local NoNoCanEditOnBuild: boolean = Frame.isActive == true and not NoCanEditOnBuild
	local OnAnswerSelected = if NoCanEditOnBuild then nil else Frame.onAnswerSelected
	local IsMultiSelect = Question.responseType == "multi_select"
	local Next = if Prompt.isLastQuestion == false then UseLocalizationResult.next else UseLocalizationResult.submit
	local CreateElementFunction = ReactModule.createElement
	local config = {
		tag = "col gap-medium size-full-0 auto-y",
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
				onConfirm = if IsMultiSelect and NoNoCanEditOnBuild then Frame.onAnswerConfirmed else nil,
				testId = `AnswerStack.{Question.id}`,
				onOptionSelected = function(p1)
					-- upvalues: OnAnswerSelected (copy), IsMultiSelect (copy), NoNoCanEditOnBuild (copy), Question (copy), Prompt (copy)
					if OnAnswerSelected == nil then return end
					if IsMultiSelect then
						if NoNoCanEditOnBuild then
							OnAnswerSelected(Question, p1)
						end
						return
					elseif Prompt.selectedOptionId == nil then
						OnAnswerSelected(Question, p1)
					end
				end
			})
		else
			Element = nil
		end
	else
		Element = ReactModule.createElement(OptionSelectorModule, {
			LayoutOrder = 2,
			isSelected = true,
			title = UseLocalizationResult.customAnswer,
			description = CustomResponseText,
			testId = `AnswerStack.{Question.id}.CustomAnswer`,
			onActivated = function() end
		})
	end
	config1.Answers = Element
	
	return CreateElementFunction(View, config, config1)
end

local function PlanProposalSection(Frame: Frame)
	-- upvalues: FFlagBuildCheckGamePermissionsModule (copy), ReactModule (copy), ChatPermissionsContextModule (copy), AgentPlanCardModule (copy), View (copy), ChatUserMessageModule (copy)
	local NoCanEditOnBuild = nil
	if FFlagBuildCheckGamePermissionsModule then
		local UseContextResult = ReactModule.useContext(ChatPermissionsContextModule)
		NoCanEditOnBuild = UseContextResult ~= nil and not UseContextResult.canEditOnBuild
	else
		NoCanEditOnBuild = false
	end
	local PlanProposal = Frame.planProposal
	local Element = ReactModule.createElement(AgentPlanCardModule, {
		layoutOrder = 1,
		testId = "ChatTurnBlock.PlanProposal",
		title = PlanProposal.title,
		textContent = PlanProposal.textContent,
		summary = PlanProposal.summary,
		onBuild = Frame.onPlanAccepted or function() end,
		isBuildDisabled = not (PlanProposal.isAccepted ~= true and PlanProposal.feedbackText == nil) or NoCanEditOnBuild
	})
	
	return if PlanProposal.feedbackText == nil then ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, { Plan = Element }) else ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Plan = Element,
		Feedback = ReactModule.createElement(ChatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = PlanProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(Frame: Frame)
	-- upvalues: useReactiveValue (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), LocalizationRoactContext (copy), FoundationModule (copy), GetMarkdownRendererPropsModule (copy), View (copy), Icon (copy), IconName (copy), IconVariant (copy), IconSize (copy), Text (copy), MarkdownViewer (copy)
	local UseReactiveValueResult = useReactiveValue(Frame.segment.text)
	local UseLocalizationResult = UseLocalizationFunction({
		assistantResponseFailed = LocalizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED,
		assistantStopped = LocalizationStringsModule.CHAT_ASSISTANT_STOPPED
	})
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local AssistantResponseFailed = if UseReactiveValueResult == LocalizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED then UseLocalizationResult.assistantResponseFailed elseif UseReactiveValueResult == LocalizationStringsModule.CHAT_ASSISTANT_STOPPED then UseLocalizationResult.assistantStopped else UseReactiveValueResult
	
	if Frame.segment.errorCode ~= nil then
		AssistantResponseFailed = UseContextResult:Format(LocalizationStringsModule.CHAT_ERROR_CODE_TEXT, {
			ERROR_CODE = Frame.segment.errorCode,
			ERROR_TEXT = AssistantResponseFailed
		})
	end
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetMarkdownRendererPropsModule (upval), UseTokensResult (copy), Frame (copy)
		return GetMarkdownRendererPropsModule(UseTokensResult, Frame.markdownTextStyle)
	end, { UseTokensResult, Frame.markdownTextStyle })
	
	return if AssistantResponseFailed == "" then nil elseif Frame.segment.isError then ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		testId = "ChatTurnBlock.ErrorMessage",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			testId = "ChatTurnBlock.ErrorMessage.Icon",
			name = IconName.CircleX,
			variant = IconVariant.Filled,
			size = IconSize.Small,
			style = UseTokensResult.Color.System.Alert
		}),
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = AssistantResponseFailed
		})
	}) else ReactModule.createElement(MarkdownViewer, {
		Markdown = AssistantResponseFailed,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = Frame.LayoutOrder
		},
		MarkdownRendererProps = UseMemoResult
	})
end

local function PlaytestCardSection(Frame)
	-- upvalues: UseIsPlaceVersionLiveModule (copy), ReactModule (copy), PlaytestCompletedCardModule (copy)
	return ReactModule.createElement(PlaytestCompletedCardModule, {
		LayoutOrder = Frame.LayoutOrder,
		onPlaytest = Frame.onPlaytest,
		onPublish = Frame.onPublish,
		isPublishDisabled = UseIsPlaceVersionLiveModule(if Frame.onPublish == nil then nil else Frame.placeId, Frame.publishedVersionNumber) or Frame.isPublishDisabled == true,
		isPlaytestDisabled = Frame.isPlaytestDisabled,
		isLoading = Frame.isLoading
	})
end

local function DevProductProposalSection(Frame)
	-- upvalues: FFlagBuildCheckGamePermissionsModule (copy), ReactModule (copy), ChatPermissionsContextModule (copy), View (copy), AgentDevProductCardModule (copy)
	local NoCanEditOnBuild = nil
	if FFlagBuildCheckGamePermissionsModule then
		local UseContextResult = ReactModule.useContext(ChatPermissionsContextModule)
		NoCanEditOnBuild = UseContextResult ~= nil and not UseContextResult.canEditOnBuild
	else
		NoCanEditOnBuild = false
	end
	local DevProductProposal = Frame.devProductProposal
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		DevProduct = ReactModule.createElement(AgentDevProductCardModule, {
			layoutOrder = 1,
			testId = "ChatTurnBlock.DevProductProposal",
			action = DevProductProposal.action,
			name = DevProductProposal.name,
			description = DevProductProposal.description,
			priceInRobux = DevProductProposal.priceInRobux,
			productId = DevProductProposal.productId,
			imageAssetId = DevProductProposal.imageAssetId,
			productType = DevProductProposal.productType,
			itemKind = DevProductProposal.itemKind,
			itemId = DevProductProposal.itemId,
			cancelRenewals = DevProductProposal.cancelRenewals,
			onApprove = Frame.onApprove or function() end,
			onReject = Frame.onReject or function() end,
			isActionDisabled = not (DevProductProposal.isApproved ~= true and DevProductProposal.isRejected ~= true),
			isReadOnly = NoCanEditOnBuild,
			isPending = DevProductProposal.isPending,
			hasError = DevProductProposal.hasError,
			errorCause = DevProductProposal.errorCause,
			canRetry = DevProductProposal.canRetry
		})
	})
end

local function renderClientToolSegment(Segment, LayoutOrder, p1)
	-- upvalues: FFlagBuildExperienceAnswerFormModule (copy), ReactModule (copy), AnswersCardContainerModule (copy), AnswerStackSection (copy), PlanProposalSection (copy), FFlagBuildExperienceManageDevProductModule (copy), DevProductProposalSection (copy)
	return if FFlagBuildExperienceAnswerFormModule and Segment.answeredPrompts ~= nil then ReactModule.createElement(AnswersCardContainerModule, {
		LayoutOrder = LayoutOrder,
		prompts = Segment.answeredPrompts
	}) elseif FFlagBuildExperienceAnswerFormModule and Segment.answerStackPrompt ~= nil then nil elseif Segment.answerStackPrompt == nil then if Segment.planProposal == nil then if FFlagBuildExperienceManageDevProductModule and Segment.devProductProposal ~= nil then ReactModule.createElement(DevProductProposalSection, {
		LayoutOrder = LayoutOrder,
		devProductProposal = Segment.devProductProposal,
		onApprove = if Segment.isActive then p1.onDevProductApprovedByToolCallId[Segment.toolCallId] else nil,
		onReject = if Segment.isActive then p1.onDevProductRejectedByToolCallId[Segment.toolCallId] else nil
	}) else nil else ReactModule.createElement(PlanProposalSection, {
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
	-- upvalues: useReactiveValue (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), ChatScrollAnchorContextModule (copy), FoundationModule (copy), renderWorkSegment (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), ChatCardEmphasisPositionProviderModule (copy), View (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseReactiveValueResult = useReactiveValue(Frame.segment.label or "")
	local WorkedDurationSeconds: number = Frame.segment.workedDurationSeconds
	local Largest = if WorkedDurationSeconds == nil then nil else math.max(0, (math.floor(WorkedDurationSeconds + 0.5)))
	local ActionCount = Frame.segment.actionCount or 0
	local UseLocalizationResult = UseLocalizationFunction({
		summary = if Largest == nil or Largest >= 60 then if Largest == nil then if ActionCount == 1 then LocalizationStringsModule.CHAT_ONE_TASK_COMPLETED elseif ActionCount > 1 then {
			LocalizationStringsModule.CHAT_TASKS_COMPLETED,
			NUM_COMPLETED_TASKS = ActionCount
		} else nil else {
			LocalizationStringsModule.CHAT_WORKED_MINUTES_SECONDS,
			MINUTES = math.floor(Largest / 60),
			REM_SECONDS = Largest % 60
		} else {
			LocalizationStringsModule.CHAT_WORKED_SECONDS,
			SECONDS = Largest
		},
		turnActivity = LocalizationStringsModule.CHAT_TURN_ACTIVITY
	})
	local TurnActivity = if Largest == nil and ActionCount <= 0 then if UseReactiveValueResult == LocalizationStringsModule.CHAT_TURN_ACTIVITY then UseLocalizationResult.turnActivity else UseReactiveValueResult else UseLocalizationResult.summary
	local UseReactiveValueResult1 = useReactiveValue(Frame.segment.segments)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = nil
	local Callback = nil
	
	if FFlagBuildExperienceChatAccordionScrollAnchorModule then
		UseRefResult = ReactModule.useRef(nil)
		Callback = ReactModule.useContext(ChatScrollAnchorContextModule)
	end
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsDone = Frame.isDone
	local NoIsDone = not Frame.isDone or UseStateResult
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceChatAccordionScrollAnchorModule (upval), Callback (ref), UseRefResult (ref), UseStateResult2 (copy)
		if FFlagBuildExperienceChatAccordionScrollAnchorModule and Callback ~= nil and UseRefResult ~= nil then
			Callback(UseRefResult.current)
		end
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, { Callback })
	local Elements = {}
	
	if NoIsDone then
		local ChildOrder = 1
		
		for _, value in UseReactiveValueResult1 do
			local RenderWorkSegmentResult = renderWorkSegment(value, ChildOrder, Frame.markdownTextStyle, Frame.clockBinding, Frame.localToolActions)
			
			if RenderWorkSegmentResult ~= nil then
				if FFlagBuildExperienceChatCardEmphasisModule then
					RenderWorkSegmentResult = ReactModule.createElement(ChatCardEmphasisPositionProviderModule, { childOrder = ChildOrder }, RenderWorkSegmentResult)
				end
				Elements[value.key] = RenderWorkSegmentResult
				ChildOrder += 1
			end
		end
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = "ChatTurnBlock.TurnWork",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Summary = if IsDone then ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "ChatTurnBlock.TurnWork.Summary",
			ref = UseRefResult,
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
				Text = TurnActivity
			})
		}) else nil,
		Work = if NoIsDone then ReactModule.createElement(View, {
			testId = "ChatTurnBlock.TurnWork.Content",
			LayoutOrder = if IsDone then 2 else 1,
			tag = {
				["col gap-xlarge size-full-0 auto-y padding-left-large"] = IsDone,
				["col gap-xlarge size-full-0 auto-y"] = not IsDone
			}
		}, Elements) else nil
	})
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ReactModule (copy), TurnProjectionModule (copy), ReportTurnActivityGapModule (copy), useReactiveValue (copy), t (copy), FFlagBuildAgentAdCampaignCardModule (copy), UseAgentAdCampaignTurnCardsModule (copy), config (copy), FoundationModule (copy), FFlagBuildCheckGamePermissionsModule (copy), ChatPermissionsContextModule (copy), SendBuildExperienceEventModule (copy), FFlagBuildEventsUpdate1Module (copy), renderWorkSegment (copy), TurnWorkSegment (copy), FFlagBuildExperiencePlaytestCardPublishCtaModule (copy), PlaytestCardSection (copy), PlaytestCompletedCardModule (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), AdCampaignIsActiveCardModule (copy), AdUpsellCardModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), ChatCardEmphasisPositionProviderModule (copy), View (copy), AgentTurnFeedbackModule (copy)
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
	local IsLatestPublishTurn = Turn.isLatestPublishTurn
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: TurnState (copy), TurnProjectionModule (upval), TurnKey (copy), UniverseId (copy), SessionId (copy), StartSequenceId (copy), EndSequenceId (copy), OptimisticLocalTools (copy), IsLatestPublishTurn (copy), SetupErrorText (copy)
		return if TurnState == nil then if SetupErrorText == nil then TurnProjectionModule.projectLoadingTurnSegments({ turnKey = TurnKey }) else TurnProjectionModule.projectSetupErrorSegments(SetupErrorText, { turnKey = TurnKey }) else TurnProjectionModule.projectActiveTurnSegments(TurnState, {
			turnKey = TurnKey,
			universeId = UniverseId,
			sessionId = SessionId,
			startSequenceId = StartSequenceId,
			endSequenceId = EndSequenceId,
			optimisticLocalTools = OptimisticLocalTools,
			showPlaytestCta = IsLatestPublishTurn
		})
	end, {
		TurnState, TurnKey, StartSequenceId, EndSequenceId, OptimisticLocalTools,
		SetupErrorText, UniverseId, SessionId, IsLatestPublishTurn
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
	local UseAgentAdCampaignTurnCardsModuleResult = if FFlagBuildAgentAdCampaignCardModule then UseAgentAdCampaignTurnCardsModule({
		segments = UseMemoResult,
		sessionId = SessionId,
		universeId = UniverseId,
		isPageVisible = Frame.isPageVisible,
		scrollingFrameRef = Frame.scrollingFrameRef,
		getCardState = Frame.getAgentAdCampaignCardState,
		isCreateDisabled = Frame.isAgentAdCampaignCreateDisabled,
		onOfferSelected = Frame.onAgentAdCampaignOfferSelected
	}) else {}
	local LocalToolActions = Frame.localToolActions or config
	local Emphasis = FoundationModule.Hooks.useTokens().Color.Content.Emphasis
	local FinalAssistantMessageText = if TurnState == nil then nil else TurnProjectionModule.getFinalAssistantMessageText(TurnState)
	local UseContextResult = if FFlagBuildCheckGamePermissionsModule then ReactModule.useContext(ChatPermissionsContextModule) else nil
	local NoCanEdit: boolean = UseContextResult ~= nil and not UseContextResult.canEdit
	local NoCanPublish: boolean = UseContextResult ~= nil and not UseContextResult.canPublish
	local OnPlaytestFunction = Frame.onPlaytest
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SendBuildExperienceEventModule (upval), UseReactiveValueResult (copy), FFlagBuildEventsUpdate1Module (upval), OnPlaytestFunction (copy)
		SendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = UseReactiveValueResult.universeId,
			placeId = UseReactiveValueResult.placeId,
			conversationId = UseReactiveValueResult.sessionId,
			messageId = UseReactiveValueResult.sequenceId
		}, if FFlagBuildEventsUpdate1Module then { context = "chat_widget" } else nil)
		
		if OnPlaytestFunction ~= nil then
			OnPlaytestFunction()
		end
	end, { OnPlaytestFunction, UseReactiveValueResult })
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), OnPlaytestFunction (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), UseReactiveValueResult (copy)
		if UseRefResult1.current or OnPlaytestFunction == nil then return end
		local Flag = false
		
		for _, value in UseMemoResult do
			if value.kind == "playtest_cta" then
				Flag = true
				break
			end
		end
		if Flag then
			UseRefResult1.current = true
			SendBuildExperienceEventModule("PLAYTEST_IMPRESSION", {
				universeId = UseReactiveValueResult.universeId,
				placeId = UseReactiveValueResult.placeId,
				conversationId = UseReactiveValueResult.sessionId,
				messageId = UseReactiveValueResult.sequenceId
			})
			
			return
		end
	end, {
		UseMemoResult,
		OnPlaytestFunction,
		UseReactiveValueResult
	})
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
			Element = if FFlagBuildExperiencePlaytestCardPublishCtaModule then ReactModule.createElement(PlaytestCardSection, {
				LayoutOrder = LayoutOrder,
				onPlaytest = UseResult,
				onPublish = Frame.onPublish,
				isLoading = Frame.isPlaytestLoading,
				isPlaytestDisabled = NoCanEdit,
				isPublishDisabled = NoCanPublish,
				placeId = UseReactiveValueResult.placeId,
				publishedVersionNumber = UseReactiveValueResult.publishedVersionNumber
			}) else ReactModule.createElement(PlaytestCompletedCardModule, {
				LayoutOrder = LayoutOrder,
				onPlaytest = UseResult,
				isLoading = Frame.isPlaytestLoading,
				isPlaytestDisabled = NoCanEdit
			})
		elseif Segment.kind == "agent_ad_campaign_card" and FFlagBuildAgentAdCampaignCardModule then
			local UseAgentAdCampaignTurnCardsModuleResultEntry = UseAgentAdCampaignTurnCardsModuleResult[Segment.toolCallId]
			local State = UseAgentAdCampaignTurnCardsModuleResultEntry.state
			local State1 = State
			
			if FFlagBuildAgentAdCampaignRefreshEligibilityModule and State1 ~= nil and State1.campaignId == nil then
				State1 = nil
			end
			if State1 == nil then
				if Segment.offers ~= nil and not UseAgentAdCampaignTurnCardsModuleResultEntry.isPending then
					Element = ReactModule.createElement(AdUpsellCardModule, {
						LayoutOrder = LayoutOrder,
						freePromotionsRemaining = Segment.availableCreditsSnapshot,
						isCreatePending = if FFlagBuildAgentAdCampaignRefreshEligibilityModule and State ~= nil then State.eligibilityStatus == "loading" else nil,
						eligibilityError = if FFlagBuildAgentAdCampaignRefreshEligibilityModule and State ~= nil and State.eligibilityStatus ~= "loading" then State.eligibilityStatus else nil,
						fundingType = UseAgentAdCampaignTurnCardsModuleResultEntry.fundingType,
						containerRef = UseAgentAdCampaignTurnCardsModuleResultEntry.cardRef,
						isCreateDisabled = UseAgentAdCampaignTurnCardsModuleResultEntry.isCreateDisabled,
						onCreate = UseAgentAdCampaignTurnCardsModuleResultEntry.onCreate
					})
				end
			else
				Element = ReactModule.createElement(AdCampaignIsActiveCardModule, {
					LayoutOrder = LayoutOrder,
					variant = State1.variant,
					campaignStartDate = State1.campaignStartDate,
					campaignEndDate = State1.campaignEndDate,
					isDisabled = Frame.onAgentAdCampaignActive == nil,
					onActivated = function()
						-- upvalues: Frame (copy)
						if Frame.onAgentAdCampaignActive ~= nil then
							Frame.onAgentAdCampaignActive()
						end
					end
				})
			end
		end
		if Element ~= nil then
			if FFlagBuildExperienceChatCardEmphasisModule then
				Element = ReactModule.createElement(ChatCardEmphasisPositionProviderModule, {
					messageOrder = Frame.LayoutOrder or 0,
					segmentOrder = LayoutOrder
				}, Element)
			end
			Elements[Segment.key] = Element
			LayoutOrder += 1
		end
	end
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Message = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xsmall size-full-0 auto-y",
			testId = "ChatTurnBlock.Message"
		}, {
			Content = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col gap-xlarge size-full-0 auto-y",
				testId = "ChatTurnBlock.Message.Content"
			}, Elements),
			Feedback = if IsDone then ReactModule.createElement(AgentTurnFeedbackModule, {
				LayoutOrder = 2,
				testId = "ChatTurnBlock.UserFeedback",
				messageText = FinalAssistantMessageText,
				turnFeedbackIds = UseReactiveValueResult
			}) else nil
		})
	})
end)