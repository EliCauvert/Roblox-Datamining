local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local markdownModule = require(parent.Markdown)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(buildExperience.Chat.chatTypes)
local turnProjectionModule = require(buildExperience.Chat.turnProjection)
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

local function constantSource() --[[ line: 78 ]]
	return 0
end

local function useReactiveValue(p0) --[[ line: 82 ]]
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 83 ]]
		-- upvalues: p0 (ref), constantSource (copy)
		if typeof(p0) == "function" then
			return p0(p1)
		elseif typeof(p1) == "function" then
			p1(constantSource)
		end
		return p0
	end, { p0 }))
end

local function _(p2) --[[ line: 96 | named "hasSelectedOptions" ]]
	return typeof(p2) == "string" or (typeof(p2) == "table" and #p2 > 0)
end

local function AnswerStackSection(p3) --[[ line: 106 ]]
	-- upvalues: localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), optionSelectorModule (ref), answerStackModule (ref)
	local var32
	local prompt = p3.prompt
	local question = prompt.question
	local customResponseText = prompt.customResponseText
	local var27 = p3.isActive == true
	local isMultiSelect = question.responseType == "multi_select"
	local var29 = if prompt.isLastQuestion == false then localizationStringsModule.ANSWER_STACK_NEXT else localizationStringsModule.ANSWER_STACK_SUBMIT
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
		var32 = reactModule.createElement(optionSelectorModule, {
			LayoutOrder = 2,
			isSelected = true,
			title = localizationStringsModule.ANSWER_STACK_CUSTOM_ANSWER,
			description = customResponseText,
			testId = `AnswerStack.{question.id}.CustomAnswer`,
			onActivated = function() --[[ line: 133 ]] end
		})
	elseif #question.options > 0 then
		var32 = reactModule.createElement
		local var33 = answerStackModule
		local t_2 = {
			LayoutOrder = 2,
			options = question.options,
			selectedOptionId = prompt.selectedOptionId,
			selectionMode = if isMultiSelect then "multi" else "single",
			confirmLabel = var29
		}
		local selectedOptionId = prompt.selectedOptionId
		t_2.isConfirmDisabled = not (typeof(selectedOptionId) == "string" or (typeof(selectedOptionId) ~= "table" and #selectedOptionId > 0))
		t_2.onConfirm = if isMultiSelect and var27 then p3.onAnswerConfirmed else nil
		t_2.testId = `AnswerStack.{question.id}`
		
		function t_2.onOptionSelected(p4) --[[ line: 144 ]]
			-- upvalues: p3 (ref), isMultiSelect (ref), var27 (ref), question (ref), prompt (ref)
			if p3.onAnswerSelected == nil then return end
			if isMultiSelect then
				if var27 then
					p3.onAnswerSelected(question, p4)
				end
				return
			elseif prompt.selectedOptionId == nil then
				p3.onAnswerSelected(question, p4)
			end
		end
		
		var32 = var32(var33, t_2)
	else
		var32 = nil
	end
	t_1.Answers = var32
	
	return createElement(view, t, t_1)
end

local function PlanProposalSection(p5) --[[ line: 163 ]]
	-- upvalues: reactModule (ref), agentPlanCardModule (ref), view (ref), chatUserMessageModule (ref)
	local planProposal = p5.planProposal
	local var35 = reactModule.createElement(agentPlanCardModule, {
		layoutOrder = 1,
		testId = "ChatTurnBlock.PlanProposal",
		title = planProposal.title,
		textContent = planProposal.textContent,
		summary = planProposal.summary,
		onBuild = p5.onPlanAccepted or function() --[[ line: 171 ]] end,
		isBuildDisabled = not (planProposal.isAccepted ~= true and planProposal.feedbackText == nil)
	})
	
	return if planProposal.feedbackText == nil then reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p5.LayoutOrder
	}, { Plan = var35 }) else reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p5.LayoutOrder
	}, {
		Plan = var35,
		Feedback = reactModule.createElement(chatUserMessageModule, {
			LayoutOrder = 2,
			message = { kind = "user_message", text = planProposal.feedbackText }
		})
	})
