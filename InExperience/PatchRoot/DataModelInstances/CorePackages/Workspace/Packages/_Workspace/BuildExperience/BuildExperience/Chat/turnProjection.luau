local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.chatTypes)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local TurnDisplayModule = require(script.Parent.turnDisplay)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local PublishToolUtils = CreatorAgentChatModule.PublishToolUtils
local AdCampaignEligibilityToolModule = if FFlagBuildAgentAdCampaignCardModule then require(BuildExperience.Chat.adCampaignEligibilityTool) else nil
local StudioAskUserTool = CreatorAgentChatModule.StudioAskUserTool
local StudioProposePlanTool = CreatorAgentChatModule.StudioProposePlanTool
local ASSISTANTSTOPPEDTEXT = TurnDisplayModule.ASSISTANT_STOPPED_TEXT
local CountToolCallsFunction = TurnDisplayModule.countToolCalls
local GetAskUserActivityLabelFunction = TurnDisplayModule.getAskUserActivityLabel
local GetLocalToolWaitSecondsFunction = TurnDisplayModule.getLocalToolWaitSeconds
local GetSummaryToolActivityFunction = TurnDisplayModule.getSummaryToolActivity
local config = {
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {},
	devProductByToolCallId = {}
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

local _ = function(Key, Text, IsError, ErrorCode)
	return if Text == "" then nil else {
		kind = "agent_message",
		key = Key,
		text = Text,
		isError = IsError,
		errorCode = ErrorCode
	}
end

local function makeCompletedActivitySummary(ActivityItems, Key)
	-- upvalues: GetSummaryToolActivityFunction (copy), CountToolCallsFunction (copy)
	return if #ActivityItems == 0 then nil else {
		kind = "activity_summary",
		summaryKind = "completed",
		isLoading = false,
		key = Key,
		summaryToolActivity = GetSummaryToolActivityFunction(ActivityItems, "completed"),
		activityItems = ActivityItems,
		actionCount = CountToolCallsFunction(ActivityItems)
	}
end

local function makeActiveActivitySummary(ActivityItems, IsLoading, Key, CHATASSISTANTLOADING, IsWaitingForLocalTool)
	-- upvalues: GetSummaryToolActivityFunction (copy), LocalizationStringsModule (copy)
	if #ActivityItems == 0 and not IsLoading then
		return nil
	end
	local Active = if CHATASSISTANTLOADING == nil then GetSummaryToolActivityFunction(ActivityItems, "active") else nil
	local CHATASSISTANTLOADING1 = CHATASSISTANTLOADING
	
	if CHATASSISTANTLOADING1 == nil and Active == nil then
		CHATASSISTANTLOADING1 = LocalizationStringsModule.CHAT_ASSISTANT_LOADING
	end
	return {
		kind = "activity_summary",
		summaryKind = "active",
		key = Key,
		label = CHATASSISTANTLOADING1,
		summaryToolActivity = Active,
		activityItems = ActivityItems,
		isLoading = IsLoading,
		isWaitingForLocalTool = IsWaitingForLocalTool
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

local _ = function(p5, ToolCallId, CallOrder, p6, IsActive, AnswerStackPrompt, PlanProposal, DevProductProposal)
	-- upvalues: makeSegmentKey (copy)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p5, "client-tool", ToolCallId, p6),
		toolCallId = ToolCallId,
		callOrder = CallOrder,
		isActive = IsActive,
		answerStackPrompt = AnswerStackPrompt,
		planProposal = PlanProposal,
		devProductProposal = DevProductProposal
	}
end

local _ = function(p5, ToolCallId, Entry)
	-- upvalues: makeSegmentKey (copy)
	return {
		kind = "client_tool",
		isActive = false,
		answerStackPrompt = nil,
		planProposal = nil,
		devProductProposal = nil,
		key = makeSegmentKey(p5, "client-tool", ToolCallId, 1),
		toolCallId = ToolCallId,
		callOrder = Entry[1].callOrder or 0,
		answeredPrompts = Entry
	}
end

