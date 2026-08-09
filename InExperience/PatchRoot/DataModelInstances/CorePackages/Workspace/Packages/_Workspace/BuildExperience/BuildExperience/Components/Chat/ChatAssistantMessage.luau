local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local markdownModule = require(parent.Markdown)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Chat.chatTypes)
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local agentPlanCardModule = require(buildExperience.Components.AgentCard.AgentPlanCard)
local answerStackModule = require(buildExperience.Components.AnswerStack.AnswerStack)
local optionSelectorModule = require(buildExperience.Components.AnswerStack.OptionSelector)
local agentTurnFeedbackModule = require(script.Parent.AgentTurnFeedback)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)
local icon = foundationModule.Icon
local text = foundationModule.Text
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local markdownViewer = markdownModule.Components.MarkdownViewer
local subagentTasks = creatorAgentChatModule.SubagentTasks
local t = {}
local t_1 = {}
local t_2 = {}

local function _(p0) --[[ line: 45 | named "normalizeToolTitle" ]]
	return string.lower(string.gsub(p0, "[_%-%s]", ""))
end

local function constantSource() --[[ line: 87 ]]
	return 0
end

local function useReactiveValue(p1) --[[ line: 91 ]]
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p2) --[[ line: 92 ]]
		-- upvalues: p1 (ref), constantSource (copy)
		if typeof(p1) == "function" then
			return p1(p2)
		elseif typeof(p2) == "function" then
			p2(constantSource)
		end
		return p1
	end, { p1 }))
end

local function getToolLabel(p3) --[[ line: 105 ]]
	-- upvalues: subagentTasks (ref)
	if p3.kind ~= "tool_call" then
		return "tool"
	end
	local var29 = if typeof(p3.title) == "string" and p3.title ~= "" then p3.title else "tool"
	
	return if string.lower(string.gsub(var29, "[_%-%s]", "")) == string.lower(string.gsub(subagentTasks.TOOL_NAME, "[_%-%s]", "")) then "Assigning tasks to agents" elseif p3.status == "completed" then `Finished {var29}` elseif p3.status == "failed" then `Failed {var29}` else `Running {var29}`
end

local _ = function(p4) --[[ line: 123 | named "isActiveTool" ]]
	return p4.kind == "tool_call" and (if p4.status ~= "pending" then if p4.status ~= "in_progress" then p4.status == nil else true else true)
end

local function findLatestThought(p5) --[[ line: 131 ]]
	for i = #p5, 1, -1 do
		local var30 = p5[i]
		
		if var30.kind ~= "thought" or typeof(var30.text) ~= "string" or var30.text == "" then
			continue
		end
		return i, var30
	end
	return nil, nil
end

local function findLatestActiveTool(p6) --[[ line: 142 ]]
	for i = #p6, 1, -1 do
		local var31 = p6[i]
		
		if var31.kind ~= "tool_call" then
			continue
		end
		if not (var31.kind == "tool_call" and (if var31.status ~= "pending" then if var31.status ~= "in_progress" then var31.status == nil else true else true)) then
			continue
		end
		return i, var31
	end
	return nil, nil
end

local function createThinkingGradient(p7) --[[ line: 153 ]]
	-- upvalues: reactModule (ref), chatConstantsModule (ref)
	return reactModule.createElement("UIGradient", {
		Enabled = true,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.55),
			NumberSequenceKeypoint.new(0.5, 0),
			NumberSequenceKeypoint.new(1, 0.55)
		}),
		Offset = p7:map(function(p8) --[[ line: 161 ]]
			-- upvalues: chatConstantsModule (copy)
			return Vector2.new(p8 * chatConstantsModule.THINKING_GRADIENT_ANIMATION_SPEED % chatConstantsModule.THINKING_GRADIENT_OFFSET - chatConstantsModule.THINKING_GRADIENT_OFFSET / 2, 0)
		end)
	})
end

local function createActivityText(p9, p10, p11, p12) --[[ line: 171 ]]
	-- upvalues: reactModule (ref), text (ref), createThinkingGradient (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
		LayoutOrder = p10,
		Text = p9
	}, if p12 then { ThinkingGradient = createThinkingGradient(p11) } else nil)
end

local _ = function(p13, p14, p15, p16) --[[ line: 192 | named "createActivitySummaryThoughtText" ]]
	-- upvalues: reactModule (ref), text (ref), createThinkingGradient (ref)
	return reactModule.createElement(text, {
		TextWrapped = true,
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
		LayoutOrder = p14,
		Text = p13,
		Size = UDim2.new(1, 0, 0, 0)
	}, if p16 then { ThinkingGradient = createThinkingGradient(p15) } else nil)
