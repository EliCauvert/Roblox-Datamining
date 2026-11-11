local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local TurnDisplayModule = require(script.Parent.turnDisplay)
local PublishToolUtils = CreatorAgentChatModule.PublishToolUtils
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool
local ASSISTANTSTOPPEDTEXT = TurnDisplayModule.ASSISTANT_STOPPED_TEXT
local CountToolCallsFunction = TurnDisplayModule.countToolCalls
local GetActiveActivityLabelFunction = TurnDisplayModule.getActiveActivityLabel
local GetAskUserActivityLabelFunction = TurnDisplayModule.getAskUserActivityLabel
local GetCompletedActivityLabelFunction = TurnDisplayModule.getCompletedActivityLabel
local GetTurnWorkedDurationLabelFunction = TurnDisplayModule.getTurnWorkedDurationLabel
local config = {
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {}
}

local function contentBlocksToText(AssistantMessage): string
	local List = {}
	
	for _, value in AssistantMessage do
		if value.type == "text" and typeof(value.text) == "string" then
			table.insert(List, value.text)
		end
	end
	return table.concat(List)
end

local function getAssistantMessageTexts(p1)
	-- upvalues: contentBlocksToText (copy)
	local List = {}
	
	for _, value in p1.assistantMessageOrder do
		local AssistantMessage = p1.assistantMessages[value]
		local NoAssistantMessage = AssistantMessage == nil
		local ContentBlocksToTextResult = nil
		
		if not NoAssistantMessage then
			ContentBlocksToTextResult = contentBlocksToText(AssistantMessage)
			NoAssistantMessage = ContentBlocksToTextResult == ""
		end
		if not NoAssistantMessage then
			table.insert(List, ContentBlocksToTextResult)
		end
	end
	return List
end

local function _(p2, p3)
	if p3.turnKey == nil then
		local SessionId = p3.sessionId or (if p2 == nil then "pending-session" else p2.sessionId)
		local SequenceId = if p3.turnFeedbackIds == nil or typeof(p3.turnFeedbackIds) == "function" then nil else p3.turnFeedbackIds.sequenceId
		
		return if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
	else
		return p3.turnKey
	end
end

local function makeSegmentKey(TurnKey, ...): string
	local List = { TurnKey }
	
	for _, value in { ... } do
		table.insert(List, (tostring(value)))
	end
	return table.concat(List, ":")
end

local _ = function(p2)
	local List = {}
	
	for activitySlot in p2.activitySlots do
		table.insert(List, activitySlot)
	end
	table.sort(List)
	
	return List
end

local _ = function(p3, TurnActivityItem)
	if TurnActivityItem.kind == "tool_call" then
		local ToolCall = p3.toolCalls[TurnActivityItem.toolCallId]
		
		return {
			kind = "tool_call",
			toolCallId = TurnActivityItem.toolCallId,
			title = if ToolCall then ToolCall.title else nil,
			status = if ToolCall then ToolCall.status else nil
		}
	else
		return nil
	end
end

local _ = function(Key, Text)
	return if Text == "" then nil else { kind = "agent_message", key = Key, text = Text }
end

local function makeCompletedActivitySummary(ActivityItems, Key)
	-- upvalues: GetCompletedActivityLabelFunction (copy), CountToolCallsFunction (copy)
	return if #ActivityItems == 0 then nil else {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = Key,
		label = GetCompletedActivityLabelFunction(ActivityItems),
		activityItems = ActivityItems,
		actionCount = CountToolCallsFunction(ActivityItems)
	}
end

local _ = function(ActivityItems, IsLoading, Key, p3)
	-- upvalues: GetActiveActivityLabelFunction (copy)
	return if #ActivityItems == 0 and not IsLoading then nil else {
		kind = "activity_summary",
		summaryKind = "active",
		key = Key,
		label = p3 or GetActiveActivityLabelFunction(ActivityItems, IsLoading),
		activityItems = ActivityItems,
		isLoading = IsLoading
	}
end

local function countActionsInSegments(Segments): number
	-- upvalues: CountToolCallsFunction (copy)
	local Total = 0
	
	for _, segment in Segments do
		if segment.kind == "activity_summary" then
			Total += segment.actionCount or CountToolCallsFunction(segment.activityItems)
		end
	end
	return Total
end

local function getAnsweredPromptsByToolCallId(p3)
	-- upvalues: StudioAskUserTool (copy)
	local t = {}
	
	for _, value in StudioAskUserTool.getAnsweredPromptsFromTurnState(p3) do
		if value.toolCallId ~= nil then
			local ToolCallId = value.toolCallId
			
			if t[ToolCallId] == nil then
				t[ToolCallId] = {}
			end
			table.insert(t[ToolCallId], value)
		end
	end
	return t