end

local function AgentMessageSegment(p6) --[[ line: 200 ]]
	-- upvalues: useReactiveValue (ref), foundationModule (ref), reactModule (ref), getMarkdownRendererPropsModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), text (ref), markdownViewer (ref)
	local var36 = useReactiveValue(p6.segment.text)
	local var37 = foundationModule.Hooks.useTokens()
	
	return if var36 == "" then nil elseif p6.segment.isError then reactModule.createElement(view, {
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
			style = var37.Color.System.Alert
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "fill text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = var36
		})
	}) else reactModule.createElement(markdownViewer, {
		Markdown = var36,
		WrapperProps = {
			tag = "size-full-0 auto-y text-body-medium content-emphasis",
			LayoutOrder = p6.LayoutOrder
		},
		MarkdownRendererProps = reactModule.useMemo(function() --[[ line: 203 ]]
			-- upvalues: getMarkdownRendererPropsModule (copy), var37 (ref), p6 (ref)
			return getMarkdownRendererPropsModule(var37, p6.markdownTextStyle)
		end, { var37, p6.markdownTextStyle })
	})
end

local function renderClientToolSegment(p7, p8, p9) --[[ line: 245 ]]
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

local function renderWorkSegment(p10, p11, p12, p13, p14) --[[ line: 275 ]]
	-- upvalues: reactModule (ref), AgentMessageSegment (ref), turnActivitySummaryModule (ref), renderClientToolSegment (ref)
	return if p10.kind == "agent_message" then reactModule.createElement(AgentMessageSegment, {
		LayoutOrder = p11,
		segment = p10,
		markdownTextStyle = p12
	}) elseif p10.kind == "activity_summary" then reactModule.createElement(turnActivitySummaryModule, { LayoutOrder = p11, segment = p10, clockBinding = p13 }) elseif p10.kind == "client_tool" then renderClientToolSegment(p10, p11, p14) else nil
end

local function TurnWorkSegment(p15) --[[ line: 301 ]]
	-- upvalues: useReactiveValue (ref), reactModule (ref), foundationModule (ref), renderWorkSegment (ref), view (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var38 = useReactiveValue(p15.segment.label)
	local var39 = useReactiveValue(p15.segment.segments)
	local var40, var41 = reactModule.useState(false)
	local var42 = foundationModule.Hooks.useTokens()
	local isDone = p15.isDone
	local var43 = not p15.isDone or var40
	local var44 = reactModule.useCallback(function() --[[ line: 309 ]]
		-- upvalues: var41 (ref)
		var41(function(p16) --[[ line: 310 ]]
			return not p16
		end)
	end, {})
	local t = {}
	
	if var43 then
		local var46 = 1
		
		for i, v in var39 do
			local var47 = renderWorkSegment(v, var46, p15.markdownTextStyle, p15.clockBinding, p15.localToolActions)
			
			if var47 ~= nil then
				t[v.key] = var47
				var46 += 1
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
			onActivated = var44,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = if var40 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
				size = iconSize.XSmall,
				style = var42.Color.Content.Muted
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-body-medium text-wrap text-align-x-left content-muted",
				Text = var38
			})
		}) else nil,
		Work = if var43 then reactModule.createElement(view, {
			testId = "ChatTurnBlock.TurnWork.Content",
			LayoutOrder = if isDone then 2 else 1,
			tag = {
				["col gap-xlarge size-full-0 auto-y padding-left-large"] = isDone,
				["col gap-xlarge size-full-0 auto-y"] = not isDone
			}
		}, t) else nil
	})
end

