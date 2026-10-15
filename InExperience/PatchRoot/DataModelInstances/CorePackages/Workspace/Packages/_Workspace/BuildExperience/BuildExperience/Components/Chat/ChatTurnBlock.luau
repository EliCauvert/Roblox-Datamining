local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local markdownModule = require(parent.Markdown)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationRoactContext = localizationModule.LocalizationRoactContext
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local chatScrollAnchorContextModule = require(buildExperience.Chat.ChatScrollAnchorContext)
local chatCardEmphasisPositionProviderModule = require(script.Parent.ChatCardEmphasis.ChatCardEmphasisPositionProvider)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceAnswerFormModule = require(buildExperience.Flags.FFlagBuildExperienceAnswerForm)
local var1 = if fFlagBuildExperienceAnswerFormModule then require(script.Parent.AnswersCardContainer) else nil
local turnProjectionModule = require(buildExperience.Chat.turnProjection)
local fFlagBuildExperienceChatAccordionScrollAnchorModule = require(buildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local fFlagBuildAgentAdCampaignRefreshEligibilityModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local fFlagBuildExperiencePlaytestCardPublishCtaModule = require(buildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local reportTurnActivityGapModule = require(buildExperience.Telemetry.reportTurnActivityGap)
local getMarkdownRendererPropsModule = require(buildExperience.utils.getMarkdownRendererProps)
local agentPlanCardModule = require(buildExperience.Components.AgentCard.AgentPlanCard)
local var2 = if fFlagBuildExperienceManageDevProductModule then require(buildExperience.Components.AgentCard.AgentDevProductCard) else nil
local answerStackModule = require(buildExperience.Components.AnswerStack.AnswerStack)
local optionSelectorModule = require(buildExperience.Components.AnswerStack.OptionSelector)
local agentTurnFeedbackModule = require(script.Parent.AgentTurnFeedback)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)
local playtestCompletedCardModule = require(script.Parent.PlaytestCompletedCard)
local var3 = if fFlagBuildExperiencePlaytestCardPublishCtaModule then require(script.Parent.useIsPlaceVersionLive) else nil
local var4 = if fFlagBuildAgentAdCampaignCardModule then require(buildExperience.Components.Ads.AdUpsellCard) else nil
local var5 = if fFlagBuildAgentAdCampaignCardModule then require(buildExperience.Components.Ads.AdCampaignIsActiveCard) else nil
local var6 = if fFlagBuildAgentAdCampaignCardModule then require(script.Parent.useAgentAdCampaignTurnCards) else nil
local turnActivitySummaryModule = require(script.Parent.TurnActivitySummary)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local markdownViewer = markdownModule.Components.MarkdownViewer
local t = {}
local t_1 = {
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {},
	onDevProductApprovedByToolCallId = {},
	onDevProductRejectedByToolCallId = {}
}

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

local function _(p1)
	return typeof(p1) == "string" or (typeof(p1) == "table" and #p1 > 0)
end

local function AnswerStackSection(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), optionSelectorModule (ref), answerStackModule (ref)
	local var7
	local var8 = useLocalization({
		customAnswer = localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
		next = localizationStringsModule.ANSWER_STACK_NEXT,
		submit = localizationStringsModule.ANSWER_STACK_SUBMIT
	})
	local prompt = p1.prompt
	local question = prompt.question
	local customResponseText = prompt.customResponseText
	local var9 = p1.isActive == true
	local isMultiSelect = question.responseType == "multi_select"
	local var10 = if prompt.isLastQuestion == false then var8.next else var8.submit
	local createElement = reactModule.createElement
	local t = {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		testId = `ChatTurnBlock.AnswerStack.{question.id}`
	}
	local t_1 = {
		Question = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = question.question
		})
	}
	
	if customResponseText ~= nil then
		var7 = reactModule.createElement(optionSelectorModule, {
			LayoutOrder = 2,
			isSelected = true,
			title = var8.customAnswer,
			description = customResponseText,
			testId = `AnswerStack.{question.id}.CustomAnswer`,
			onActivated = function() end
		})
	elseif #question.options > 0 then
		var7 = reactModule.createElement
		local var11 = answerStackModule
		local t_2 = {
			LayoutOrder = 2,
			options = question.options,
			selectedOptionId = prompt.selectedOptionId,
			selectionMode = if isMultiSelect then "multi" else "single",
			confirmLabel = var10
		}
		local selectedOptionId = prompt.selectedOptionId
		t_2.isConfirmDisabled = not (typeof(selectedOptionId) == "string" or (typeof(selectedOptionId) ~= "table" and #selectedOptionId > 0))
		t_2.onConfirm = if isMultiSelect and var9 then p1.onAnswerConfirmed else nil
		t_2.testId = `AnswerStack.{question.id}`
		
		function t_2.onOptionSelected(p2)
			-- upvalues: p1 (ref), isMultiSelect (ref), var9 (ref), question (ref), prompt (ref)
			if p1.onAnswerSelected == nil then return end
			if isMultiSelect then
				if var9 then
					p1.onAnswerSelected(question, p2)
				end
				return
			elseif prompt.selectedOptionId == nil then
				p1.onAnswerSelected(question, p2)
			end
		end
		
		var7 = var7(var11, t_2)
	else
		var7 = nil
	end
	t_1.Answers = var7
	
	return createElement(view, t, t_1)
end

local function PlanProposalSection(p1)
	-- upvalues: reactModule (ref), agentPlanCardModule (ref), view (ref), chatUserMessageModule (ref)
	local planProposal = p1.planProposal
	local var7 = reactModule.createElement(agentPlanCardModule, {
		layoutOrder = 1,
		testId = "ChatTurnBlock.PlanProposal",
		title = planProposal.title,
		textContent = planProposal.textContent,
		summary = planProposal.summary,
		onBuild = p1.onPlanAccepted or function() end,
		isBuildDisabled = not (planProposal.isAccepted ~= true and planProposal.feedbackText == nil)
	})
	
	return if planProposal.feedbackText == nil then reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, { Plan = var7 }) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Plan = var7,
		Feedback = reactModule.createElement(chatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = planProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(p1)
	-- upvalues: useReactiveValue (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), foundationModule (ref), getMarkdownRendererPropsModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), text (ref), markdownViewer (ref)
	local var7 = useReactiveValue(p1.segment.text)
	local _ = nil
	local var8 = useLocalization({
		assistantResponseFailed = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED,
		assistantStopped = localizationStringsModule.CHAT_ASSISTANT_STOPPED
	})
	local var9 = reactModule.useContext(localizationRoactContext)
	local var10 = if var7 == localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED then var8.assistantResponseFailed elseif var7 == localizationStringsModule.CHAT_ASSISTANT_STOPPED then var8.assistantStopped else var7
	
	if p1.segment.errorCode ~= nil then
		var10 = var9:Format(localizationStringsModule.CHAT_ERROR_CODE_TEXT, { ERROR_CODE = p1.segment.errorCode, ERROR_TEXT = var10 })
	end
	local var11 = foundationModule.Hooks.useTokens()
	
	return if var10 == "" then nil elseif p1.segment.isError then reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		testId = "ChatTurnBlock.ErrorMessage",
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			testId = "ChatTurnBlock.ErrorMessage.Icon",
			name = iconName.CircleX,
			variant = iconVariant.Filled,
			size = iconSize.Small,
			style = var11.Color.System.Alert
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = var10
		})
	}) else reactModule.createElement(markdownViewer, {
		Markdown = var10,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = p1.LayoutOrder
		},
		MarkdownRendererProps = reactModule.useMemo(function()
			-- upvalues: getMarkdownRendererPropsModule (copy), var11 (ref), p1 (ref)
			return getMarkdownRendererPropsModule(var11, p1.markdownTextStyle)
		end, { var11, p1.markdownTextStyle })
	})
