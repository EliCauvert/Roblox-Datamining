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
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local reportTurnActivityGapModule = require(buildExperience.Telemetry.reportTurnActivityGap)
local getMarkdownRendererPropsModule = require(buildExperience.utils.getMarkdownRendererProps)
local agentPlanCardModule = require(buildExperience.Components.AgentCard.AgentPlanCard)
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
	onPlanAcceptedByToolCallId = {}
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
	local var1
	local var2 = if fFlagBuildLocalization then useLocalization({
		customAnswer = localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
		next = localizationStringsModule.ANSWER_STACK_NEXT,
		submit = localizationStringsModule.ANSWER_STACK_SUBMIT
	}) else nil
	local prompt = p1.prompt
	local question = prompt.question
	local customResponseText = prompt.customResponseText
	local var3 = p1.isActive == true
	local isMultiSelect = question.responseType == "multi_select"
	local var4 = if prompt.isLastQuestion == false then if fFlagBuildLocalization then var2.next else localizationStringsModule.ANSWER_STACK_NEXT elseif fFlagBuildLocalization then var2.submit else localizationStringsModule.ANSWER_STACK_SUBMIT
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
		var1 = reactModule.createElement(optionSelectorModule, {
			LayoutOrder = 2,
			isSelected = true,
			title = if fFlagBuildLocalization then var2.customAnswer else localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
			description = customResponseText,
			testId = `AnswerStack.{question.id}.CustomAnswer`,
			onActivated = function() end
		})
	elseif #question.options > 0 then
		var1 = reactModule.createElement
		local var5 = answerStackModule
		local t_2 = {
			LayoutOrder = 2,
			options = question.options,
			selectedOptionId = prompt.selectedOptionId,
			selectionMode = if isMultiSelect then "multi" else "single",
			confirmLabel = var4
		}
		local selectedOptionId = prompt.selectedOptionId
		t_2.isConfirmDisabled = not (typeof(selectedOptionId) == "string" or (typeof(selectedOptionId) ~= "table" and #selectedOptionId > 0))
		t_2.onConfirm = if isMultiSelect and var3 then p1.onAnswerConfirmed else nil
		t_2.testId = `AnswerStack.{question.id}`
		
		function t_2.onOptionSelected(p2)
			-- upvalues: p1 (ref), isMultiSelect (ref), var3 (ref), question (ref), prompt (ref)
			if p1.onAnswerSelected == nil then return end
			if isMultiSelect then
				if var3 then
					p1.onAnswerSelected(question, p2)
				end
				return
			elseif prompt.selectedOptionId == nil then
				p1.onAnswerSelected(question, p2)
			end
		end
		
		var1 = var1(var5, t_2)
	else
		var1 = nil
	end
	t_1.Answers = var1
	
	return createElement(view, t, t_1)
end

local function PlanProposalSection(p1)
	-- upvalues: reactModule (ref), agentPlanCardModule (ref), view (ref), chatUserMessageModule (ref)
	local planProposal = p1.planProposal
	local var1 = reactModule.createElement(agentPlanCardModule, {
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
	}, { Plan = var1 }) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Plan = var1,
		Feedback = reactModule.createElement(chatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = planProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(p1)
	-- upvalues: useReactiveValue (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), foundationModule (ref), getMarkdownRendererPropsModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), text (ref), markdownViewer (ref)
	local var1
	local var2 = useReactiveValue(p1.segment.text)
	local _ = nil
	
	if fFlagBuildLocalization then
		local var3 = useLocalization({
			assistantResponseFailed = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED,
			assistantStopped = localizationStringsModule.CHAT_ASSISTANT_STOPPED
		})
		local var4 = reactModule.useContext(localizationRoactContext)
		var1 = if var2 == localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED then var3.assistantResponseFailed elseif var2 == localizationStringsModule.CHAT_ASSISTANT_STOPPED then var3.assistantStopped else var2
		
		if p1.segment.errorCode ~= nil then
			var1 = var4:Format(localizationStringsModule.CHAT_ERROR_CODE_TEXT, { ERROR_CODE = p1.segment.errorCode, ERROR_TEXT = var1 })
		end
	else
		var1 = if p1.segment.errorCode ~= nil then var2 else localizationStringsModule.formatChatTurnFailureMessage(var2, p1.segment.errorCode)
	end
	local var5 = foundationModule.Hooks.useTokens()
	
	return if var1 == "" then nil elseif p1.segment.isError then reactModule.createElement(view, {
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
			style = var5.Color.System.Alert
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = var1
		})
	}) else reactModule.createElement(markdownViewer, {
		Markdown = var1,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = p1.LayoutOrder
		},
		MarkdownRendererProps = reactModule.useMemo(function()
			-- upvalues: getMarkdownRendererPropsModule (copy), var5 (ref), p1 (ref)
			return getMarkdownRendererPropsModule(var5, p1.markdownTextStyle)
		end, { var5, p1.markdownTextStyle })
	})
end