end

local function createActivitySummaryActionText(p17, p18, p19, p20) --[[ line: 215 ]]
	-- upvalues: reactModule (ref), text (ref), createThinkingGradient (ref)
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-muted",
		LayoutOrder = p18,
		Text = p17,
		Size = UDim2.new(1, 0, 0, 0)
	}, if p20 then { ThinkingGradient = createThinkingGradient(p19) } else nil)
end

local _ = function(p21, p22, p23) --[[ line: 237 | named "createActivityItem" ]]
	-- upvalues: createActivityText (ref), getToolLabel (ref)
	return if p21.kind == "thought" then createActivityText(p21.text, p22, p23, false) elseif p21.kind == "tool_call" then createActivityText(getToolLabel(p21), p22, p23, p21.kind == "tool_call" and (if p21.status ~= "pending" then if p21.status ~= "in_progress" then p21.status == nil else true else true)) else nil
end

local function AnswerStackSection(p24) --[[ line: 251 ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), optionSelectorModule (ref), answerStackModule (ref), agentTurnFeedbackModule (ref)
	local prompt = p24.prompt
	local question = prompt.question
	local customResponseText = prompt.customResponseText
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y padding-top-small",
		LayoutOrder = p24.LayoutOrder,
		testId = `ChatAssistantMessage.AnswerStack.{question.id}`
	}, {
		Question = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = question.question
		}),
		Answers = if customResponseText ~= nil then reactModule.createElement(answerStackModule, {
			LayoutOrder = 2,
			options = question.options,
			selectedOptionId = prompt.selectedOptionId,
			testId = `AnswerStack.{question.id}`,
			onOptionSelected = function(p25) --[[ line: 280 ]]
				-- upvalues: p24 (ref), prompt (ref), question (ref)
				if p24.onAnswerSelected ~= nil and prompt.selectedOptionId == nil then
					p24.onAnswerSelected(question, p25)
				end
			end
		}) else reactModule.createElement(optionSelectorModule, {
			LayoutOrder = 2,
			title = "Custom Answer",
			isSelected = true,
			description = customResponseText,
			testId = `AnswerStack.{question.id}.CustomAnswer`,
			onActivated = function() --[[ line: 273 ]] end
		}),
		Feedback = if p24.isActive then reactModule.createElement(agentTurnFeedbackModule, {
			LayoutOrder = 3,
			turnFeedbackIds = p24.turnFeedbackIds,
			testId = `ChatAssistantMessage.AnswerStackFeedback.{question.id}`
		}) else nil
	})
end

local function PlanProposalSection(p26) --[[ line: 296 ]]
	-- upvalues: reactModule (ref), agentPlanCardModule (ref), view (ref), agentTurnFeedbackModule (ref)
	local var32 = reactModule.createElement(agentPlanCardModule, {
		testId = "ChatAssistantMessage.PlanProposal",
		layoutOrder = if p26.isActive then 1 else p26.LayoutOrder,
		title = p26.planProposal.title,
		textContent = p26.planProposal.textContent,
		summary = p26.planProposal.summary,
		onBuild = p26.onPlanAccepted or function() --[[ line: 302 ]] end,
		isBuildDisabled = not p26.isActive
	})
	
	return if p26.isActive then reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p26.LayoutOrder
	}, {
		Plan = var32,
		Feedback = reactModule.createElement(agentTurnFeedbackModule, {
			LayoutOrder = 2,
			testId = "ChatAssistantMessage.PlanFeedback",
			turnFeedbackIds = p26.turnFeedbackIds
		})
	}) else var32
end

local function PlanFeedbackSection(p27, p28, p29) --[[ line: 323 ]]
	-- upvalues: reactModule (ref), chatUserMessageModule (ref)
	return reactModule.createElement(chatUserMessageModule, {
		LayoutOrder = p28,
		message = { isUser = true, id = p29, text = p27 }
	})
end

local function toolNodeSort(p30, p31) --[[ line: 334 ]]
	return if p30.callOrder == p31.callOrder then p30.key < p31.key else p30.callOrder < p31.callOrder
end