end

local function PlaytestCardSection(p1)
	-- upvalues: var3 (ref), reactModule (ref), playtestCompletedCardModule (ref)
	return reactModule.createElement(playtestCompletedCardModule, {
		LayoutOrder = p1.LayoutOrder,
		onPlaytest = p1.onPlaytest,
		onPublish = p1.onPublish,
		isPublishDisabled = var3(if p1.onPublish ~= nil then nil else p1.placeId, p1.publishedVersionNumber),
		isLoading = p1.isLoading
	})
end

local function DevProductProposalSection(p1)
	-- upvalues: reactModule (ref), view (ref), var2 (ref)
	local devProductProposal = p1.devProductProposal
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		DevProduct = reactModule.createElement(var2, {
			layoutOrder = 1,
			testId = "ChatTurnBlock.DevProductProposal",
			action = devProductProposal.action,
			name = devProductProposal.name,
			description = devProductProposal.description,
			priceInRobux = devProductProposal.priceInRobux,
			productId = devProductProposal.productId,
			imageAssetId = devProductProposal.imageAssetId,
			onApprove = p1.onApprove or function() end,
			onReject = p1.onReject or function() end,
			isActionDisabled = not (devProductProposal.isApproved ~= true and devProductProposal.isRejected ~= true),
			isPending = devProductProposal.isPending,
			hasError = devProductProposal.hasError,
			canRetry = devProductProposal.canRetry
		})
	})
