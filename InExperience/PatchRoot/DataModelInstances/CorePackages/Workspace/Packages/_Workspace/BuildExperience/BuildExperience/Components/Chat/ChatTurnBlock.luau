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

local function useReactiveValue(p0)
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), constantSource (copy)
		if typeof(p0) == "function" then
			return p0(p1)
		elseif typeof(p1) == "function" then
			p1(constantSource)
		end
		return p0
	end, { p0 }))
end

local function _(p2)
	return typeof(p2) == "string" or (typeof(p2) == "table" and #p2 > 0)
end

local function AnswerStackSection(p3)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), optionSelectorModule (ref), answerStackModule (ref)
	local var37
	local var31 = if fFlagBuildLocalization then useLocalization({
		customAnswer = localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
		next = localizationStringsModule.ANSWER_STACK_NEXT,
		submit = localizationStringsModule.ANSWER_STACK_SUBMIT
	}) else nil
	local prompt = p3.prompt
	local question = prompt.question
	local customResponseText = prompt.customResponseText
	local var32 = p3.isActive == true
	local isMultiSelect = question.responseType == "multi_select"
	local var34 = if prompt.isLastQuestion == false then if fFlagBuildLocalization then var31.next else localizationStringsModule.ANSWER_STACK_NEXT elseif fFlagBuildLocalization then var31.submit else localizationStringsModule.ANSWER_STACK_SUBMIT
	local createElement = reactModule.createElement
	local t = {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p3.LayoutOrder,
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
		var37 = reactModule.createElement(optionSelectorModule, {
			LayoutOrder = 2,
			isSelected = true,
			title = if fFlagBuildLocalization then var31.customAnswer else localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
			description = customResponseText,
			testId = `AnswerStack.{question.id}.CustomAnswer`,
			onActivated = function() end
		})
	elseif #question.options > 0 then
		var37 = reactModule.createElement
		local var38 = answerStackModule
		local t_2 = {
			LayoutOrder = 2,
			options = question.options,
			selectedOptionId = prompt.selectedOptionId,
			selectionMode = if isMultiSelect then "multi" else "single",
			confirmLabel = var34
		}
		local selectedOptionId = prompt.selectedOptionId
		t_2.isConfirmDisabled = not (typeof(selectedOptionId) == "string" or (typeof(selectedOptionId) ~= "table" and #selectedOptionId > 0))
		t_2.onConfirm = if isMultiSelect and var32 then p3.onAnswerConfirmed else nil
		t_2.testId = `AnswerStack.{question.id}`
		
		function t_2.onOptionSelected(p4)
			-- upvalues: p3 (ref), isMultiSelect (ref), var32 (ref), question (ref), prompt (ref)
			if p3.onAnswerSelected == nil then return end
			if isMultiSelect then
				if var32 then
					p3.onAnswerSelected(question, p4)
				end
				return
			elseif prompt.selectedOptionId == nil then
				p3.onAnswerSelected(question, p4)
			end
		end
		
		var37 = var37(var38, t_2)
	else
		var37 = nil
	end
	t_1.Answers = var37
	
	return createElement(view, t, t_1)
end

local function PlanProposalSection(p5)
	-- upvalues: reactModule (ref), agentPlanCardModule (ref), view (ref), chatUserMessageModule (ref)
	local planProposal = p5.planProposal
	local var40 = reactModule.createElement(agentPlanCardModule, {
		layoutOrder = 1,
		testId = "ChatTurnBlock.PlanProposal",
		title = planProposal.title,
		textContent = planProposal.textContent,
		summary = planProposal.summary,
		onBuild = p5.onPlanAccepted or function() end,
		isBuildDisabled = not (planProposal.isAccepted ~= true and planProposal.feedbackText == nil)
	})
	
	return if planProposal.feedbackText == nil then reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p5.LayoutOrder
	}, { Plan = var40 }) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p5.LayoutOrder
	}, {
		Plan = var40,
		Feedback = reactModule.createElement(chatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = planProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(p6)
	-- upvalues: useReactiveValue (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), foundationModule (ref), getMarkdownRendererPropsModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), text (ref), markdownViewer (ref)
	local var44
	local var41 = useReactiveValue(p6.segment.text)
	local _ = nil
	
	if fFlagBuildLocalization then
		local var42 = useLocalization({
			assistantResponseFailed = localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED,
			assistantStopped = localizationStringsModule.CHAT_ASSISTANT_STOPPED
		})
		local var43 = reactModule.useContext(localizationRoactContext)
		var44 = if var41 == localizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED then var42.assistantResponseFailed elseif var41 == localizationStringsModule.CHAT_ASSISTANT_STOPPED then var42.assistantStopped else var41
		
		if p6.segment.errorCode ~= nil then
			var44 = var43:Format(localizationStringsModule.CHAT_ERROR_CODE_TEXT, { ERROR_CODE = p6.segment.errorCode, ERROR_TEXT = var44 })
		end
	else
		var44 = if p6.segment.errorCode ~= nil then var41 else localizationStringsModule.formatChatTurnFailureMessage(var41, p6.segment.errorCode)
	end
	local var45 = foundationModule.Hooks.useTokens()
	
	return if var44 == "" then nil elseif p6.segment.isError then reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		testId = "ChatTurnBlock.ErrorMessage",
		LayoutOrder = p6.LayoutOrder
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			testId = "ChatTurnBlock.ErrorMessage.Icon",
			name = iconName.CircleX,
			variant = iconVariant.Filled,
			size = iconSize.Small,
			style = var45.Color.System.Alert
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = var44
		})
	}) else reactModule.createElement(markdownViewer, {
		Markdown = var44,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = p6.LayoutOrder
		},
		MarkdownRendererProps = reactModule.useMemo(function()
			-- upvalues: getMarkdownRendererPropsModule (copy), var45 (ref), p6 (ref)
			return getMarkdownRendererPropsModule(var45, p6.markdownTextStyle)
		end, { var45, p6.markdownTextStyle })
	})
