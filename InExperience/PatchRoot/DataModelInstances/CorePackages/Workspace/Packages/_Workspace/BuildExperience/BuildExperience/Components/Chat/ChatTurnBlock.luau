local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local markdownModule = require(parent.Markdown)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationRoactContext = localizationModule.LocalizationRoactContext
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(buildExperience.Chat.chatTypes)
local turnProjectionModule = require(buildExperience.Chat.turnProjection)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildExperienceCopyChatMessagesModule = require(buildExperience.Flags.FFlagBuildExperienceCopyChatMessages)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
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
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), optionSelectorModule (ref), answerStackModule (ref)
	local var2
	local var3 = if fFlagBuildLocalization then useLocalization({
		customAnswer = localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
		next = localizationStringsModule.ANSWER_STACK_NEXT,
		submit = localizationStringsModule.ANSWER_STACK_SUBMIT
	}) else nil
	local prompt = p1.prompt
	local question = prompt.question
	local customResponseText = prompt.customResponseText
	local var4 = p1.isActive == true
	local isMultiSelect = question.responseType == "multi_select"
	local var5 = if prompt.isLastQuestion == false then if fFlagBuildLocalization then var3.next else localizationStringsModule.ANSWER_STACK_NEXT elseif fFlagBuildLocalization then var3.submit else localizationStringsModule.ANSWER_STACK_SUBMIT
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
		var2 = reactModule.createElement(optionSelectorModule, {
			LayoutOrder = 2,
			isSelected = true,
			title = if fFlagBuildLocalization then var3.customAnswer else localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
			description = customResponseText,
			testId = `AnswerStack.{question.id}.CustomAnswer`,
			onActivated = function() end
		})
	elseif #question.options > 0 then
		var2 = reactModule.createElement
		local var6 = answerStackModule
		local t_2 = {
			LayoutOrder = 2,
			options = question.options,
			selectedOptionId = prompt.selectedOptionId,
			selectionMode = if isMultiSelect then "multi" else "single",
			confirmLabel = var5
		}
		local selectedOptionId = prompt.selectedOptionId
		t_2.isConfirmDisabled = not (typeof(selectedOptionId) == "string" or (typeof(selectedOptionId) ~= "table" and #selectedOptionId > 0))
		t_2.onConfirm = if isMultiSelect and var4 then p1.onAnswerConfirmed else nil
		t_2.testId = `AnswerStack.{question.id}`
		
		function t_2.onOptionSelected(p2)
			-- upvalues: p1 (ref), isMultiSelect (ref), var4 (ref), question (ref), prompt (ref)
			if p1.onAnswerSelected == nil then return end
			if isMultiSelect then
				if var4 then
					p1.onAnswerSelected(question, p2)
				end
				return
			elseif prompt.selectedOptionId == nil then
				p1.onAnswerSelected(question, p2)
			end
		end
		
		var2 = var2(var6, t_2)
	else
		var2 = nil
	end
	t_1.Answers = var2
	
	return createElement(view, t, t_1)
end

local function PlanProposalSection(p1)
	-- upvalues: reactModule (ref), agentPlanCardModule (ref), view (ref), chatUserMessageModule (ref)
	local planProposal = p1.planProposal
	local var2 = reactModule.createElement(agentPlanCardModule, {
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
	}, { Plan = var2 }) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Plan = var2,
		Feedback = reactModule.createElement(chatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = planProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(p1)
	-- upvalues: useReactiveValue (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), foundationModule (ref), getMarkdownRendererPropsModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), text (ref), markdownViewer (ref)
	local var2
	local var3 = useReactiveValue(p1.segment.text)
	local _ = nil
	
	if fFlagBuildLocalization then
		local var4 = useLocalization({
			assistantResponseFailed = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED,
			assistantStopped = localizationStringsModule.CHAT_ASSISTANT_STOPPED
		})
		local var5 = reactModule.useContext(localizationRoactContext)
		var2 = if var3 == localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED then var4.assistantResponseFailed elseif var3 == localizationStringsModule.CHAT_ASSISTANT_STOPPED then var4.assistantStopped else var3
		
		if p1.segment.errorCode ~= nil then
			var2 = var5:Format(localizationStringsModule.CHAT_ERROR_CODE_TEXT, { ERROR_CODE = p1.segment.errorCode, ERROR_TEXT = var2 })
		end
	else
		var2 = if p1.segment.errorCode ~= nil then var3 else localizationStringsModule.formatChatTurnFailureMessage(var3, p1.segment.errorCode)
	end
	local var6 = foundationModule.Hooks.useTokens()
	
	return if var2 == "" then nil elseif p1.segment.isError then reactModule.createElement(view, {
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
			style = var6.Color.System.Alert
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = var2
		})
	}) else reactModule.createElement(markdownViewer, {
		Markdown = var2,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = p1.LayoutOrder
		},
		MarkdownRendererProps = reactModule.useMemo(function()
			-- upvalues: getMarkdownRendererPropsModule (copy), var6 (ref), p1 (ref)
			return getMarkdownRendererPropsModule(var6, p1.markdownTextStyle)
		end, { var6, p1.markdownTextStyle })
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
	-- upvalues: fFlagBuildLocalization (ref), useReactiveValue (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), foundationModule (ref), renderWorkSegment (ref), view (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var2, var3
	local _ = nil
	
	if fFlagBuildLocalization then
		local var4 = useReactiveValue(p1.segment.label or "")
		local workedDurationSeconds = p1.segment.workedDurationSeconds
		var2 = if workedDurationSeconds ~= nil then nil else math.max(0, math.floor(workedDurationSeconds + 0.5))
		local actionCount = p1.segment.actionCount or 0
		local var5 = useLocalization({
			summary = if var2 == nil or var2 >= 60 then if var2 ~= nil then if actionCount == 1 then localizationStringsModule.CHAT_ONE_TASK_COMPLETED elseif actionCount > 1 then {
				localizationStringsModule.CHAT_TASKS_COMPLETED,
				NUM_COMPLETED_TASKS = actionCount
			} else nil else {
				localizationStringsModule.CHAT_WORKED_MINUTES_SECONDS,
				MINUTES = math.floor(var2 / 60),
				REM_SECONDS = var2 % 60
			} else {
				localizationStringsModule.CHAT_WORKED_SECONDS,
				SECONDS = var2
			},
			turnActivity = localizationStringsModule.CHAT_TURN_ACTIVITY
		})
		var3 = if var2 == nil and actionCount <= 0 then if var4 == localizationStringsModule.CHAT_TURN_ACTIVITY then var5.turnActivity else var4 else var5.summary
	else
		var3 = useReactiveValue(p1.segment.label)
	end
	local var6 = useReactiveValue(p1.segment.segments)
	var55, var50 = reactModule.useState(false)
	local var7 = foundationModule.Hooks.useTokens()
	local isDone = p1.isDone
	local var8 = not p1.isDone or var55
	local var9 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(function(p2)
			return not p2
		end)
	end, {})
	local t = {}
	
	if var8 then
		local var10 = 1
		
		for i, v in var6 do
			local var11 = renderWorkSegment(v, var10, p1.markdownTextStyle, p1.clockBinding, p1.localToolActions)
			
			if var11 ~= nil then
				t[v.key] = var11
				var10 += 1
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
			onActivated = var9,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = if var55 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var7.Color.Content.Muted
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var3
			})
		}) else nil,
		Work = if var8 then reactModule.createElement(view, {
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
	-- upvalues: reactModule (ref), turnProjectionModule (ref), reportTurnActivityGapModule (ref), useReactiveValue (ref), t (ref), t_1 (ref), foundationModule (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), renderWorkSegment (ref), TurnWorkSegment (ref), playtestCompletedCardModule (ref), view (ref), agentTurnFeedbackModule (ref)
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
	local var12 = reactModule.useMemo(function()
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
	local var13 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: isDone (ref), var13 (ref), reportTurnActivityGapModule (copy), universeId (ref)
		if isDone then
			var13.current = nil
			
			return
		end
		local processTime = os.clock()
		reportTurnActivityGapModule.log(if var13.current ~= nil then 0 else (processTime - var13.current) * 1000, var13.current == nil, universeId)
		var13.current = processTime
	end, { isDone, var12, universeId })
	local var14 = useReactiveValue(turn.turnFeedbackIds or t)
	local localToolActions = p2.localToolActions or t_1
	local emphasis = foundationModule.Hooks.useTokens().Color.Content.Emphasis
	local var15 = if fFlagBuildExperienceCopyChatMessagesModule and turnState ~= nil then turnProjectionModule.getFinalAssistantMessageText(turnState) else nil
	local onPlaytest = p2.onPlaytest
	local var16 = reactModule.useCallback(function()
		-- upvalues: sendBuildExperienceEventModule (copy), var14 (ref), fFlagBuildEventsUpdate1Module (copy), onPlaytest (ref)
		sendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = var14.universeId,
			placeId = var14.placeId,
			conversationId = var14.sessionId,
			messageId = var14.sequenceId
		}, if fFlagBuildEventsUpdate1Module then { context = "chat_widget" } else nil)
		
		if onPlaytest ~= nil then
			onPlaytest()
		end
	end, { onPlaytest, var14 })
	local var17 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), onPlaytest (ref), var12 (ref), sendBuildExperienceEventModule (copy), var14 (ref)
		if var17.current or onPlaytest == nil then return end
		local var18 = false
		
		for i, v in var12 do
			if v.kind == "playtest_cta" then
				var18 = true
				break
			end
		end
		if var18 then
			var17.current = true
			sendBuildExperienceEventModule("PLAYTEST_IMPRESSION", {
				universeId = var14.universeId,
				placeId = var14.placeId,
				conversationId = var14.sessionId,
				messageId = var14.sequenceId
			})
			
			return
		end
	end, { var12, onPlaytest, var14 })
	local t_2 = {}
	local var19 = 1
	
	for i, v in var12 do
		local var20 = nil
		
		if v.kind == "agent_message" or v.kind == "activity_summary" or v.kind == "client_tool" then
			var20 = renderWorkSegment(v, var19, emphasis, p2.clockBinding, localToolActions)
		elseif v.kind == "turn_work" then
			var20 = reactModule.createElement(TurnWorkSegment, {
				LayoutOrder = var19,
				segment = v,
				isDone = isDone,
				markdownTextStyle = emphasis,
				clockBinding = p2.clockBinding,
				localToolActions = localToolActions
			})
		elseif v.kind == "playtest_cta" and onPlaytest ~= nil then
			var20 = reactModule.createElement(playtestCompletedCardModule, {
				LayoutOrder = var19,
				onPlaytest = var16,
				isLoading = p2.isPlaytestLoading
			})
		end
		if var20 ~= nil then
			t_2[v.key] = var20
			var19 += 1
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
				messageText = if fFlagBuildExperienceCopyChatMessagesModule then var15 else nil,
				turnFeedbackIds = var14
			}) else nil
		})
	})
end)