end

local function renderClientToolSegment(p1, p2, p3)
	-- upvalues: fFlagBuildExperienceAnswerFormModule (ref), reactModule (ref), var1 (ref), AnswerStackSection (ref), PlanProposalSection (ref), fFlagBuildExperienceManageDevProductModule (ref), DevProductProposalSection (ref)
	return if fFlagBuildExperienceAnswerFormModule and p1.answeredPrompts ~= nil then reactModule.createElement(var1, { LayoutOrder = p2, prompts = p1.answeredPrompts }) elseif fFlagBuildExperienceAnswerFormModule and p1.answerStackPrompt ~= nil then nil elseif p1.answerStackPrompt == nil then if p1.planProposal == nil then if fFlagBuildExperienceManageDevProductModule and p1.devProductProposal ~= nil then reactModule.createElement(DevProductProposalSection, {
		LayoutOrder = p2,
		devProductProposal = p1.devProductProposal,
		onApprove = if p1.isActive then p3.onDevProductApprovedByToolCallId[p1.toolCallId] else nil,
		onReject = if p1.isActive then p3.onDevProductRejectedByToolCallId[p1.toolCallId] else nil
	}) else nil else reactModule.createElement(PlanProposalSection, {
		LayoutOrder = p2,
		planProposal = p1.planProposal,
		onPlanAccepted = if p1.isActive then p3.onPlanAcceptedByToolCallId[p1.toolCallId] else nil
	}) else reactModule.createElement(AnswerStackSection, {
		LayoutOrder = p2,
		prompt = p1.answerStackPrompt,
		isActive = p1.isActive,
		onAnswerSelected = if p1.isActive then p3.onAnswerSelectedByToolCallId[p1.toolCallId] else nil,
		onAnswerConfirmed = if p1.isActive then p3.onAnswerConfirmedByToolCallId[p1.toolCallId] else nil
	})
end

local function renderWorkSegment(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), AgentMessageSegment (ref), turnActivitySummaryModule (ref), renderClientToolSegment (ref)
	return if p1.kind == "agent_message" then reactModule.createElement(AgentMessageSegment, {
		LayoutOrder = p2,
		segment = p1,
		markdownTextStyle = p3
	}) elseif p1.kind == "activity_summary" then reactModule.createElement(turnActivitySummaryModule, { LayoutOrder = p2, segment = p1, clockBinding = p4 }) elseif p1.kind == "client_tool" then renderClientToolSegment(p1, p2, p5) else nil
end