return reactModule.memo(function(p17) --[[ line: 372 | named "ChatTurnBlock" ]]
	-- upvalues: reactModule (ref), turnProjectionModule (ref), reportTurnActivityGapModule (ref), useReactiveValue (ref), t (ref), t_1 (ref), foundationModule (ref), sendBuildExperienceEventModule (ref), renderWorkSegment (ref), TurnWorkSegment (ref), playtestCompletedCardModule (ref), view (ref), agentTurnFeedbackModule (ref)
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
	local var48 = reactModule.useMemo(function() --[[ line: 386 ]]
		-- upvalues: turnState (ref), turnProjectionModule (copy), turnKey (ref), universeId (ref), sessionId (ref), startSequenceId (ref), endSequenceId (ref), optimisticLocalTools (ref), setupErrorText (ref)
		return if turnState == nil then if setupErrorText == nil then turnProjectionModule.projectLoadingTurnSegments({ turnKey = turnKey }) else turnProjectionModule.projectSetupErrorSegments(setupErrorText, { turnKey = turnKey }) else turnProjectionModule.projectActiveTurnSegments(turnState, {
			turnKey = turnKey,
			universeId = universeId,
			sessionId = sessionId,
			startSequenceId = startSequenceId,
			endSequenceId = endSequenceId,
			optimisticLocalTools = optimisticLocalTools
		})
	end, {
		turnState, turnKey, startSequenceId, endSequenceId, optimisticLocalTools,
		setupErrorText, universeId, sessionId
	})
	local var49 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 415 ]]
		-- upvalues: isDone (ref), var49 (ref), reportTurnActivityGapModule (copy), universeId (ref)
		if isDone then
			var49.current = nil
			
			return
		end
		local processTime = os.clock()
		reportTurnActivityGapModule.log(if var49.current ~= nil then 0 else (processTime - var49.current) * 1000, var49.current == nil, universeId)
		var49.current = processTime
	end, { isDone, var48, universeId })
	local var50 = useReactiveValue(turn.turnFeedbackIds or t)
	local localToolActions = p17.localToolActions or t_1
	local emphasis = foundationModule.Hooks.useTokens().Color.Content.Emphasis
	local onPlaytest = p17.onPlaytest
	local var52 = reactModule.useCallback(function() --[[ line: 434 ]]
		-- upvalues: sendBuildExperienceEventModule (copy), var50 (ref), onPlaytest (ref)
		sendBuildExperienceEventModule("PLAYTEST_CLICK", {
			universeId = var50.universeId,
			placeId = var50.placeId,
			conversationId = var50.sessionId,
			messageId = var50.sequenceId
		})
		
		if onPlaytest ~= nil then
			onPlaytest()
		end
	end, { onPlaytest, var50 })
	local var53 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 447 ]]
		-- upvalues: var53 (ref), onPlaytest (ref), var48 (ref), sendBuildExperienceEventModule (copy), var50 (ref)
		if var53.current or onPlaytest == nil then return end
		local var58 = false
		
		for i, v in var48 do
			if v.kind == "playtest_cta" then
				var58 = true
				break
			end
		end
		if var58 then
			var53.current = true
			sendBuildExperienceEventModule("PLAYTEST_IMPRESSION", {
				universeId = var50.universeId,
				placeId = var50.placeId,
				conversationId = var50.sessionId,
				messageId = var50.sequenceId
			})
			
			return
		end
	end, { var48, onPlaytest, var50 })
	local t_2 = {}
	local var55 = 1
	
	for i, v in var48 do
		local var56 = nil
		
		if v.kind == "agent_message" or v.kind == "activity_summary" or v.kind == "client_tool" then
			var56 = renderWorkSegment(v, var55, emphasis, p17.clockBinding, localToolActions)
		elseif v.kind == "turn_work" then
			var56 = reactModule.createElement(TurnWorkSegment, {
				LayoutOrder = var55,
				segment = v,
				isDone = isDone,
				markdownTextStyle = emphasis,
				clockBinding = p17.clockBinding,
				localToolActions = localToolActions
			})
		elseif v.kind == "playtest_cta" and onPlaytest ~= nil then
			var56 = reactModule.createElement(playtestCompletedCardModule, {
				LayoutOrder = var55,
				onPlaytest = var52,
				isLoading = p17.isPlaytestLoading
			})
		end
		if var56 ~= nil then
			t_2[v.key] = var56
			var55 += 1
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
				turnFeedbackIds = var50
			}) else nil
		})
	})
end)