end

local function renderClientToolSegment(p7, p8, p9)
	-- upvalues: reactModule (ref), AnswerStackSection (ref), PlanProposalSection (ref)
	return if p7.answerStackPrompt == nil then if p7.planProposal == nil then nil else reactModule.createElement(PlanProposalSection, {
		LayoutOrder = p8,
		planProposal = p7.planProposal,
		onPlanAccepted = if p7.isActive then p9.onPlanAcceptedByToolCallId[p7.toolCallId] else nil
	}) else reactModule.createElement(AnswerStackSection, {
		LayoutOrder = p8,
		prompt = p7.answerStackPrompt,
		isActive = p7.isActive,
		onAnswerSelected = if p7.isActive then p9.onAnswerSelectedByToolCallId[p7.toolCallId] else nil,
		onAnswerConfirmed = if p7.isActive then p9.onAnswerConfirmedByToolCallId[p7.toolCallId] else nil
	})
end

local function renderWorkSegment(p10, p11, p12, p13, p14)
	-- upvalues: reactModule (ref), AgentMessageSegment (ref), turnActivitySummaryModule (ref), renderClientToolSegment (ref)
	return if p10.kind == "agent_message" then reactModule.createElement(AgentMessageSegment, {
		LayoutOrder = p11,
		segment = p10,
		markdownTextStyle = p12
	}) elseif p10.kind == "activity_summary" then reactModule.createElement(turnActivitySummaryModule, { LayoutOrder = p11, segment = p10, clockBinding = p13 }) elseif p10.kind == "client_tool" then renderClientToolSegment(p10, p11, p14) else nil
end

local function TurnWorkSegment(p15)
	-- upvalues: fFlagBuildLocalization (ref), useReactiveValue (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), foundationModule (ref), renderWorkSegment (ref), view (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var47, var50
	local _ = nil
	
	if fFlagBuildLocalization then
		local var46 = useReactiveValue(p15.segment.label or "")
		local workedDurationSeconds = p15.segment.workedDurationSeconds
		var47 = if workedDurationSeconds ~= nil then nil else math.max(0, math.floor(workedDurationSeconds + 0.5))
		local actionCount = p15.segment.actionCount or 0
		local var49 = useLocalization({
			summary = if var47 == nil or var47 >= 60 then if var47 ~= nil then if actionCount == 1 then localizationStringsModule.CHAT_ONE_TASK_COMPLETED elseif actionCount > 1 then {
				localizationStringsModule.CHAT_TASKS_COMPLETED,
				NUM_COMPLETED_TASKS = actionCount
			} else nil else {
				localizationStringsModule.CHAT_WORKED_MINUTES_SECONDS,
				MINUTES = math.floor(var47 / 60),
				REM_SECONDS = var47 % 60
			} else {
				localizationStringsModule.CHAT_WORKED_SECONDS,
				SECONDS = var47
			},
			turnActivity = localizationStringsModule.CHAT_TURN_ACTIVITY
		})
		var50 = if var47 == nil and actionCount <= 0 then if var46 == localizationStringsModule.CHAT_TURN_ACTIVITY then var49.turnActivity else var46 else var49.summary
	else
		var50 = useReactiveValue(p15.segment.label)
	end
	local var51 = useReactiveValue(p15.segment.segments)
	var52, var47 = reactModule.useState(false)
	local var53 = foundationModule.Hooks.useTokens()
	local isDone = p15.isDone
	local var54 = not p15.isDone or var52
	local var55 = reactModule.useCallback(function()
		-- upvalues: var47 (ref)
		var47(function(p16)
			return not p16
		end)
	end, {})
	local t = {}
	
	if var54 then
		local var57 = 1
		
		for i, v in var51 do
			local var58 = renderWorkSegment(v, var57, p15.markdownTextStyle, p15.clockBinding, p15.localToolActions)
			
			if var58 ~= nil then
				t[v.key] = var58
				var57 += 1
			end
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		testId = "ChatTurnBlock.TurnWork",
		LayoutOrder = p15.LayoutOrder
	}, {
		Summary = if isDone then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-xxsmall",
			testId = "ChatTurnBlock.TurnWork.Summary",
			onActivated = var55,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = if var52 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var53.Color.Content.Muted
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var50
			})
		}) else nil,
		Work = if var54 then reactModule.createElement(view, {
			testId = "ChatTurnBlock.TurnWork.Content",
			LayoutOrder = if isDone then 2 else 1,
			tag = {
				["col gap-xlarge size-full-0 auto-y padding-left-large"] = isDone,
				["col gap-xlarge size-full-0 auto-y"] = not isDone
			}
		}, t) else nil
	})