local function TurnWorkSegment(p1)
	-- upvalues: useReactiveValue (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref), chatScrollAnchorContextModule (ref), foundationModule (ref), renderWorkSegment (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), chatCardEmphasisPositionProviderModule (ref), view (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local _ = nil
	local var7 = useReactiveValue(p1.segment.label or "")
	local workedDurationSeconds = p1.segment.workedDurationSeconds
	local var8 = if workedDurationSeconds ~= nil then nil else math.max(0, math.floor(workedDurationSeconds + 0.5))
	local actionCount = p1.segment.actionCount or 0
	local var9 = useLocalization({
		summary = if var8 == nil or var8 >= 60 then if var8 ~= nil then if actionCount == 1 then localizationStringsModule.CHAT_ONE_TASK_COMPLETED elseif actionCount > 1 then {
			localizationStringsModule.CHAT_TASKS_COMPLETED,
			NUM_COMPLETED_TASKS = actionCount
		} else nil else {
			localizationStringsModule.CHAT_WORKED_MINUTES_SECONDS,
			MINUTES = math.floor(var8 / 60),
			REM_SECONDS = var8 % 60
		} else {
			localizationStringsModule.CHAT_WORKED_SECONDS,
			SECONDS = var8
		},
		turnActivity = localizationStringsModule.CHAT_TURN_ACTIVITY
	})
	local var10 = if var8 == nil and actionCount <= 0 then if var7 == localizationStringsModule.CHAT_TURN_ACTIVITY then var9.turnActivity else var7 else var9.summary
	local var11 = useReactiveValue(p1.segment.segments)
	local var12, var13 = reactModule.useState(false)
	local var14 = nil
	local var15 = nil
	
	if fFlagBuildExperienceChatAccordionScrollAnchorModule then
		var14 = reactModule.useRef(nil)
		var15 = reactModule.useContext(chatScrollAnchorContextModule)
	end
	local var16 = foundationModule.Hooks.useTokens()
	local isDone = p1.isDone
	local var17 = not p1.isDone or var12
	local var18 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceChatAccordionScrollAnchorModule (copy), var15 (write), var14 (write), var13 (ref)
		if fFlagBuildExperienceChatAccordionScrollAnchorModule and var15 ~= nil and var14 ~= nil then
			var15(var14.current)
		end
		var13(function(p2)
			return not p2
		end)
	end, { var15 })
	local t = {}
	
	if var17 then
		local var19 = 1
		
		for i, v in var11 do
			local var20 = renderWorkSegment(v, var19, p1.markdownTextStyle, p1.clockBinding, p1.localToolActions)
			
			if var20 ~= nil then
				if fFlagBuildExperienceChatCardEmphasisModule then
					var20 = reactModule.createElement(chatCardEmphasisPositionProviderModule, { childOrder = var19 }, var20)
				end
				t[v.key] = var20
				var19 += 1
			end
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = "ChatTurnBlock.TurnWork",
		LayoutOrder = p1.LayoutOrder
	}, {
		Summary = if isDone then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "ChatTurnBlock.TurnWork.Summary",
			ref = var14,
			onActivated = var18,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = if var12 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var16.Color.Content.Muted
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var10
			})
		}) else nil,
		Work = if var17 then reactModule.createElement(view, {
			testId = "ChatTurnBlock.TurnWork.Content",
			LayoutOrder = if isDone then 2 else 1,
			tag = {
				["col gap-xlarge size-full-0 auto-y padding-left-large"] = isDone,
				["col gap-xlarge size-full-0 auto-y"] = not isDone
			}
		}, t) else nil
	})
end

