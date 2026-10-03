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
local _ = require(buildExperience.Chat.chatTypes)
local turnProjectionModule = require(buildExperience.Chat.turnProjection)
local fFlagBuildExperienceChatAccordionScrollAnchorModule = require(buildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local reportTurnActivityGapModule = require(buildExperience.Telemetry.reportTurnActivityGap)
local getMarkdownRendererPropsModule = require(buildExperience.utils.getMarkdownRendererProps)
local agentPlanCardModule = require(buildExperience.Components.AgentCard.AgentPlanCard)
local var1 = if fFlagBuildExperienceManageDevProductModule then require(buildExperience.Components.AgentCard.AgentDevProductCard) else nil
local answerStackModule = require(buildExperience.Components.AnswerStack.AnswerStack)
local optionSelectorModule = require(buildExperience.Components.AnswerStack.OptionSelector)
local agentTurnFeedbackModule = require(script.Parent.AgentTurnFeedback)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)
local playtestCompletedCardModule = require(script.Parent.PlaytestCompletedCard)
local var2 = if fFlagBuildAgentAdCampaignCardModule then require(buildExperience.Components.Ads.AdUpsellCard) else nil
local var3 = if fFlagBuildAgentAdCampaignCardModule then require(buildExperience.Components.Ads.AdCampaignIsActiveCard) else nil
local var4 = if fFlagBuildAgentAdCampaignCardModule then require(script.Parent.useAgentAdCampaignTurnCards) else nil
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
	local var5
	local var6 = useLocalization({
		customAnswer = localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
		next = localizationStringsModule.ANSWER_STACK_NEXT,
		submit = localizationStringsModule.ANSWER_STACK_SUBMIT
	})
	local prompt = p1.prompt
	local question = prompt.question
	local customResponseText = prompt.customResponseText
	local var7 = p1.isActive == true
	local isMultiSelect = question.responseType == "multi_select"
	local var8 = if prompt.isLastQuestion == false then var6.next else var6.submit
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
		var5 = reactModule.createElement(optionSelectorModule, {
			LayoutOrder = 2,
			isSelected = true,
			title = var6.customAnswer,
			description = customResponseText,
			testId = `AnswerStack.{question.id}.CustomAnswer`,
			onActivated = function() end
		})
	elseif #question.options > 0 then
		var5 = reactModule.createElement
		local var9 = answerStackModule
		local t_2 = {
			LayoutOrder = 2,
			options = question.options,
			selectedOptionId = prompt.selectedOptionId,
			selectionMode = if isMultiSelect then "multi" else "single",
			confirmLabel = var8
		}
		local selectedOptionId = prompt.selectedOptionId
		t_2.isConfirmDisabled = not (typeof(selectedOptionId) == "string" or (typeof(selectedOptionId) ~= "table" and #selectedOptionId > 0))
		t_2.onConfirm = if isMultiSelect and var7 then p1.onAnswerConfirmed else nil
		t_2.testId = `AnswerStack.{question.id}`
		
		function t_2.onOptionSelected(p2)
			-- upvalues: p1 (ref), isMultiSelect (ref), var7 (ref), question (ref), prompt (ref)
			if p1.onAnswerSelected == nil then return end
			if isMultiSelect then
				if var7 then
					p1.onAnswerSelected(question, p2)
				end
				return
			elseif prompt.selectedOptionId == nil then
				p1.onAnswerSelected(question, p2)
			end
		end
		
		var5 = var5(var9, t_2)
	else
		var5 = nil
	end
	t_1.Answers = var5
	
	return createElement(view, t, t_1)
end

local function PlanProposalSection(p1)
	-- upvalues: reactModule (ref), agentPlanCardModule (ref), view (ref), chatUserMessageModule (ref)
	local planProposal = p1.planProposal
	local var5 = reactModule.createElement(agentPlanCardModule, {
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
	}, { Plan = var5 }) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Plan = var5,
		Feedback = reactModule.createElement(chatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = planProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(p1)
	-- upvalues: useReactiveValue (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), foundationModule (ref), getMarkdownRendererPropsModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), text (ref), markdownViewer (ref)
	local var5 = useReactiveValue(p1.segment.text)
	local _ = nil
	local var6 = useLocalization({
		assistantResponseFailed = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED,
		assistantStopped = localizationStringsModule.CHAT_ASSISTANT_STOPPED
	})
	local var7 = reactModule.useContext(localizationRoactContext)
	local var8 = if var5 == localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED then var6.assistantResponseFailed elseif var5 == localizationStringsModule.CHAT_ASSISTANT_STOPPED then var6.assistantStopped else var5
	
	if p1.segment.errorCode ~= nil then
		var8 = var7:Format(localizationStringsModule.CHAT_ERROR_CODE_TEXT, { ERROR_CODE = p1.segment.errorCode, ERROR_TEXT = var8 })
	end
	local var9 = foundationModule.Hooks.useTokens()
	
	return if var8 == "" then nil elseif p1.segment.isError then reactModule.createElement(view, {
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
			style = var9.Color.System.Alert
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = var8
		})
	}) else reactModule.createElement(markdownViewer, {
		Markdown = var8,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = p1.LayoutOrder
		},
		MarkdownRendererProps = reactModule.useMemo(function()
			-- upvalues: getMarkdownRendererPropsModule (copy), var9 (ref), p1 (ref)
			return getMarkdownRendererPropsModule(var9, p1.markdownTextStyle)
		end, { var9, p1.markdownTextStyle })
	})