local function createClientToolColumn(p32, p33) --[[ line: 341 ]]
	-- upvalues: toolNodeSort (ref), reactModule (ref), view (ref)
	if #p33 == 0 then
		return nil
	end
	table.sort(p33, toolNodeSort)
	local t = {}
	
	for i, v in p33 do
		t[v.key] = v.node
	end
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p32
	}, t)
end

local function ClientToolSections(p34) --[[ line: 358 ]]
	-- upvalues: useReactiveValue (ref), t_1 (ref), reactModule (ref), AnswerStackSection (ref), PlanProposalSection (ref), view (ref), PlanFeedbackSection (ref), createClientToolColumn (ref)
	local var34 = useReactiveValue(p34.clientToolItems or t_1)
	local t = {}
	local t_2 = {}
	
	for i, v in var34 do
		local var37 = nil
		
		if v.kind == "ask_user" and v.answerStackPrompt ~= nil then
			var37 = reactModule.createElement(AnswerStackSection, {
				LayoutOrder = v.callOrder,
				prompt = v.answerStackPrompt,
				isActive = v.isActive,
				turnFeedbackIds = p34.turnFeedbackIds,
				onAnswerSelected = v.onAnswerSelected
			})
		elseif v.kind == "plan" and v.planProposal ~= nil then
			local planProposal = v.planProposal
			local var38 = reactModule.createElement(PlanProposalSection, {
				LayoutOrder = v.callOrder,
				planProposal = planProposal,
				isActive = v.isActive,
				turnFeedbackIds = p34.turnFeedbackIds,
				onPlanAccepted = v.onPlanAccepted
			})
			var37 = if planProposal.feedbackText ~= nil then var38 else reactModule.createElement(view, {
				tag = "col gap-xsmall size-full-0 auto-y",
				LayoutOrder = v.callOrder
			}, {
				Plan = var38,
				Feedback = PlanFeedbackSection(planProposal.feedbackText, v.callOrder + 1, `{v.key}-feedback`)
			})
		end
		if var37 ~= nil then
			table.insert(if v.isActive then t_2 else t, { key = v.key, callOrder = v.callOrder, node = var37 })
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		BeforeContent = createClientToolColumn(1, t),
		AfterContent = createClientToolColumn(3, t_2)
	})
end