return reactModule.memo(function(p2)
	-- upvalues: reactModule (ref), turnProjectionModule (ref), reportTurnActivityGapModule (ref), useReactiveValue (ref), t (ref), fFlagBuildAgentAdCampaignCardModule (ref), var6 (ref), t_1 (ref), foundationModule (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), renderWorkSegment (ref), TurnWorkSegment (ref), fFlagBuildExperiencePlaytestCardPublishCtaModule (ref), PlaytestCardSection (ref), playtestCompletedCardModule (ref), fFlagBuildAgentAdCampaignRefreshEligibilityModule (ref), var5 (ref), var4 (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), chatCardEmphasisPositionProviderModule (ref), view (ref), agentTurnFeedbackModule (ref)
	local turn = p2.turn
	local turnState = turn.turnState
	local turnKey = turn.turnKey
	local startSequenceId = turn.startSequenceId
	local endSequenceId = turn.endSequenceId
	local optimisticLocalTools = turn.optimisticLocalTools
	local setupErrorText = turn.setupErrorText
	local universeId = turn.universeId
	local sessionId = turn.sessionId
	local isDone = turn.isDone
	local isLatestPublishTurn = turn.isLatestPublishTurn
	local var21 = reactModule.useMemo(function()
		-- upvalues: turnState (ref), turnProjectionModule (copy), turnKey (ref), universeId (ref), sessionId (ref), startSequenceId (ref), endSequenceId (ref), optimisticLocalTools (ref), isLatestPublishTurn (ref), setupErrorText (ref)
		return if turnState == nil then if setupErrorText == nil then turnProjectionModule.projectLoadingTurnSegments({ turnKey = turnKey }) else turnProjectionModule.projectSetupErrorSegments(setupErrorText, { turnKey = turnKey }) else turnProjectionModule.projectActiveTurnSegments(turnState, {
			turnKey = turnKey,
			universeId = universeId,
			sessionId = sessionId,
			startSequenceId = startSequenceId,
			endSequenceId = endSequenceId,
			optimisticLocalTools = optimisticLocalTools,
			showPlaytestCta = isLatestPublishTurn
		})
	end, {
		turnState, turnKey, startSequenceId, endSequenceId, optimisticLocalTools,
		setupErrorText, universeId, sessionId, isLatestPublishTurn
	})
	local var22 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: isDone (ref), var22 (ref), reportTurnActivityGapModule (copy), universeId (ref)
		if isDone then
			var22.current = nil
			
			return
		end
		local processTime = os.clock()
		reportTurnActivityGapModule.log(if var22.current ~= nil then 0 else (processTime - var22.current) * 1000, var22.current == nil, universeId)
		var22.current = processTime
	end, { isDone, var21, universeId })
	local var23 = useReactiveValue(turn.turnFeedbackIds or t)
	local var24 = if fFlagBuildAgentAdCampaignCardModule then var6({
		segments = var21,
		sessionId = sessionId,
		universeId = universeId,
		isPageVisible = p2.isPageVisible,
		scrollingFrameRef = p2.scrollingFrameRef,
		getCardState = p2.getAgentAdCampaignCardState,
		isCreateDisabled = p2.isAgentAdCampaignCreateDisabled,
		onOfferSelected = p2.onAgentAdCampaignOfferSelected
	}) else {}
	local localToolActions = p2.localToolActions or t_1
	local emphasis = foundationModule.Hooks.useTokens().Color.Content.Emphasis
	local var25 = if fFlagBuildExperienceCopyChatMessagesModule and turnState ~= nil then turnProjectionModule.getFinalAssistantMessageText(turnState) else nil
	local onPlaytest = p2.onPlaytest
	local var26 = reactModule.useCallback(function()
		-- upvalues: sendBuildExperienceEventModule (copy), var23 (ref), fFlagBuildEventsUpdate1Module (copy), onPlaytest (ref)
		sendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = var23.universeId,
			placeId = var23.placeId,
			conversationId = var23.sessionId,
			messageId = var23.sequenceId
		}, if fFlagBuildEventsUpdate1Module then { context = "chat_widget" } else nil)
		
		if onPlaytest ~= nil then
			onPlaytest()
		end
	end, { onPlaytest, var23 })
	local var27 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var27 (ref), onPlaytest (ref), var21 (ref), sendBuildExperienceEventModule (copy), var23 (ref)
		if var27.current or onPlaytest == nil then return end
		local var28 = false
		
		for i, v in var21 do
			if v.kind == "playtest_cta" then
				var28 = true
				break
			end
		end
		if var28 then
			var27.current = true
			sendBuildExperienceEventModule("PLAYTEST_IMPRESSION", {
				universeId = var23.universeId,
				placeId = var23.placeId,
				conversationId = var23.sessionId,
				messageId = var23.sequenceId
			})
			
			return
		end
	end, { var21, onPlaytest, var23 })
	local t_2 = {}
	local var29 = 1
	
	for i, v in var21 do
		local var30 = nil
		
		if v.kind == "agent_message" or v.kind == "activity_summary" or v.kind == "client_tool" then
			var30 = renderWorkSegment(v, var29, emphasis, p2.clockBinding, localToolActions)
		elseif v.kind == "turn_work" then
			var30 = reactModule.createElement(TurnWorkSegment, {
				LayoutOrder = var29,
				segment = v,
				isDone = isDone,
				markdownTextStyle = emphasis,
				clockBinding = p2.clockBinding,
				localToolActions = localToolActions
			})
		elseif v.kind == "playtest_cta" and onPlaytest ~= nil then
			var30 = if fFlagBuildExperiencePlaytestCardPublishCtaModule then reactModule.createElement(PlaytestCardSection, {
				LayoutOrder = var29,
				onPlaytest = var26,
				onPublish = p2.onPublish,
				isLoading = p2.isPlaytestLoading,
				placeId = var23.placeId,
				publishedVersionNumber = var23.publishedVersionNumber
			}) else reactModule.createElement(playtestCompletedCardModule, {
				LayoutOrder = var29,
				onPlaytest = var26,
				isLoading = p2.isPlaytestLoading
			})
		elseif v.kind == "agent_ad_campaign_card" and fFlagBuildAgentAdCampaignCardModule then
			local toolCallId = var24[v.toolCallId]
			local state = toolCallId.state
			local var31 = state
			
			if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var31 ~= nil and var31.campaignId == nil then
				var31 = nil
			end
			if var31 ~= nil then
				var30 = reactModule.createElement(var5, {
					LayoutOrder = var29,
					variant = var31.variant,
					campaignStartDate = var31.campaignStartDate,
					campaignEndDate = var31.campaignEndDate,
					isDisabled = p2.onAgentAdCampaignActive == nil,
					onActivated = function()
						-- upvalues: p2 (ref)
						if p2.onAgentAdCampaignActive ~= nil then
							p2.onAgentAdCampaignActive()
						end
					end
				})
			elseif v.offers ~= nil and not toolCallId.isPending then
				local isLoading
				local createElement = reactModule.createElement
				local var32 = var4
				local t_3 = {
					LayoutOrder = var29,
					freePromotionsRemaining = v.availableCreditsSnapshot
				}
				
				if fFlagBuildAgentAdCampaignRefreshEligibilityModule and state ~= nil then
					isLoading = state.eligibilityStatus == "loading"
					isLoading = nil
				else
					isLoading = nil
				end
				t_3.isCreatePending = isLoading
				t_3.eligibilityError = if fFlagBuildAgentAdCampaignRefreshEligibilityModule and state ~= nil and state.eligibilityStatus ~= "loading" then state.eligibilityStatus else nil
				t_3.fundingType = toolCallId.fundingType
				t_3.containerRef = toolCallId.cardRef
				t_3.isCreateDisabled = toolCallId.isCreateDisabled
				t_3.onCreate = toolCallId.onCreate
				var30 = createElement(var32, t_3)
			end
		end
		if var30 ~= nil then
			if fFlagBuildExperienceChatCardEmphasisModule then
				var30 = reactModule.createElement(chatCardEmphasisPositionProviderModule, {
					messageOrder = p2.LayoutOrder or 0,
					segmentOrder = var29
				}, var30)
			end
			t_2[v.key] = var30
			var29 += 1
		end
	end
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p2.LayoutOrder
	}, {
		Message = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xsmall size-full-0 auto-y",
			testId = "ChatTurnBlock.Message"
		}, {
			Content = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xlarge size-full-0 auto-y",
				testId = "ChatTurnBlock.Message.Content"
			}, t_2),
			Feedback = if isDone then reactModule.createElement(agentTurnFeedbackModule, {
				LayoutOrder = 2,
				testId = "ChatTurnBlock.UserFeedback",
				messageText = if fFlagBuildExperienceCopyChatMessagesModule then var25 else nil,
				turnFeedbackIds = var23
			}) else nil
		})
	})
end)