end

local function DevProductProposalSection(p1)
	-- upvalues: reactModule (ref), view (ref), var1 (ref)
	local devProductProposal = p1.devProductProposal
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		DevProduct = reactModule.createElement(var1, {
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
			isActionDisabled = not (devProductProposal.isApproved ~= true and devProductProposal.isRejected ~= true)
		})
	})
end

local function renderClientToolSegment(p1, p2, p3)
	-- upvalues: reactModule (ref), AnswerStackSection (ref), PlanProposalSection (ref), fFlagBuildExperienceManageDevProductModule (ref), DevProductProposalSection (ref)
	return if p1.answerStackPrompt == nil then if p1.planProposal == nil then if fFlagBuildExperienceManageDevProductModule and p1.devProductProposal ~= nil then reactModule.createElement(DevProductProposalSection, {
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
	-- upvalues: useReactiveValue (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref), chatScrollAnchorContextModule (ref), foundationModule (ref), renderWorkSegment (ref), view (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local _ = nil
	local var5 = useReactiveValue(p1.segment.label or "")
	local workedDurationSeconds = p1.segment.workedDurationSeconds
	local var6 = if workedDurationSeconds ~= nil then nil else math.max(0, math.floor(workedDurationSeconds + 0.5))
	local actionCount = p1.segment.actionCount or 0
	local var7 = useLocalization({
		summary = if var6 == nil or var6 >= 60 then if var6 ~= nil then if actionCount == 1 then localizationStringsModule.CHAT_ONE_TASK_COMPLETED elseif actionCount > 1 then {
			localizationStringsModule.CHAT_TASKS_COMPLETED,
			NUM_COMPLETED_TASKS = actionCount
		} else nil else {
			localizationStringsModule.CHAT_WORKED_MINUTES_SECONDS,
			MINUTES = math.floor(var6 / 60),
			REM_SECONDS = var6 % 60
		} else {
			localizationStringsModule.CHAT_WORKED_SECONDS,
			SECONDS = var6
		},
		turnActivity = localizationStringsModule.CHAT_TURN_ACTIVITY
	})
	local var8 = if var6 == nil and actionCount <= 0 then if var5 == localizationStringsModule.CHAT_TURN_ACTIVITY then var7.turnActivity else var5 else var7.summary
	local var9 = useReactiveValue(p1.segment.segments)
	local var10, var11 = reactModule.useState(false)
	local var12 = nil
	local var13 = nil
	
	if fFlagBuildExperienceChatAccordionScrollAnchorModule then
		var12 = reactModule.useRef(nil)
		var13 = reactModule.useContext(chatScrollAnchorContextModule)
	end
	local var14 = foundationModule.Hooks.useTokens()
	local isDone = p1.isDone
	local var15 = not p1.isDone or var10
	local var16 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceChatAccordionScrollAnchorModule (copy), var13 (write), var12 (write), var11 (ref)
		if fFlagBuildExperienceChatAccordionScrollAnchorModule and var13 ~= nil and var12 ~= nil then
			var13(var12.current)
		end
		var11(function(p2)
			return not p2
		end)
	end, { var13 })
	local t = {}
	
	if var15 then
		local var17 = 1
		
		for i, v in var9 do
			local var18 = renderWorkSegment(v, var17, p1.markdownTextStyle, p1.clockBinding, p1.localToolActions)
			
			if var18 ~= nil then
				t[v.key] = var18
				var17 += 1
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
			ref = var12,
			onActivated = var16,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = if var10 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var14.Color.Content.Muted
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var8
			})
		}) else nil,
		Work = if var15 then reactModule.createElement(view, {
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
	-- upvalues: reactModule (ref), turnProjectionModule (ref), reportTurnActivityGapModule (ref), useReactiveValue (ref), t (ref), fFlagBuildAgentAdCampaignCardModule (ref), var4 (ref), t_1 (ref), foundationModule (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), renderWorkSegment (ref), TurnWorkSegment (ref), playtestCompletedCardModule (ref), var3 (ref), var2 (ref), view (ref), agentTurnFeedbackModule (ref)
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
	local var19 = reactModule.useMemo(function()
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
	local var20 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: isDone (ref), var20 (ref), reportTurnActivityGapModule (copy), universeId (ref)
		if isDone then
			var20.current = nil
			
			return
		end
		local processTime = os.clock()
		reportTurnActivityGapModule.log(if var20.current ~= nil then 0 else (processTime - var20.current) * 1000, var20.current == nil, universeId)
		var20.current = processTime
	end, { isDone, var19, universeId })
	local var21 = useReactiveValue(turn.turnFeedbackIds or t)
	local var22 = if fFlagBuildAgentAdCampaignCardModule then var4({
		segments = var19,
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
	local var23 = if fFlagBuildExperienceCopyChatMessagesModule and turnState ~= nil then turnProjectionModule.getFinalAssistantMessageText(turnState) else nil
	local onPlaytest = p2.onPlaytest
	local var24 = reactModule.useCallback(function()
		-- upvalues: sendBuildExperienceEventModule (copy), var21 (ref), fFlagBuildEventsUpdate1Module (copy), onPlaytest (ref)
		sendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = var21.universeId,
			placeId = var21.placeId,
			conversationId = var21.sessionId,
			messageId = var21.sequenceId
		}, if fFlagBuildEventsUpdate1Module then { context = "chat_widget" } else nil)
		
		if onPlaytest ~= nil then
			onPlaytest()
		end
	end, { onPlaytest, var21 })
	local var25 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), onPlaytest (ref), var19 (ref), sendBuildExperienceEventModule (copy), var21 (ref)
		if var25.current or onPlaytest == nil then return end
		local var26 = false
		
		for i, v in var19 do
			if v.kind == "playtest_cta" then
				var26 = true
				break
			end
		end
		if var26 then
			var25.current = true
			sendBuildExperienceEventModule("PLAYTEST_IMPRESSION", {
				universeId = var21.universeId,
				placeId = var21.placeId,
				conversationId = var21.sessionId,
				messageId = var21.sequenceId
			})
			
			return
		end
	end, { var19, onPlaytest, var21 })
	local t_2 = {}
	local var27 = 1
	
	for i, v in var19 do
		local var28 = nil
		
		if v.kind == "agent_message" or v.kind == "activity_summary" or v.kind == "client_tool" then
			var28 = renderWorkSegment(v, var27, emphasis, p2.clockBinding, localToolActions)
		elseif v.kind == "turn_work" then
			var28 = reactModule.createElement(TurnWorkSegment, {
				LayoutOrder = var27,
				segment = v,
				isDone = isDone,
				markdownTextStyle = emphasis,
				clockBinding = p2.clockBinding,
				localToolActions = localToolActions
			})
		elseif v.kind == "playtest_cta" and onPlaytest ~= nil then
			var28 = reactModule.createElement(playtestCompletedCardModule, {
				LayoutOrder = var27,
				onPlaytest = var24,
				isLoading = p2.isPlaytestLoading
			})
		elseif v.kind == "agent_ad_campaign_card" and fFlagBuildAgentAdCampaignCardModule then
			local toolCallId = var22[v.toolCallId]
			local state = toolCallId.state
			
			if state ~= nil then
				var28 = reactModule.createElement(var3, {
					LayoutOrder = var27,
					variant = state.variant,
					campaignStartDate = state.campaignStartDate,
					campaignEndDate = state.campaignEndDate,
					isDisabled = p2.onAgentAdCampaignActive == nil,
					onActivated = function()
						-- upvalues: p2 (ref)
						if p2.onAgentAdCampaignActive ~= nil then
							p2.onAgentAdCampaignActive()
						end
					end
				})
			elseif v.offers ~= nil and not toolCallId.isPending then
				var28 = reactModule.createElement(var2, {
					LayoutOrder = var27,
					freePromotionsRemaining = v.availableCreditsSnapshot,
					fundingType = toolCallId.fundingType,
					containerRef = toolCallId.cardRef,
					isCreateDisabled = toolCallId.isCreateDisabled,
					onCreate = toolCallId.onCreate
				})
			end
		end
		if var28 ~= nil then
			t_2[v.key] = var28
			var27 += 1
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
				messageText = if fFlagBuildExperienceCopyChatMessagesModule then var23 else nil,
				turnFeedbackIds = var21
			}) else nil
		})
	})
end)