return function(p35) --[[ line: 416 | named "ChatAssistantMessage" ]]
	-- upvalues: useReactiveValue (ref), t (ref), t_2 (ref), reactModule (ref), foundationModule (ref), findLatestThought (ref), findLatestActiveTool (ref), text (ref), createActivityText (ref), getToolLabel (ref), createActivitySummaryActionText (ref), chatConstantsModule (ref), view (ref), scrollView (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), markdownViewer (ref), ClientToolSections (ref), agentTurnFeedbackModule (ref)
	local var54
	local message = p35.message
	local var39 = useReactiveValue(message.text)
	local var40 = useReactiveValue(if message.isLoading == nil then false else message.isLoading)
	local var41 = useReactiveValue(if message.turnActivity == nil then t else message.turnActivity)
	local var42 = useReactiveValue(if message.turnFeedbackIds == nil then t_2 else message.turnFeedbackIds)
	local var43, var44 = reactModule.useState(false)
	local var45, var46 = reactModule.useBinding(0)
	local var47 = reactModule.useRef(nil)
	local var48 = foundationModule.Hooks.useTokens()
	local emphasis = var48.Color.Content.Emphasis
	local var49 = reactModule.useCallback(function() --[[ line: 431 ]]
		-- upvalues: var44 (ref)
		var44(function(p36) --[[ line: 432 ]]
			return not p36
		end)
	end, {})
	local var50 = reactModule.useCallback(function(p37) --[[ line: 437 ]]
		-- upvalues: var47 (ref)
		if p37 == nil then
			return
		end
		task.defer(function() --[[ line: 442 ]]
			-- upvalues: var47 (copy), p37 (ref)
			if var47.current == p37 then
				p37.CanvasPosition = Vector2.new(0, math.max(0, p37.AbsoluteCanvasSize.Y - p37.AbsoluteWindowSize.Y))
				
				return
			end
		end)
	end, {})
	local var51 = reactModule.useCallback(function(p38) --[[ line: 453 ]]
		-- upvalues: var47 (ref), var50 (ref)
		var47.current = p38
		
		if p38 then
			var50(p38)
		end
	end, { var50 })
	local var52 = reactModule.useCallback(function(p39) --[[ line: 460 ]]
		-- upvalues: var46 (ref), var50 (ref)
		var46(p39.AbsoluteCanvasSize.Y)
		var50(p39)
	end, { var46, var50 })
	local var53 = reactModule.useCallback(function(p40) --[[ line: 465 ]]
		-- upvalues: var50 (ref)
		var50(p40)
	end, { var50 })
	reactModule.useEffect(function() --[[ line: 469 ]]
		-- upvalues: var50 (ref), var47 (ref)
		var50(var47.current)
		
		return function() --[[ line: 471 ]] end
	end, { var50, var41 })
	local _ = nil
	
	if var40 then
		local t_1 = {}
		local var56, var57 = findLatestThought(var41)
		local var58, var59 = findLatestActiveTool(var41)
		local var60 = false
		
		for i, v in var41 do
			if i ~= var56 and i ~= var58 then
				local var63 = if v.kind == "thought" then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					LayoutOrder = i,
					Text = v.text
				}, nil) elseif v.kind == "tool_call" then createActivityText(getToolLabel(v), i, p35.clockBinding, v.kind == "tool_call" and (if v.status ~= "pending" then if v.status ~= "in_progress" then v.status == nil else true else true)) else nil
				
				if var63 ~= nil then
					t_1[if v.kind == "thought" then `Thought{i}` else `Tool{i}`] = var63
					var60 = true
				end
			end
		end
		local t_3 = {}
		local var62 = 1
		
		if var57 ~= nil and var57.kind == "thought" then
			local _ = p35.clockBinding
			t_3.LatestThought = reactModule.createElement(text, {
				TextWrapped = true,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
				LayoutOrder = var62,
				Text = var57.text,
				Size = UDim2.new(1, 0, 0, 0)
			}, nil)
			var62 += 1
		end
		if var59 == nil then
			t_3.CurrentAction = createActivitySummaryActionText(chatConstantsModule.ASSISTANT_LOADING_TEXT, var62, p35.clockBinding, true)
		else
			t_3.CurrentAction = createActivitySummaryActionText(getToolLabel(var59), var62, p35.clockBinding, true)
		end
		var54 = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-xsmall size-full-0 auto-y"
		}, {
			ActivityHistory = if var43 and var60 then reactModule.createElement(scrollView, {
				LayoutOrder = 1,
				tag = "size-full-0 clip",
				testId = "ChatAssistantMessage.ActivityHistory",
				Size = var45:map(function(p41) --[[ line: 522 ]]
					return UDim2.new(1, 0, 0, math.clamp(p41, 24, 220))
				end),
				scrollingFrameRef = var51,
				onAbsoluteCanvasSizeChanged = var52,
				onAbsoluteWindowSizeChanged = var53,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y
				}
			}, {
				ActivityColumn = reactModule.createElement(view, {
					tag = "col gap-xsmall size-full-0 auto-y padding-left-large"
				}, t_1)
			}) else nil,
			ActivitySummary = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-bottom gap-xsmall size-full-0 auto-y padding-y-xxsmall",
				testId = "ChatAssistantMessage.ActivitySummary",
				onActivated = var49,
				stateLayer = { affordance = stateLayerAffordance.None }
			}, {
				Chevron = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = if var43 then iconName.ChevronLargeDown else iconName.ChevronLargeRight,
					padding = { bottom = UDim.new(0, var48.Padding.XSmall) },
					size = iconSize.XSmall,
					style = var48.Color.Content.Muted
				}),
				SummaryText = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill gap-xxsmall auto-y" }, t_3)
			})
		})
	else
		var54 = reactModule.createElement(markdownViewer, {
			Markdown = var39,
			WrapperProps = {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium content-emphasis"
			},
			MarkdownRendererProps = {
				textStyles = {
					color = `#{emphasis.Color3:ToHex()}`,
					transparency = emphasis.Transparency
				}
			}
		})
	end
	local t_1 = { Content = var54 }
	
	if message.clientToolItems ~= nil then
		t_1.ClientToolSections = reactModule.createElement(ClientToolSections, {
			clientToolItems = message.clientToolItems,
			turnFeedbackIds = var42
		})
	end
	if not var40 and p35.hideFeedback ~= true then
		t_1.Feedback = reactModule.createElement(agentTurnFeedbackModule, {
			LayoutOrder = 4,
			testId = "ChatAssistantMessage.UserFeedback",
			turnFeedbackIds = var42
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p35.LayoutOrder
	}, {
		Message = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xsmall size-full-0 auto-y"
		}, t_1)
	})
end