end

local function getCompletedPlansByToolCallId(p4)
	-- upvalues: StudioProposePlanTool (copy)
	local t = {}
	
	for _, value in StudioProposePlanTool.getCompletedPlansFromTurnState(p4) do
		if value.toolCallId ~= nil then
			t[value.toolCallId] = value
		end
	end
	return t
end

local _ = function(p5, ToolCallId, CallOrder, p6, IsActive, AnswerStackPrompt, PlanProposal)
	-- upvalues: makeSegmentKey (copy)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p5, "client-tool", ToolCallId, p6),
		toolCallId = ToolCallId,
		callOrder = CallOrder,
		isActive = IsActive,
		answerStackPrompt = AnswerStackPrompt,
		planProposal = PlanProposal
	}
end

local function projectAskUserSegments(p5, p6, ToolCallId, p7, p8)
	-- upvalues: makeSegmentKey (copy), StudioAskUserTool (copy)
	local ToolCall = p5.toolCalls[ToolCallId]
	
	if ToolCall == nil then
		return {}
	end
	local List = {}
	local AnswerStackPrompts = p7[ToolCallId]
	
	if AnswerStackPrompts == nil or #AnswerStackPrompts <= 0 then
		local ExtractQuestionsFromToolCallResult = StudioAskUserTool.extractQuestionsFromToolCall(ToolCall)
		local AskUserByToolCallIdEntry = p8.askUserByToolCallId[ToolCallId]
		
		if ExtractQuestionsFromToolCallResult == nil or AskUserByToolCallIdEntry == nil then
			return List
		end
		local Selection = nil
		for i1, Question in ExtractQuestionsFromToolCallResult do
			Selection = AskUserByToolCallIdEntry.selections[i1]
			
			if i1 == AskUserByToolCallIdEntry.currentIndex and not p8.submittedToolCallIds[ToolCallId] then
				table.insert(List, {
					kind = "client_tool",
					isActive = true,
					planProposal = nil,
					key = makeSegmentKey(p6, "client-tool", ToolCallId, i1),
					toolCallId = ToolCallId,
					callOrder = AskUserByToolCallIdEntry.callOrder,
					answerStackPrompt = {
						question = Question,
						selectedOptionId = if Selection == nil then nil else Selection.selectedOptionId,
						customResponseText = if Selection == nil then nil else Selection.customResponseText,
						toolCallId = ToolCallId,
						callOrder = AskUserByToolCallIdEntry.callOrder,
						isLastQuestion = #ExtractQuestionsFromToolCallResult <= i1
					}
				})
				
				return List
			end
			if Selection == nil then break end
			table.insert(List, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				key = makeSegmentKey(p6, "client-tool", ToolCallId, i1),
				toolCallId = ToolCallId,
				callOrder = AskUserByToolCallIdEntry.callOrder,
				answerStackPrompt = {
					question = Question,
					selectedOptionId = Selection.selectedOptionId,
					customResponseText = Selection.customResponseText,
					toolCallId = ToolCallId,
					callOrder = AskUserByToolCallIdEntry.callOrder,
					isLastQuestion = #ExtractQuestionsFromToolCallResult <= i1
				}
			})
		end
		return List
	else
		for i, answerStackPrompt in AnswerStackPrompts do
			table.insert(List, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				key = makeSegmentKey(p6, "client-tool", ToolCallId, i),
				toolCallId = ToolCallId,
				callOrder = answerStackPrompt.callOrder or i,
				answerStackPrompt = answerStackPrompt
			})
		end
		return List
	end
end

local function projectPlanSegments(p9, p10, ToolCallId, p11, p12)
	-- upvalues: makeSegmentKey (copy), StudioProposePlanTool (copy)
	local ToolCall = p9.toolCalls[ToolCallId]
	
	if ToolCall == nil then
		return {}
	end
	local PlanProposal = p11[ToolCallId]
	
	if PlanProposal == nil then
		local PlanByToolCallIdEntry = p12.planByToolCallId[ToolCallId]
		local ExtractPlanFromToolCallResult = StudioProposePlanTool.extractPlanFromToolCall(ToolCall)
		
		return if ExtractPlanFromToolCallResult == nil or PlanByToolCallIdEntry == nil then {} else {
			{
				kind = "client_tool",
				answerStackPrompt = nil,
				key = makeSegmentKey(p10, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = PlanByToolCallIdEntry.callOrder,
				isActive = PlanByToolCallIdEntry.isAccepted ~= true and (PlanByToolCallIdEntry.feedbackText == nil and not p12.submittedToolCallIds[ToolCallId]),
				planProposal = {
					title = ExtractPlanFromToolCallResult.title,
					textContent = ExtractPlanFromToolCallResult.textContent,
					summary = ExtractPlanFromToolCallResult.summary,
					toolCallId = ToolCallId,
					callOrder = PlanByToolCallIdEntry.callOrder,
					isAccepted = PlanByToolCallIdEntry.isAccepted,
					feedbackText = PlanByToolCallIdEntry.feedbackText
				}
			}
		}
	else
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				key = makeSegmentKey(p10, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = PlanProposal.callOrder or 0,
				planProposal = PlanProposal
			}
		}
	end