local function renderClientToolSegment(p1, p2, p3)
	-- upvalues: reactModule (ref), AnswerStackSection (ref), PlanProposalSection (ref)
	return if p1.answerStackPrompt == nil then if p1.planProposal == nil then nil else reactModule.createElement(PlanProposalSection, {
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
	local var1, var2
	local _ = nil
	
	if fFlagBuildLocalization then
		local var3 = useReactiveValue(p1.segment.label or "")
		local workedDurationSeconds = p1.segment.workedDurationSeconds
		var1 = if workedDurationSeconds ~= nil then nil else math.max(0, math.floor(workedDurationSeconds + 0.5))
		local actionCount = p1.segment.actionCount or 0
		local var4 = useLocalization({
			summary = if var1 == nil or var1 >= 60 then if var1 ~= nil then if actionCount == 1 then localizationStringsModule.CHAT_ONE_TASK_COMPLETED elseif actionCount > 1 then {
				localizationStringsModule.CHAT_TASKS_COMPLETED,
				NUM_COMPLETED_TASKS = actionCount
			} else nil else {
				localizationStringsModule.CHAT_WORKED_MINUTES_SECONDS,
				MINUTES = math.floor(var1 / 60),
				REM_SECONDS = var1 % 60
			} else {
				localizationStringsModule.CHAT_WORKED_SECONDS,
				SECONDS = var1
			},
			turnActivity = localizationStringsModule.CHAT_TURN_ACTIVITY
		})
		var2 = if var1 == nil and actionCount <= 0 then if var3 == localizationStringsModule.CHAT_TURN_ACTIVITY then var4.turnActivity else var3 else var4.summary
	else
		var2 = useReactiveValue(p1.segment.label)
	end
	local var5 = useReactiveValue(p1.segment.segments)
	var52, var47 = reactModule.useState(false)
	local var6 = foundationModule.Hooks.useTokens()
	local isDone = p1.isDone
	local var7 = not p1.isDone or var52
	local var8 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		var1(function(p2)
			return not p2
		end)
	end, {})
	local t = {}
	
	if var7 then
		local var9 = 1
		
		for i, v in var5 do
			local var10 = renderWorkSegment(v, var9, p1.markdownTextStyle, p1.clockBinding, p1.localToolActions)
			
			if var10 ~= nil then
				t[v.key] = var10
				var9 += 1
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
			onActivated = var8,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = if var52 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var6.Color.Content.Muted
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var2
			})
		}) else nil,
		Work = if var7 then reactModule.createElement(view, {
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
	local var11 = reactModule.useMemo(function()
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
	local var12 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: isDone (ref), var12 (ref), reportTurnActivityGapModule (copy), universeId (ref)
		if isDone then
			var12.current = nil
			
			return
		end
		local processTime = os.clock()
		reportTurnActivityGapModule.log(if var12.current ~= nil then 0 else (processTime - var12.current) * 1000, var12.current == nil, universeId)
		var12.current = processTime
	end, { isDone, var11, universeId })
	local var13 = useReactiveValue(turn.turnFeedbackIds or t)
	local localToolActions = p2.localToolActions or t_1
	local emphasis = foundationModule.Hooks.useTokens().Color.Content.Emphasis
	local var14 = if fFlagBuildExperienceCopyChatMessagesModule and turnState ~= nil then turnProjectionModule.getFinalAssistantMessageText(turnState) else nil
	local onPlaytest = p2.onPlaytest
	local var15 = reactModule.useCallback(function()
		-- upvalues: sendBuildExperienceEventModule (copy), var13 (ref), fFlagBuildEventsUpdate1Module (copy), onPlaytest (ref)
		sendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = var13.universeId,
			placeId = var13.placeId,
			conversationId = var13.sessionId,
			messageId = var13.sequenceId
		}, if fFlagBuildEventsUpdate1Module then { context = "chat_widget" } else nil)
		
		if onPlaytest ~= nil then
			onPlaytest()
		end
	end, { onPlaytest, var13 })
	local var16 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), onPlaytest (ref), var11 (ref), sendBuildExperienceEventModule (copy), var13 (ref)
		if var16.current or onPlaytest == nil then return end
		local var17 = false
		
		for i, v in var11 do
			if v.kind == "playtest_cta" then
				var17 = true
				break
			end
		end
		if var17 then
			var16.current = true
			sendBuildExperienceEventModule("PLAYTEST_IMPRESSION", {
				universeId = var13.universeId,
				placeId = var13.placeId,
				conversationId = var13.sessionId,
				messageId = var13.sequenceId
			})
			
			return
		end
	end, { var11, onPlaytest, var13 })
	local t_2 = {}
	local var18 = 1
	
	for i, v in var11 do
		local var19 = nil
		
		if v.kind == "agent_message" or v.kind == "activity_summary" or v.kind == "client_tool" then
			var19 = renderWorkSegment(v, var18, emphasis, p2.clockBinding, localToolActions)
		elseif v.kind == "turn_work" then
			var19 = reactModule.createElement(TurnWorkSegment, {
				LayoutOrder = var18,
				segment = v,
				isDone = isDone,
				markdownTextStyle = emphasis,
				clockBinding = p2.clockBinding,
				localToolActions = localToolActions
			})
		elseif v.kind == "playtest_cta" and onPlaytest ~= nil then
			var19 = reactModule.createElement(playtestCompletedCardModule, {
				LayoutOrder = var18,
				onPlaytest = var15,
				isLoading = p2.isPlaytestLoading
			})
		end
		if var19 ~= nil then
			t_2[v.key] = var19
			var18 += 1
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
				messageText = if fFlagBuildExperienceCopyChatMessagesModule then var14 else nil,
				turnFeedbackIds = var13
			}) else nil
		})
	})
end)