local function projectAskUserSegments(p5, p6, ToolCallId, p7, p8)
	-- upvalues: FFlagBuildExperienceAnswerFormModule (copy), makeSegmentKey (copy), StudioAskUserTool (copy)
	local ToolCall = p5.toolCalls[ToolCallId]
	
	if ToolCall == nil then
		return {}
	end
	local List = {}
	local AnsweredPrompts = p7[ToolCallId]
	
	if AnsweredPrompts == nil or #AnsweredPrompts <= 0 then
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
					devProductProposal = nil,
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
				break
			end
			if Selection == nil then break end
			table.insert(List, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				devProductProposal = nil,
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
		if not FFlagBuildExperienceAnswerFormModule or not p8.submittedToolCallIds[ToolCallId] or AskUserByToolCallIdEntry.isSubmitting or #List <= 0 then
			return List
		end
		local AnsweredPrompts1 = {}
		
		for _, value in List do
			table.insert(AnsweredPrompts1, value.answerStackPrompt)
		end
		return {
			{
				kind = "client_tool",
				isActive = false,
				answerStackPrompt = nil,
				planProposal = nil,
				devProductProposal = nil,
				key = makeSegmentKey(p6, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = AnsweredPrompts1[1].callOrder or 0,
				answeredPrompts = AnsweredPrompts1
			}
		}
	else
		if FFlagBuildExperienceAnswerFormModule then
			return {
				{
					kind = "client_tool",
					isActive = false,
					answerStackPrompt = nil,
					planProposal = nil,
					devProductProposal = nil,
					key = makeSegmentKey(p6, "client-tool", ToolCallId, 1),
					toolCallId = ToolCallId,
					callOrder = AnsweredPrompts[1].callOrder or 0,
					answeredPrompts = AnsweredPrompts
				}
			}
		end
		for i, answeredPrompt in AnsweredPrompts do
			table.insert(List, {
				kind = "client_tool",
				isActive = false,
				planProposal = nil,
				devProductProposal = nil,
				key = makeSegmentKey(p6, "client-tool", ToolCallId, i),
				toolCallId = ToolCallId,
				callOrder = answeredPrompt.callOrder or i,
				answerStackPrompt = answeredPrompt
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
				devProductProposal = nil,
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
				devProductProposal = nil,
				key = makeSegmentKey(p10, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = PlanProposal.callOrder or 0,
				planProposal = PlanProposal
			}
		}
	end
end

local function projectDevProductSegments(p9, p10, ToolCallId, p11)
	-- upvalues: makeSegmentKey (copy)
	if p9.toolCalls[ToolCallId] == nil then
		return {}
	else
		local DevProductByToolCallIdEntry = p11.devProductByToolCallId[ToolCallId]
		
		return if DevProductByToolCallIdEntry == nil then {} else {
			{
				kind = "client_tool",
				answerStackPrompt = nil,
				planProposal = nil,
				key = makeSegmentKey(p10, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = DevProductByToolCallIdEntry.callOrder,
				isActive = DevProductByToolCallIdEntry.isApproved ~= true and (DevProductByToolCallIdEntry.isRejected ~= true and not p11.submittedToolCallIds[ToolCallId]),
				devProductProposal = DevProductByToolCallIdEntry
			}
		}
	end
end

local function projectLocalToolSegments(p9, p10, ToolCallId, p11, p12, p13)
	-- upvalues: projectAskUserSegments (copy), projectPlanSegments (copy), FFlagBuildExperienceManageDevProductModule (copy), projectDevProductSegments (copy)
	local ProjectAskUserSegmentsResult = projectAskUserSegments(p9, p10, ToolCallId, p11, p13)
	
	if #ProjectAskUserSegmentsResult > 0 then
		return ProjectAskUserSegmentsResult
	else
		local ProjectPlanSegmentsResult = projectPlanSegments(p9, p10, ToolCallId, p12, p13)
		
		return if #ProjectPlanSegmentsResult > 0 then ProjectPlanSegmentsResult elseif FFlagBuildExperienceManageDevProductModule then projectDevProductSegments(p9, p10, ToolCallId, p13) else {}
	end
end

local function getActiveAskUserActivityLabel(p9, ToolCallId, p10)
	-- upvalues: LocalizationStringsModule (copy), StudioAskUserTool (copy), GetAskUserActivityLabelFunction (copy)
	local AskUserByToolCallIdEntry = p10.askUserByToolCallId[ToolCallId]
	local ToolCall = p9.toolCalls[ToolCallId]
	
	if AskUserByToolCallIdEntry == nil or ToolCall == nil then
		return nil
	elseif p10.submittedToolCallIds[ToolCallId] then
		return LocalizationStringsModule.CHAT_ASSISTANT_LOADING
	else
		local ExtractQuestionsFromToolCallResult = StudioAskUserTool.extractQuestionsFromToolCall(ToolCall)
		
		if ExtractQuestionsFromToolCallResult == nil then
			return nil
		else
			local ExtractQuestionsFromToolCallResultEntry = ExtractQuestionsFromToolCallResult[AskUserByToolCallIdEntry.currentIndex]
			
			return GetAskUserActivityLabelFunction(#ExtractQuestionsFromToolCallResult, if ExtractQuestionsFromToolCallResultEntry == nil then nil else #ExtractQuestionsFromToolCallResultEntry.options)
		end
	end
end

local function projectWorkSegments(p9, TurnKey, p10, NoIsDone)
	-- upvalues: getAnsweredPromptsByToolCallId (copy), getCompletedPlansByToolCallId (copy), makeSegmentKey (copy), makeActiveActivitySummary (copy), makeCompletedActivitySummary (copy), projectLocalToolSegments (copy), getActiveAskUserActivityLabel (copy), contentBlocksToText (copy)
	local List = {}
	local ActivityItems = {}
	local v1 = nil
	local Flag = false
	local AnsweredPromptsByToolCallId = getAnsweredPromptsByToolCallId(p9)
	local CompletedPlansByToolCallId = getCompletedPlansByToolCallId(p9)
	
	local function flushActivity(p11, PendingAgentMessageSequenceIndex)
		-- upvalues: makeSegmentKey (upval), TurnKey (copy), List (copy), NoIsDone (copy), makeActiveActivitySummary (upval), ActivityItems (ref), v1 (ref), Flag (ref), makeCompletedActivitySummary (upval)
		local SegmentKey = makeSegmentKey(TurnKey, if p11 then "activity-trailing" else "activity", PendingAgentMessageSequenceIndex or #List + 1)
		local ActiveActivitySummary = if NoIsDone and p11 then makeActiveActivitySummary(ActivityItems, true, SegmentKey, v1, Flag) else makeCompletedActivitySummary(ActivityItems, SegmentKey)
		
		if ActiveActivitySummary ~= nil then
			table.insert(List, ActiveActivitySummary)
		end
		ActivityItems = {}
		v1 = nil
		Flag = false
	end
	
	local List1 = {}
	
	for activitySlot in p9.activitySlots do
		table.insert(List1, activitySlot)
	end
	table.sort(List1)
	
	for _, value in List1 do
		local ActivitySlot = p9.activitySlots[value]
		
		if ActivitySlot.kind == "agent_message" then
			flushActivity(false, value)
			local AgentMessage = makeSegmentKey(TurnKey, "agent-message", value)
			local Text = ActivitySlot.text
			local Config = if Text == "" then nil else {
				kind = "agent_message",
				isError = nil,
				errorCode = nil,
				key = AgentMessage,
				text = Text
			}
			
			if Config ~= nil then
				table.insert(List, Config)
			end
		elseif ActivitySlot.kind == "tool_call" then
			local ProjectLocalToolSegmentsResult = projectLocalToolSegments(p9, TurnKey, ActivitySlot.toolCallId, AnsweredPromptsByToolCallId, CompletedPlansByToolCallId, p10)
			
			if #ProjectLocalToolSegmentsResult > 0 then
				flushActivity(false, value)
				
				for _, value1 in ProjectLocalToolSegmentsResult do
					table.insert(List, value1)
					
					if value1.isActive then
						Flag = true
					end
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
						table.insert(ActivityItems, config)
					end
					v1 = getActiveAskUserActivityLabel(p9, ActivitySlot.toolCallId, p10)
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
					table.insert(ActivityItems, config)
				end
			end
		end
	end
	local ContentBlocksToTextResult = contentBlocksToText(p9.pendingAgentMessageContent)
	
	if ContentBlocksToTextResult ~= "" then
		flushActivity(false, p9.pendingAgentMessageSequenceIndex)
		local PendingAgentMessage = if p9.pendingAgentMessageSequenceIndex == nil then makeSegmentKey(TurnKey, "pending-agent-message") else makeSegmentKey(TurnKey, "agent-message", p9.pendingAgentMessageSequenceIndex)
		local Config = if ContentBlocksToTextResult == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
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

local function makeTurnWorkSegment(TurnKey, Segments, EventMetaBySequenceId, StartSequenceId, EndSequenceId, p11)
	-- upvalues: countActionsInSegments (copy), LocalizationStringsModule (copy), makeSegmentKey (copy)
	if #Segments == 0 then
		return nil
	end
	local CountActionsInSegmentsResult = countActionsInSegments(Segments)
	local CHATTURNACTIVITY = nil
	local Largest = nil
	
	if EventMetaBySequenceId ~= nil and StartSequenceId ~= nil and EndSequenceId ~= nil then
		local EventMetaBySequenceIdEntry = EventMetaBySequenceId[StartSequenceId]
		local EventMetaBySequenceIdEntry1 = EventMetaBySequenceId[EndSequenceId]
		local EmittedTime = if EventMetaBySequenceIdEntry == nil then nil else EventMetaBySequenceIdEntry.emittedTime
		local EmittedTime1 = if EventMetaBySequenceIdEntry1 == nil then nil else EventMetaBySequenceIdEntry1.emittedTime
		local _DateTime = if EmittedTime == nil or EmittedTime == "" then nil else DateTime.fromIsoDate(EmittedTime)
		local _DateTime1 = if EmittedTime1 == nil or EmittedTime1 == "" then nil else DateTime.fromIsoDate(EmittedTime1)
		
		if _DateTime ~= nil and _DateTime1 ~= nil then
			local UnixTimestampMillisRatio = (_DateTime1.UnixTimestampMillis - _DateTime.UnixTimestampMillis) / 1000
			Largest = if p11 == nil then UnixTimestampMillisRatio else math.max(0, UnixTimestampMillisRatio - p11)
		end
	end
	if Largest == nil and CountActionsInSegmentsResult == 0 then
		CHATTURNACTIVITY = LocalizationStringsModule.CHAT_TURN_ACTIVITY
	end
	return {
		kind = "turn_work",
		key = makeSegmentKey(TurnKey, "work"),
		label = CHATTURNACTIVITY,
		segments = Segments,
		actionCount = CountActionsInSegmentsResult,
		workedDurationSeconds = Largest
	}
end

local function addTerminalAssistantMessageSegments(List, p11, TurnKey)
	-- upvalues: getAssistantMessageTexts (copy), makeSegmentKey (copy)
	for i, Text in getAssistantMessageTexts(p11) do
		local TerminalAgentMessage = makeSegmentKey(TurnKey, "terminal-agent-message", i)
		local Config = if Text == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = TerminalAgentMessage,
			text = Text
		}
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	end
end

local function addAgentAdCampaignCardSegments(List, p12, TurnKey)
	-- upvalues: AdCampaignEligibilityToolModule (copy), makeSegmentKey (copy)
	local t = {}
	local List1 = {}
	
	for activitySlot in p12.activitySlots do
		table.insert(List1, activitySlot)
	end
	table.sort(List1)
	
	for _, value in List1 do
		local ActivitySlot = p12.activitySlots[value]
		
		if ActivitySlot.kind == "tool_call" then
			local ToolCall = p12.toolCalls[ActivitySlot.toolCallId]
			
			if AdCampaignEligibilityToolModule.isCompletedEligibilityToolCall(ToolCall) and not t[ToolCall.toolCallId] then
				t[ToolCall.toolCallId] = true
				local DecodeCompletedEligibilityResult = AdCampaignEligibilityToolModule.decodeCompletedEligibility(ToolCall)
				local CardOffers = AdCampaignEligibilityToolModule.getCardOffers(DecodeCompletedEligibilityResult)
				table.insert(List, {
					kind = "agent_ad_campaign_card",
					key = makeSegmentKey(TurnKey, "ad-campaign", ToolCall.toolCallId),
					toolCallId = ToolCall.toolCallId,
					availableCreditsSnapshot = if DecodeCompletedEligibilityResult == nil then 0 else DecodeCompletedEligibilityResult.freeCreditsRemaining,
					offers = CardOffers,
					shouldCheckCampaignStatus = DecodeCompletedEligibilityResult == nil or CardOffers ~= nil
				})
			end
		end
	end
end

local function projectTurnSegments(p13, p14, OptimisticLocalTools)
	-- upvalues: projectWorkSegments (copy), GetLocalToolWaitSecondsFunction (copy), makeTurnWorkSegment (copy), addTerminalAssistantMessageSegments (copy), FFlagBuildAgentAdCampaignCardModule (copy), addAgentAdCampaignCardSegments (copy), LocalizationStringsModule (copy), makeSegmentKey (copy), ASSISTANTSTOPPEDTEXT (copy), PublishToolUtils (copy)
	local TurnKey = nil
	if p14.turnKey == nil then
		local SessionId = p14.sessionId or (if p13 == nil then "pending-session" else p13.sessionId)
		local SequenceId = if p14.turnFeedbackIds == nil or typeof(p14.turnFeedbackIds) == "function" then nil else p14.turnFeedbackIds.sequenceId
		TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
	else
		TurnKey = p14.turnKey
	end
	local List = {}
	local TurnWorkSegment = makeTurnWorkSegment(TurnKey, projectWorkSegments(p13, TurnKey, OptimisticLocalTools, not p13.isDone), p13.eventMetaBySequenceId, p14.startSequenceId, p14.endSequenceId, (GetLocalToolWaitSecondsFunction(p13)))
	
	if TurnWorkSegment ~= nil then
		table.insert(List, TurnWorkSegment)
	end
	addTerminalAssistantMessageSegments(List, p13, TurnKey)
	
	if FFlagBuildAgentAdCampaignCardModule then
		addAgentAdCampaignCardSegments(List, p13, TurnKey)
	end
	if p13.status == "failed" or p13.stopReason == "error" then
		local CHATASSISTANTRESPONSEFAILED = LocalizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED
		local ErrorCode = p13.errorCode
		local Failure = makeSegmentKey(TurnKey, "failure")
		local Config = if CHATASSISTANTRESPONSEFAILED == "" then nil else {
			kind = "agent_message",
			isError = true,
			key = Failure,
			text = CHATASSISTANTRESPONSEFAILED,
			errorCode = ErrorCode
		}
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	elseif p13.status == "cancelled" or p13.stopReason == "cancelled" then
		local Cancelled = makeSegmentKey(TurnKey, "cancelled")
		local Config = if ASSISTANTSTOPPEDTEXT == "" then nil else {
			kind = "agent_message",
			isError = nil,
			errorCode = nil,
			key = Cancelled,
			text = ASSISTANTSTOPPEDTEXT
		}
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	end
	if p13.isDone and PublishToolUtils.includesPublishPlaceTool(p13) and p14.showPlaytestCta == true then
		table.insert(List, {
			kind = "playtest_cta",
			key = makeSegmentKey(TurnKey, "playtest-cta")
		})
	end
	return List
end

return {
	getFinalAssistantMessageText = function(p13)
		-- upvalues: getAssistantMessageTexts (copy)
		local AssistantMessageTexts = getAssistantMessageTexts(p13)
		
		return AssistantMessageTexts[#AssistantMessageTexts]
	end,
	projectActiveTurnSegments = function(p13, p14)
		-- upvalues: projectTurnSegments (copy), config (copy)
		return (projectTurnSegments(p13, p14 or {}, if p14 and p14.optimisticLocalTools then p14.optimisticLocalTools else config))
	end,
	projectLoadingTurnSegments = function(p13)
		-- upvalues: makeActiveActivitySummary (copy), makeSegmentKey (copy), countActionsInSegments (copy), LocalizationStringsModule (copy)
		local TurnKey = nil
		if p13 == nil then
			TurnKey = "loading"
		elseif p13.turnKey == nil then
			local SessionId = p13.sessionId or "pending-session"
			local SequenceId = if p13.turnFeedbackIds == nil or typeof(p13.turnFeedbackIds) == "function" then nil else p13.turnFeedbackIds.sequenceId
			TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
		else
			TurnKey = p13.turnKey
		end
		local ActiveActivitySummary = makeActiveActivitySummary({}, true, makeSegmentKey(TurnKey, "activity-trailing"), nil)
		local Segments = {}
		
		if ActiveActivitySummary ~= nil then
			table.insert(Segments, ActiveActivitySummary)
		end
		local v2 = nil
		if #Segments == 0 then
			v2 = nil
		else
			local CountActionsInSegmentsResult = countActionsInSegments(Segments)
			local CHATTURNACTIVITY = nil
			local WorkedDurationSeconds = nil
			
			if WorkedDurationSeconds == nil and CountActionsInSegmentsResult == 0 then
				CHATTURNACTIVITY = LocalizationStringsModule.CHAT_TURN_ACTIVITY
			end
			v2 = {
				kind = "turn_work",
				key = makeSegmentKey(TurnKey, "work"),
				label = CHATTURNACTIVITY,
				segments = Segments,
				actionCount = CountActionsInSegmentsResult,
				workedDurationSeconds = WorkedDurationSeconds
			}
		end
		return if v2 == nil then {} else { v2 }
	end,
	projectSetupErrorSegments = function(Text, p13)
		-- upvalues: makeSegmentKey (copy)
		local TurnKey = nil
		if p13 == nil then
			TurnKey = "setup-error"
		elseif p13.turnKey == nil then
			local SessionId = p13.sessionId or "pending-session"
			local SequenceId = if p13.turnFeedbackIds == nil or typeof(p13.turnFeedbackIds) == "function" then nil else p13.turnFeedbackIds.sequenceId
			TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
		else
			TurnKey = p13.turnKey
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