end

local _ = function(p9, p10, ToolCallId, p11, p12, p13)
	-- upvalues: projectAskUserSegments (copy), projectPlanSegments (copy)
	local ProjectAskUserSegmentsResult = projectAskUserSegments(p9, p10, ToolCallId, p11, p13)
	
	return if #ProjectAskUserSegmentsResult > 0 then ProjectAskUserSegmentsResult else projectPlanSegments(p9, p10, ToolCallId, p12, p13)
end

local _ = function(p9, p10, p11)
	-- upvalues: StudioAskUserTool (copy), GetAskUserActivityLabelFunction (copy)
	local AskUserByToolCallIdEntry = p11.askUserByToolCallId[p10]
	local ToolCall = p9.toolCalls[p10]
	
	if AskUserByToolCallIdEntry == nil or ToolCall == nil then
		return nil
	end
	local ExtractQuestionsFromToolCallResult = StudioAskUserTool.extractQuestionsFromToolCall(ToolCall)
	
	if ExtractQuestionsFromToolCallResult == nil then
		return nil
	else
		local ExtractQuestionsFromToolCallResultEntry = ExtractQuestionsFromToolCallResult[AskUserByToolCallIdEntry.currentIndex]
		
		return GetAskUserActivityLabelFunction(#ExtractQuestionsFromToolCallResult, if ExtractQuestionsFromToolCallResultEntry == nil then nil else #ExtractQuestionsFromToolCallResultEntry.options)
	end
end

local function projectWorkSegments(p9, TurnKey, p10, NoIsDone)
	-- upvalues: getAnsweredPromptsByToolCallId (copy), getCompletedPlansByToolCallId (copy), makeSegmentKey (copy), GetActiveActivityLabelFunction (copy), makeCompletedActivitySummary (copy), projectAskUserSegments (copy), projectPlanSegments (copy), StudioAskUserTool (copy), GetAskUserActivityLabelFunction (copy), contentBlocksToText (copy)
	local List = {}
	local List1 = {}
	local v1 = nil
	local AnsweredPromptsByToolCallId = getAnsweredPromptsByToolCallId(p9)
	local CompletedPlansByToolCallId = getCompletedPlansByToolCallId(p9)
	
	local function flushActivity(p11, PendingAgentMessageSequenceIndex)
		-- upvalues: makeSegmentKey (upval), TurnKey (copy), List (copy), NoIsDone (copy), List1 (ref), v1 (ref), GetActiveActivityLabelFunction (upval), makeCompletedActivitySummary (upval)
		local SegmentKey = makeSegmentKey(TurnKey, if p11 then "activity-trailing" else "activity", PendingAgentMessageSequenceIndex or #List + 1)
		local CompletedActivitySummary = nil
		
		if NoIsDone and p11 then
			local ActivityItems = List1
			local v2 = v1
			
			CompletedActivitySummary = {
				kind = "activity_summary",
				summaryKind = "active",
				isLoading = true,
				key = SegmentKey,
				label = v2 or GetActiveActivityLabelFunction(ActivityItems, true),
				activityItems = ActivityItems
			}
		else
			CompletedActivitySummary = makeCompletedActivitySummary(List1, SegmentKey)
		end
		if CompletedActivitySummary ~= nil then
			table.insert(List, CompletedActivitySummary)
		end
		List1 = {}
		v1 = nil
	end
	
	local List2 = {}
	
	for activitySlot in p9.activitySlots do
		table.insert(List2, activitySlot)
	end
	table.sort(List2)
	
	for _, value in List2 do
		local ActivitySlot = p9.activitySlots[value]
		
		if ActivitySlot.kind == "agent_message" then
			flushActivity(false, value)
			local AgentMessage = makeSegmentKey(TurnKey, "agent-message", value)
			local Text = ActivitySlot.text
			local Config = if Text == "" then nil else { kind = "agent_message", key = AgentMessage, text = Text }
			
			if Config ~= nil then
				table.insert(List, Config)
			end
		elseif ActivitySlot.kind == "tool_call" then
			local ToolCallId = ActivitySlot.toolCallId
			local ProjectAskUserSegmentsResult = projectAskUserSegments(p9, TurnKey, ToolCallId, AnsweredPromptsByToolCallId, p10)
			local ProjectAskUserSegmentsResult1 = if #ProjectAskUserSegmentsResult > 0 then ProjectAskUserSegmentsResult else projectPlanSegments(p9, TurnKey, ToolCallId, CompletedPlansByToolCallId, p10)
			
			if #ProjectAskUserSegmentsResult1 > 0 then
				flushActivity(false, value)
				
				for _, value1 in ProjectAskUserSegmentsResult1 do
					table.insert(List, value1)
				end
				if NoIsDone then
					local config = nil
					if ActivitySlot.kind == "tool_call" then
						local ToolCall = p9.toolCalls[ActivitySlot.toolCallId]
						config = {
							kind = "tool_call",
							toolCallId = ActivitySlot.toolCallId,
							title = if ToolCall then ToolCall.title else nil,
							status = if ToolCall then ToolCall.status else nil
						}
					else
						config = nil
					end
					if config ~= nil then
						table.insert(List1, config)
					end
					local ToolCallId1 = ActivitySlot.toolCallId
					local AskUserByToolCallIdEntry = p10.askUserByToolCallId[ToolCallId1]
					local ToolCall = p9.toolCalls[ToolCallId1]
					
					if AskUserByToolCallIdEntry == nil or ToolCall == nil then
						v1 = nil
					else
						local ExtractQuestionsFromToolCallResult = StudioAskUserTool.extractQuestionsFromToolCall(ToolCall)
						
						if ExtractQuestionsFromToolCallResult == nil then
							v1 = nil
						else
							local ExtractQuestionsFromToolCallResultEntry = ExtractQuestionsFromToolCallResult[AskUserByToolCallIdEntry.currentIndex]
							v1 = GetAskUserActivityLabelFunction(#ExtractQuestionsFromToolCallResult, if ExtractQuestionsFromToolCallResultEntry == nil then nil else #ExtractQuestionsFromToolCallResultEntry.options)
						end
					end
				end
			else
				local config = nil
				if ActivitySlot.kind == "tool_call" then
					local ToolCall = p9.toolCalls[ActivitySlot.toolCallId]
					config = {
						kind = "tool_call",
						toolCallId = ActivitySlot.toolCallId,
						title = if ToolCall then ToolCall.title else nil,
						status = if ToolCall then ToolCall.status else nil
					}
				else
					config = nil
				end
				if config ~= nil then
					table.insert(List1, config)
				end
			end
		end
	end
	local ContentBlocksToTextResult = contentBlocksToText(p9.pendingAgentMessageContent)
	
	if ContentBlocksToTextResult ~= "" then
		flushActivity(false, p9.pendingAgentMessageSequenceIndex)
		local PendingAgentMessage = makeSegmentKey(TurnKey, "pending-agent-message")
		local Config = if ContentBlocksToTextResult == "" then nil else {
			kind = "agent_message",
			key = PendingAgentMessage,
			text = ContentBlocksToTextResult
		}
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	end
	flushActivity(true, nil)
	
	return List
end

local function makeTurnWorkSegment(TurnKey, Segments, EventMetaBySequenceId, StartSequenceId, EndSequenceId)
	-- upvalues: countActionsInSegments (copy), makeSegmentKey (copy), GetTurnWorkedDurationLabelFunction (copy)
	if #Segments == 0 then
		return nil
	else
		local CountActionsInSegmentsResult = countActionsInSegments(Segments)
		
		return {
			kind = "turn_work",
			key = makeSegmentKey(TurnKey, "work"),
			label = GetTurnWorkedDurationLabelFunction(EventMetaBySequenceId, StartSequenceId, EndSequenceId, CountActionsInSegmentsResult),
			segments = Segments,
			actionCount = CountActionsInSegmentsResult
		}
	end
end

local function addTerminalAssistantMessageSegments(List, p11, TurnKey)
	-- upvalues: getAssistantMessageTexts (copy), makeSegmentKey (copy)
	for i, Text in getAssistantMessageTexts(p11) do
		local TerminalAgentMessage = makeSegmentKey(TurnKey, "terminal-agent-message", i)
		local Config = if Text == "" then nil else {
			kind = "agent_message",
			key = TerminalAgentMessage,
			text = Text
		}
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	end
end

local function projectTurnSegments(p12, p13, OptimisticLocalTools)
	-- upvalues: projectWorkSegments (copy), makeTurnWorkSegment (copy), addTerminalAssistantMessageSegments (copy), makeSegmentKey (copy), TurnDisplayModule (copy), ASSISTANTSTOPPEDTEXT (copy), PublishToolUtils (copy)
	local TurnKey = nil
	if p13.turnKey == nil then
		local SessionId = p13.sessionId or (if p12 == nil then "pending-session" else p12.sessionId)
		local SequenceId = if p13.turnFeedbackIds == nil or typeof(p13.turnFeedbackIds) == "function" then nil else p13.turnFeedbackIds.sequenceId
		TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
	else
		TurnKey = p13.turnKey
	end
	local List = {}
	local TurnWorkSegment = makeTurnWorkSegment(TurnKey, projectWorkSegments(p12, TurnKey, OptimisticLocalTools, not p12.isDone), p12.eventMetaBySequenceId, p13.startSequenceId, p13.endSequenceId)
	
	if TurnWorkSegment ~= nil then
		table.insert(List, TurnWorkSegment)
	end
	addTerminalAssistantMessageSegments(List, p12, TurnKey)
	
	if p12.status == "failed" then
		local Failure = makeSegmentKey(TurnKey, "failure")
		local FormatTurnFailureMessageResult = TurnDisplayModule.formatTurnFailureMessage(p12)
		local Config = if FormatTurnFailureMessageResult == "" then nil else {
			kind = "agent_message",
			key = Failure,
			text = FormatTurnFailureMessageResult
		}
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	elseif p12.status == "cancelled" or p12.stopReason == "cancelled" then
		local Cancelled = makeSegmentKey(TurnKey, "cancelled")
		local Config = if ASSISTANTSTOPPEDTEXT == "" then nil else {
			kind = "agent_message",
			key = Cancelled,
			text = ASSISTANTSTOPPEDTEXT
		}
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	end
	if p12.isDone and PublishToolUtils.includesPublishPlaceTool(p12) then
		table.insert(List, {
			kind = "playtest_cta",
			key = makeSegmentKey(TurnKey, "playtest-cta")
		})
	end
	return List
end

return {
	formatStepCount = TurnDisplayModule.formatStepCount,
	projectActiveTurnSegments = function(p12, p13)
		-- upvalues: projectTurnSegments (copy), config (copy)
		return (projectTurnSegments(p12, p13 or {}, if p13 and p13.optimisticLocalTools then p13.optimisticLocalTools else config))
	end,
	projectLoadingTurnSegments = function(p12)
		-- upvalues: makeSegmentKey (copy), GetActiveActivityLabelFunction (copy), makeTurnWorkSegment (copy)
		local TurnKey = nil
		if p12 == nil then
			TurnKey = "loading"
		elseif p12.turnKey == nil then
			local SessionId = p12.sessionId or "pending-session"
			local SequenceId = if p12.turnFeedbackIds == nil or typeof(p12.turnFeedbackIds) == "function" then nil else p12.turnFeedbackIds.sequenceId
			TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
		else
			TurnKey = p12.turnKey
		end
		local ActivityItems = {}
		local ActivityTrailing = makeSegmentKey(TurnKey, "activity-trailing")
		
		local config = {
			kind = "activity_summary",
			summaryKind = "active",
			isLoading = true,
			key = ActivityTrailing,
			label = GetActiveActivityLabelFunction(ActivityItems, true),
			activityItems = ActivityItems
		}
		local List = {}
		
		if config ~= nil then
			table.insert(List, config)
		end
		local TurnWorkSegment = makeTurnWorkSegment(TurnKey, List)
		
		return if TurnWorkSegment == nil then {} else { TurnWorkSegment }
	end,
	projectSetupErrorSegments = function(Text, p12)
		-- upvalues: makeSegmentKey (copy)
		local TurnKey = nil
		if p12 == nil then
			TurnKey = "setup-error"
		elseif p12.turnKey == nil then
			local SessionId = p12.sessionId or "pending-session"
			local SequenceId = if p12.turnFeedbackIds == nil or typeof(p12.turnFeedbackIds) == "function" then nil else p12.turnFeedbackIds.sequenceId
			TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
		else
			TurnKey = p12.turnKey
		end
		return {
			{
				kind = "agent_message",
				key = makeSegmentKey(TurnKey, "setup-error"),
				text = Text
			}
		}
	end
}