end

return reactModule.memo(function(p17)
	-- upvalues: reactModule (ref), turnProjectionModule (ref), reportTurnActivityGapModule (ref), useReactiveValue (ref), t (ref), t_1 (ref), foundationModule (ref), fFlagBuildExperienceCopyChatMessagesModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), renderWorkSegment (ref), TurnWorkSegment (ref), playtestCompletedCardModule (ref), view (ref), agentTurnFeedbackModule (ref)
	local turn = p17.turn
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
	local var59 = reactModule.useMemo(function()
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
	local var60 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: isDone (ref), var60 (ref), reportTurnActivityGapModule (copy), universeId (ref)
		if isDone then
			var60.current = nil
			
			return
		end
		local processTime = os.clock()
		reportTurnActivityGapModule.log(if var60.current ~= nil then 0 else (processTime - var60.current) * 1000, var60.current == nil, universeId)
		var60.current = processTime
	end, { isDone, var59, universeId })
	local var61 = useReactiveValue(turn.turnFeedbackIds or t)
	local localToolActions = p17.localToolActions or t_1
	local emphasis = foundationModule.Hooks.useTokens().Color.Content.Emphasis
	local var63 = if fFlagBuildExperienceCopyChatMessagesModule and turnState ~= nil then turnProjectionModule.getFinalAssistantMessageText(turnState) else nil
	local onPlaytest = p17.onPlaytest
	local var64 = reactModule.useCallback(function()
		-- upvalues: sendBuildExperienceEventModule (copy), var61 (ref), fFlagBuildEventsUpdate1Module (copy), onPlaytest (ref)
		sendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = var61.universeId,
			placeId = var61.placeId,
			conversationId = var61.sessionId,
			messageId = var61.sequenceId
		}, if fFlagBuildEventsUpdate1Module then { context = "chat_widget" } else nil)
		
		if onPlaytest ~= nil then
			onPlaytest()
		end
	end, { onPlaytest, var61 })
	local var65 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var65 (ref), onPlaytest (ref), var59 (ref), sendBuildExperienceEventModule (copy), var61 (ref)
		if var65.current or onPlaytest == nil then return end
		local var70 = false
		
		for i, v in var59 do
			if v.kind == "playtest_cta" then
				var70 = true
				break
			end
		end
		if var70 then
			var65.current = true
			sendBuildExperienceEventModule("PLAYTEST_IMPRESSION", {
				universeId = var61.universeId,
				placeId = var61.placeId,
				conversationId = var61.sessionId,
				messageId = var61.sequenceId
			})
			
			return
		end
	end, { var59, onPlaytest, var61 })
	local t_2 = {}
	local var67 = 1
	
	for i, v in var59 do
		local var68 = nil
		
		if v.kind == "agent_message" or v.kind == "activity_summary" or v.kind == "client_tool" then
			var68 = renderWorkSegment(v, var67, emphasis, p17.clockBinding, localToolActions)
		elseif v.kind == "turn_work" then
			var68 = reactModule.createElement(TurnWorkSegment, {
				LayoutOrder = var67,
				segment = v,
				isDone = isDone,
				markdownTextStyle = emphasis,
				clockBinding = p17.clockBinding,
				localToolActions = localToolActions
			})
		elseif v.kind == "playtest_cta" and onPlaytest ~= nil then
			var68 = reactModule.createElement(playtestCompletedCardModule, {
				LayoutOrder = var67,
				onPlaytest = var64,
				isLoading = p17.isPlaytestLoading
			})
		end
		if var68 ~= nil then
			t_2[v.key] = var68
			var67 += 1
		end
	end
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p17.LayoutOrder
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
				messageText = if fFlagBuildExperienceCopyChatMessagesModule then var63 else nil,
				turnFeedbackIds = var61
			}) else nil
		})
	})
end)