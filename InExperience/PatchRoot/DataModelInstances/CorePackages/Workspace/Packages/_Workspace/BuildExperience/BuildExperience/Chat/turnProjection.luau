local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.chatTypes)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local TurnDisplayModule = require(script.Parent.turnDisplay)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildExperienceToolDisplaySummaryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolDisplaySummary)
local GetToolDisplaySummaryFunction = require(script.Parent.toolDisplaySummary).getToolDisplaySummary
local FFlagBuildExperienceStepListModule = require(BuildExperience.Flags.FFlagBuildExperienceStepList)
local StepSentencesModule = if FFlagBuildExperienceStepListModule then require(script.Parent.stepSentences) else nil
local LocalToolStepsModule = if FFlagBuildExperienceStepListModule then require(script.Parent.localToolSteps) else nil
local DevProductCallModule = if FFlagBuildExperienceStepListModule then require(script.Parent.devProductCall) else nil
local FFlagBuildExperienceThoughtStatus = CreatorAgentChatModule.FFlagBuildExperienceThoughtStatus
local GetThoughtHeadingFunction = require(script.Parent.thoughtHeading).getThoughtHeading
local SplitThoughtFunction = require(script.Parent.thoughtHeading).splitThought
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

local function makeTurnActivityItem(p3, ActivitySlot)
	-- upvalues: FFlagBuildExperienceThoughtStatus (copy), FFlagBuildExperienceToolDisplaySummaryModule (copy), GetToolDisplaySummaryFunction (copy)
	if FFlagBuildExperienceThoughtStatus and ActivitySlot.kind == "thought" then
		return { kind = "thought", text = ActivitySlot.text }
	elseif ActivitySlot.kind == "tool_call" then
		local ToolCall = p3.toolCalls[ActivitySlot.toolCallId]
		
		return {
			kind = "tool_call",
			toolCallId = ActivitySlot.toolCallId,
			title = if ToolCall then ToolCall.title else nil,
			status = if ToolCall then ToolCall.status else nil,
			displaySummary = if FFlagBuildExperienceToolDisplaySummaryModule and ToolCall then GetToolDisplaySummaryFunction(ToolCall.title, ToolCall.rawInput) else nil
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

local function hasHeadedThought(ActivityItems): boolean
	-- upvalues: SplitThoughtFunction (copy)
	for _, activityItem in ActivityItems do
		if activityItem.kind == "thought" and SplitThoughtFunction(activityItem.text).title ~= nil then
			return true
		end
	end
	return false
end

local function makeCompletedActivitySummary(ActivityItems, Key, p3, LocalToolSteps)
	-- upvalues: FFlagBuildExperienceThoughtStatus (copy), CountToolCallsFunction (copy), FFlagBuildExperienceStepListModule (copy), hasHeadedThought (copy), GetSummaryToolActivityFunction (copy)
	return if #ActivityItems == 0 then nil elseif FFlagBuildExperienceThoughtStatus and CountToolCallsFunction(ActivityItems) == 0 and (not FFlagBuildExperienceStepListModule or not hasHeadedThought(ActivityItems)) then nil else {
		kind = "activity_summary",
		summaryKind = "completed",
		key = Key,
		summaryToolActivity = GetSummaryToolActivityFunction(ActivityItems, "completed"),
		activityItems = ActivityItems,
		actionCount = CountToolCallsFunction(ActivityItems),
		isLoading = FFlagBuildExperienceStepListModule and p3,
		localToolSteps = LocalToolSteps
	}
end

local function getLatestThoughtHeading(p3)
	-- upvalues: GetThoughtHeadingFunction (copy)
	local TurnActivityItem = nil
	for i = #p3, 1, -1 do
		TurnActivityItem = p3[i]
		
		if TurnActivityItem.kind == "thought" then
			return GetThoughtHeadingFunction(TurnActivityItem.text)
		end
	end
	return nil
end

local function getRunningThoughtHeading(p4, LocalToolSteps)
	-- upvalues: StepSentencesModule (copy), SplitThoughtFunction (copy)
	local Title = nil
	for i = #p4, 1, -1 do
		local TurnActivityItem = p4[i]
		
		if TurnActivityItem.kind ~= "tool_call" then
			if TurnActivityItem.kind == "thought" then
				Title = SplitThoughtFunction(TurnActivityItem.text).title
				
				if Title ~= nil then
					return Title
				end
			end
		elseif LocalToolSteps == nil or LocalToolSteps[TurnActivityItem.toolCallId] == nil then
			if not StepSentencesModule.isActiveCall(TurnActivityItem) then
				return nil
			end
		else
			return nil
		end
	end
	return nil
end

local function getItemsNamingTheHeader(ActivityItems, LocalToolSteps)
	if LocalToolSteps == nil then
		return ActivityItems
	end
	local List = {}
	
	for _, activityItem in ActivityItems do
		local LocalToolStep = if activityItem.kind == "tool_call" then LocalToolSteps[activityItem.toolCallId] else nil
		
		if LocalToolStep == nil or LocalToolStep.isWaiting then
			table.insert(List, activityItem)
		end
	end
	return List
end

local function makeActiveActivitySummary(ActivityItems, IsLoading, Key, CHATASSISTANTLOADING, Enabled, p5, LocalToolSteps, Enabled1)
	-- upvalues: FFlagBuildExperienceStepListModule (copy), getItemsNamingTheHeader (copy), GetSummaryToolActivityFunction (copy), FFlagBuildExperienceToolDisplaySummaryModule (copy), FFlagBuildExperienceThoughtStatus (copy), LocalizationStringsModule (copy)
	if #ActivityItems == 0 and not IsLoading then
		return nil
	end
	local v1: boolean = FFlagBuildExperienceStepListModule and #getItemsNamingTheHeader(ActivityItems, LocalToolSteps) > 0
	
	if v1 and Enabled ~= true then
		CHATASSISTANTLOADING = nil
	end
	local Active = if CHATASSISTANTLOADING == nil then GetSummaryToolActivityFunction(if FFlagBuildExperienceStepListModule then getItemsNamingTheHeader(ActivityItems, LocalToolSteps) else ActivityItems, "active") else nil
	local CHATASSISTANTLOADING1 = CHATASSISTANTLOADING
	local HasDisplaySummary: boolean = FFlagBuildExperienceToolDisplaySummaryModule and (Active ~= nil and (Active.kind == "tool_call" and Active.displaySummary ~= nil))
	
	if FFlagBuildExperienceThoughtStatus and CHATASSISTANTLOADING1 == nil and p5 ~= nil and not HasDisplaySummary then
		CHATASSISTANTLOADING1 = p5
		Active = nil
	end
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
		isWaitingForLocalTool = Enabled,
		localToolSteps = LocalToolSteps,
		hasLabelOverride = if FFlagBuildExperienceStepListModule then CHATASSISTANTLOADING ~= nil or Enabled1 == true and not v1 else nil,
		ignoresEarlierSteps = if FFlagBuildExperienceStepListModule then Enabled1 else nil
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

local function getAnsweredPromptsByToolCallId(p5)
	-- upvalues: StudioAskUserTool (copy)
	local t = {}
	
	for _, value in StudioAskUserTool.getAnsweredPromptsFromTurnState(p5) do
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

local function getCompletedPlansByToolCallId(p6)
	-- upvalues: StudioProposePlanTool (copy)
	local t = {}
	
	for _, value in StudioProposePlanTool.getCompletedPlansFromTurnState(p6) do
		if value.toolCallId ~= nil then
			t[value.toolCallId] = value
		end
	end
	return t
end

local _ = function(p7, ToolCallId, CallOrder, p8, IsActive, AnswerStackPrompt, PlanProposal, DevProductProposal)
	-- upvalues: makeSegmentKey (copy)
	return {
		kind = "client_tool",
		key = makeSegmentKey(p7, "client-tool", ToolCallId, p8),
		toolCallId = ToolCallId,
		callOrder = CallOrder,
		isActive = IsActive,
		answerStackPrompt = AnswerStackPrompt,
		planProposal = PlanProposal,
		devProductProposal = DevProductProposal
	}
end

local _ = function(p7, ToolCallId, Entry)
	-- upvalues: makeSegmentKey (copy)
	return {
		kind = "client_tool",
		isActive = false,
		answerStackPrompt = nil,
		planProposal = nil,
		devProductProposal = nil,
		key = makeSegmentKey(p7, "client-tool", ToolCallId, 1),
		toolCallId = ToolCallId,
		callOrder = Entry[1].callOrder or 0,
		answeredPrompts = Entry
	}
end

local function projectAskUserSegments(p7, p8, ToolCallId, p9, p10)
	-- upvalues: FFlagBuildExperienceAnswerFormModule (copy), makeSegmentKey (copy), StudioAskUserTool (copy)
	local ToolCall = p7.toolCalls[ToolCallId]
	
	if ToolCall == nil then
		return {}
	end
	local List = {}
	local AnsweredPrompts = p9[ToolCallId]
	
	if AnsweredPrompts == nil or #AnsweredPrompts <= 0 then
		local ExtractQuestionsFromToolCallResult = StudioAskUserTool.extractQuestionsFromToolCall(ToolCall)
		local AskUserByToolCallIdEntry = p10.askUserByToolCallId[ToolCallId]
		
		if ExtractQuestionsFromToolCallResult == nil or AskUserByToolCallIdEntry == nil then
			return List
		end
		local Selection = nil
		for i1, Question in ExtractQuestionsFromToolCallResult do
			Selection = AskUserByToolCallIdEntry.selections[i1]
			
			if i1 == AskUserByToolCallIdEntry.currentIndex and not p10.submittedToolCallIds[ToolCallId] then
				table.insert(List, {
					kind = "client_tool",
					isActive = true,
					planProposal = nil,
					devProductProposal = nil,
					key = makeSegmentKey(p8, "client-tool", ToolCallId, i1),
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
				key = makeSegmentKey(p8, "client-tool", ToolCallId, i1),
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
		if not FFlagBuildExperienceAnswerFormModule or not p10.submittedToolCallIds[ToolCallId] or AskUserByToolCallIdEntry.isSubmitting or #List <= 0 then
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
				key = makeSegmentKey(p8, "client-tool", ToolCallId, 1),
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
					key = makeSegmentKey(p8, "client-tool", ToolCallId, 1),
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
				key = makeSegmentKey(p8, "client-tool", ToolCallId, i),
				toolCallId = ToolCallId,
				callOrder = answeredPrompt.callOrder or i,
				answerStackPrompt = answeredPrompt
			})
		end
		return List
	end
end

local function projectPlanSegments(p11, p12, ToolCallId, p13, p14)
	-- upvalues: makeSegmentKey (copy), StudioProposePlanTool (copy)
	local ToolCall = p11.toolCalls[ToolCallId]
	
	if ToolCall == nil then
		return {}
	end
	local PlanProposal = p13[ToolCallId]
	
	if PlanProposal == nil then
		local PlanByToolCallIdEntry = p14.planByToolCallId[ToolCallId]
		local ExtractPlanFromToolCallResult = StudioProposePlanTool.extractPlanFromToolCall(ToolCall)
		
		return if ExtractPlanFromToolCallResult == nil or PlanByToolCallIdEntry == nil then {} else {
			{
				kind = "client_tool",
				answerStackPrompt = nil,
				devProductProposal = nil,
				key = makeSegmentKey(p12, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = PlanByToolCallIdEntry.callOrder,
				isActive = PlanByToolCallIdEntry.isAccepted ~= true and (PlanByToolCallIdEntry.feedbackText == nil and not p14.submittedToolCallIds[ToolCallId]),
				planProposal = {
					title = ExtractPlanFromToolCallResult.title,
					isDefaultTitle = ExtractPlanFromToolCallResult.isDefaultTitle,
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
				key = makeSegmentKey(p12, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = PlanProposal.callOrder or 0,
				planProposal = PlanProposal
			}
		}
	end
end

local function projectDevProductSegments(p11, p12, ToolCallId, p13)
	-- upvalues: makeSegmentKey (copy)
	if p11.toolCalls[ToolCallId] == nil then
		return {}
	else
		local DevProductByToolCallIdEntry = p13.devProductByToolCallId[ToolCallId]
		
		return if DevProductByToolCallIdEntry == nil then {} else {
			{
				kind = "client_tool",
				answerStackPrompt = nil,
				planProposal = nil,
				key = makeSegmentKey(p12, "client-tool", ToolCallId, 1),
				toolCallId = ToolCallId,
				callOrder = DevProductByToolCallIdEntry.callOrder,
				isActive = DevProductByToolCallIdEntry.isApproved ~= true and (DevProductByToolCallIdEntry.isRejected ~= true and not p13.submittedToolCallIds[ToolCallId]),
				devProductProposal = DevProductByToolCallIdEntry
			}
		}
	end
end

local function projectLocalToolSegments(p11, p12, ToolCallId, p13, p14, p15)
	-- upvalues: projectAskUserSegments (copy), projectPlanSegments (copy), FFlagBuildExperienceManageDevProductModule (copy), projectDevProductSegments (copy)
	local ProjectAskUserSegmentsResult = projectAskUserSegments(p11, p12, ToolCallId, p13, p15)
	
	if #ProjectAskUserSegmentsResult > 0 then
		return ProjectAskUserSegmentsResult
	else
		local ProjectPlanSegmentsResult = projectPlanSegments(p11, p12, ToolCallId, p14, p15)
		
		return if #ProjectPlanSegmentsResult > 0 then ProjectPlanSegmentsResult elseif FFlagBuildExperienceManageDevProductModule then projectDevProductSegments(p11, p12, ToolCallId, p15) else {}
	end
end

local function getActiveAskUserActivityLabel(p11, ToolCallId, p12)
	-- upvalues: LocalizationStringsModule (copy), StudioAskUserTool (copy), GetAskUserActivityLabelFunction (copy)
	local AskUserByToolCallIdEntry = p12.askUserByToolCallId[ToolCallId]
	local ToolCall = p11.toolCalls[ToolCallId]
	
	if AskUserByToolCallIdEntry == nil or ToolCall == nil then
		return nil
	elseif p12.submittedToolCallIds[ToolCallId] then
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

local _ = function(p11): boolean
	-- upvalues: FFlagBuildExperienceStepListModule (copy), FFlagBuildExperienceManageDevProductModule (copy), LocalToolStepsModule (copy)
	return FFlagBuildExperienceStepListModule and (FFlagBuildExperienceManageDevProductModule and LocalToolStepsModule.getDevProductToolName(p11) ~= nil)
end

local function getDevProductStep(ToolCall, p11, IsActiveCall, IsSubmittedToolCallId)
	-- upvalues: DevProductCallModule (copy), LocalToolStepsModule (copy)
	local Fields = DevProductCallModule.getFields(ToolCall)
	
	return if Fields == nil and p11 == nil and ToolCall.status == "completed" then { isWaiting = false, isFailed = true } else LocalToolStepsModule.fromDevProduct(Fields, p11, IsActiveCall, IsSubmittedToolCallId)
end

local function projectWorkSegments(p11, TurnKey, p12, NoIsDone)
	-- upvalues: FFlagBuildExperienceStepListModule (copy), getAnsweredPromptsByToolCallId (copy), getCompletedPlansByToolCallId (copy), makeSegmentKey (copy), makeActiveActivitySummary (copy), getRunningThoughtHeading (copy), FFlagBuildExperienceThoughtStatus (copy), getLatestThoughtHeading (copy), makeCompletedActivitySummary (copy), getItemsNamingTheHeader (copy), contentBlocksToText (copy), makeTurnActivityItem (copy), projectLocalToolSegments (copy), FFlagBuildExperienceManageDevProductModule (copy), LocalToolStepsModule (copy), getDevProductStep (copy), StepSentencesModule (copy), getActiveAskUserActivityLabel (copy)
	local List = {}
	local List1 = {}
	local v1 = nil
	local Flag = false
	local T = if FFlagBuildExperienceStepListModule then {} else nil
	local T1 = if FFlagBuildExperienceStepListModule then {} else nil
	local Flag1 = nil
	local AnsweredPromptsByToolCallId = getAnsweredPromptsByToolCallId(p11)
	local CompletedPlansByToolCallId = getCompletedPlansByToolCallId(p11)
	local v2 = nil
	
	local function flushActivity(p13, PendingAgentMessageSequenceIndex)
		-- upvalues: FFlagBuildExperienceStepListModule (upval), v2 (ref), makeSegmentKey (upval), TurnKey (copy), List (copy), T (ref), NoIsDone (copy), makeActiveActivitySummary (upval), List1 (ref), v1 (ref), Flag (ref), getRunningThoughtHeading (upval), FFlagBuildExperienceThoughtStatus (upval), getLatestThoughtHeading (upval), Flag1 (ref), makeCompletedActivitySummary (upval), T1 (ref), getItemsNamingTheHeader (upval)
		local v3 = if FFlagBuildExperienceStepListModule then v2 else nil
		local SegmentKey = makeSegmentKey(TurnKey, if v3 == nil and p13 then "activity-trailing" else "activity", v3 or (PendingAgentMessageSequenceIndex or #List + 1))
		local T2 = if FFlagBuildExperienceStepListModule and T ~= nil and next(T) ~= nil then T else nil
		local ActiveActivitySummary = if NoIsDone and p13 then makeActiveActivitySummary(List1, true, SegmentKey, v1, Flag, if FFlagBuildExperienceStepListModule then getRunningThoughtHeading(List1, T2) elseif FFlagBuildExperienceThoughtStatus then getLatestThoughtHeading(List1) else nil, T2, Flag1) else makeCompletedActivitySummary(List1, SegmentKey, FFlagBuildExperienceStepListModule and NoIsDone, T2)
		
		if ActiveActivitySummary ~= nil then
			table.insert(List, ActiveActivitySummary)
		end
		if FFlagBuildExperienceStepListModule and T1 ~= nil then
			for _, value in T1 do
				table.insert(List, value)
			end
			T1 = {}
			T = {}
		end
		if FFlagBuildExperienceStepListModule and ActiveActivitySummary ~= nil and #getItemsNamingTheHeader(List1, T2) > 0 then
			Flag1 = nil
		end
		List1 = {}
		v2 = nil
		v1 = nil
		Flag = false
	end
	
	local ContentBlocksToTextResult = contentBlocksToText(p11.pendingAgentMessageContent)
	local Flag2 = false
	
	local function emitPendingAgentMessage()
		-- upvalues: Flag2 (ref), ContentBlocksToTextResult (copy), flushActivity (copy), p11 (copy), makeSegmentKey (upval), TurnKey (copy), List (copy)
		Flag2 = true
		
		if ContentBlocksToTextResult == "" then return end
		flushActivity(false, p11.pendingAgentMessageSequenceIndex)
		local PendingAgentMessage = if p11.pendingAgentMessageSequenceIndex == nil then makeSegmentKey(TurnKey, "pending-agent-message") else makeSegmentKey(TurnKey, "agent-message", p11.pendingAgentMessageSequenceIndex)
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
	
	local List2 = {}
	
	for activitySlot in p11.activitySlots do
		table.insert(List2, activitySlot)
	end
	table.sort(List2)
	
	for _, value in List2 do
		local PendingAgentMessageSequenceIndex = p11.pendingAgentMessageSequenceIndex
		
		if FFlagBuildExperienceThoughtStatus and not Flag2 and PendingAgentMessageSequenceIndex ~= nil and PendingAgentMessageSequenceIndex < value then
			emitPendingAgentMessage()
		end
		local ActivitySlot = p11.activitySlots[value]
		
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
		elseif FFlagBuildExperienceThoughtStatus and ActivitySlot.kind == "thought" then
			local TurnActivityItem = makeTurnActivityItem(p11, ActivitySlot)
			
			if TurnActivityItem ~= nil then
				table.insert(List1, TurnActivityItem)
				v2 = v2 or value
			end
		elseif ActivitySlot.kind == "tool_call" then
			local ProjectLocalToolSegmentsResult = projectLocalToolSegments(p11, TurnKey, ActivitySlot.toolCallId, AnsweredPromptsByToolCallId, CompletedPlansByToolCallId, p12)
			local ToolCall = if FFlagBuildExperienceStepListModule then p11.toolCalls[ActivitySlot.toolCallId] else nil
			local HasDevProductToolName: boolean = FFlagBuildExperienceStepListModule and (FFlagBuildExperienceManageDevProductModule and LocalToolStepsModule.getDevProductToolName(ToolCall) ~= nil)
			local HasDevProductToolName1: boolean = FFlagBuildExperienceStepListModule and (#ProjectLocalToolSegmentsResult == 0 and (HasDevProductToolName or LocalToolStepsModule.getPromptToolName(ToolCall) ~= nil))
			local TurnActivityItem = if FFlagBuildExperienceStepListModule and (HasDevProductToolName1 or #ProjectLocalToolSegmentsResult > 0) then makeTurnActivityItem(p11, ActivitySlot) else nil
			
			if TurnActivityItem == nil then
				if #ProjectLocalToolSegmentsResult > 0 then
					flushActivity(false, value)
					
					for _, value3 in ProjectLocalToolSegmentsResult do
						table.insert(List, value3)
						
						if value3.isActive then
							Flag = true
						end
					end
					if NoIsDone then
						local TurnActivityItem1 = makeTurnActivityItem(p11, ActivitySlot)
						
						if TurnActivityItem1 ~= nil then
							table.insert(List1, TurnActivityItem1)
						end
						v1 = getActiveAskUserActivityLabel(p11, ActivitySlot.toolCallId, p12)
						
						if FFlagBuildExperienceStepListModule then
							Flag1 = true
						end
					end
				else
					local TurnActivityItem2 = makeTurnActivityItem(p11, ActivitySlot)
					
					if TurnActivityItem2 ~= nil then
						table.insert(List1, TurnActivityItem2)
						v2 = v2 or value
					end
				end
			else
				local DevProductToolName = if HasDevProductToolName then LocalToolStepsModule.getDevProductToolName(ToolCall) else LocalToolStepsModule.getPromptToolName(ToolCall)
				
				if DevProductToolName ~= nil and TurnActivityItem.kind == "tool_call" then
					TurnActivityItem.title = DevProductToolName
				end
				table.insert(List1, TurnActivityItem)
				v2 = v2 or value
				local DevProductStep = if HasDevProductToolName then getDevProductStep(ToolCall, ProjectLocalToolSegmentsResult[1], NoIsDone and StepSentencesModule.isActiveCall(TurnActivityItem), p12.submittedToolCallIds[ActivitySlot.toolCallId] == true) elseif #ProjectLocalToolSegmentsResult > 0 then LocalToolStepsModule.fromSegments(ProjectLocalToolSegmentsResult) else {
					isWaiting = StepSentencesModule.isActiveCall(TurnActivityItem)
				}
				T[ActivitySlot.toolCallId] = DevProductStep
				
				if DevProductStep.isFailed == true and TurnActivityItem.kind == "tool_call" then
					TurnActivityItem.status = "failed"
				end
				local t = {}
				
				for _, value1 in ProjectLocalToolSegmentsResult do
					if value1.isActive then
						Flag = true
					end
					if LocalToolStepsModule.keepsCard(value1) then
						table.insert(if DevProductStep.isWaiting then T1 else t, value1)
					end
				end
				if NoIsDone then
					v1 = getActiveAskUserActivityLabel(p11, ActivitySlot.toolCallId, p12)
					Flag1 = true
				end
				if #t > 0 then
					flushActivity(false, value)
					
					for _, value2 in t do
						table.insert(List, value2)
					end
				end
			end
		end
	end
	if not FFlagBuildExperienceThoughtStatus or not Flag2 then
		emitPendingAgentMessage()
	end
	flushActivity(true, nil)
	
	return List
end

local function makeTurnWorkSegment(TurnKey, Segments, EventMetaBySequenceId, StartSequenceId, EndSequenceId, p14)
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
			Largest = if p14 == nil then UnixTimestampMillisRatio else math.max(0, UnixTimestampMillisRatio - p14)
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

local function addTerminalAssistantMessageSegments(List, p14, TurnKey)
	-- upvalues: getAssistantMessageTexts (copy), makeSegmentKey (copy)
	for i, Text in getAssistantMessageTexts(p14) do
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

local function addAgentAdCampaignCardSegments(List, p15, TurnKey)
	-- upvalues: AdCampaignEligibilityToolModule (copy), makeSegmentKey (copy)
	local t = {}
	local List1 = {}
	
	for activitySlot in p15.activitySlots do
		table.insert(List1, activitySlot)
	end
	table.sort(List1)
	
	for _, value in List1 do
		local ActivitySlot = p15.activitySlots[value]
		
		if ActivitySlot.kind == "tool_call" then
			local ToolCall = p15.toolCalls[ActivitySlot.toolCallId]
			
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

local function projectTurnSegments(p16, p17, OptimisticLocalTools)
	-- upvalues: projectWorkSegments (copy), GetLocalToolWaitSecondsFunction (copy), makeTurnWorkSegment (copy), addTerminalAssistantMessageSegments (copy), FFlagBuildAgentAdCampaignCardModule (copy), addAgentAdCampaignCardSegments (copy), LocalizationStringsModule (copy), makeSegmentKey (copy), ASSISTANTSTOPPEDTEXT (copy), PublishToolUtils (copy)
	local TurnKey = nil
	if p17.turnKey == nil then
		local SessionId = p17.sessionId or (if p16 == nil then "pending-session" else p16.sessionId)
		local SequenceId = if p17.turnFeedbackIds == nil or typeof(p17.turnFeedbackIds) == "function" then nil else p17.turnFeedbackIds.sequenceId
		TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
	else
		TurnKey = p17.turnKey
	end
	local List = {}
	local TurnWorkSegment = makeTurnWorkSegment(TurnKey, projectWorkSegments(p16, TurnKey, OptimisticLocalTools, not p16.isDone), p16.eventMetaBySequenceId, p17.startSequenceId, p17.endSequenceId, (GetLocalToolWaitSecondsFunction(p16)))
	
	if TurnWorkSegment ~= nil then
		table.insert(List, TurnWorkSegment)
	end
	addTerminalAssistantMessageSegments(List, p16, TurnKey)
	
	if FFlagBuildAgentAdCampaignCardModule then
		addAgentAdCampaignCardSegments(List, p16, TurnKey)
	end
	if p16.status == "failed" or p16.stopReason == "error" then
		local CHATASSISTANTRESPONSEFAILED = LocalizationStringsModule.CHAT_ASSISTANT_RESPONSE_FAILED
		local ErrorCode = p16.errorCode
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
	elseif p16.status == "cancelled" or p16.stopReason == "cancelled" then
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
	if p16.isDone and PublishToolUtils.includesPublishPlaceTool(p16) and p17.showPlaytestCta == true then
		table.insert(List, {
			kind = "playtest_cta",
			key = makeSegmentKey(TurnKey, "playtest-cta")
		})
	end
	return List
end

return {
	getFinalAssistantMessageText = function(p16)
		-- upvalues: getAssistantMessageTexts (copy)
		local AssistantMessageTexts = getAssistantMessageTexts(p16)
		
		return AssistantMessageTexts[#AssistantMessageTexts]
	end,
	projectActiveTurnSegments = function(p16, p17)
		-- upvalues: projectTurnSegments (copy), config (copy)
		return (projectTurnSegments(p16, p17 or {}, if p17 and p17.optimisticLocalTools then p17.optimisticLocalTools else config))
	end,
	projectLoadingTurnSegments = function(p16)
		-- upvalues: makeActiveActivitySummary (copy), makeSegmentKey (copy), countActionsInSegments (copy), LocalizationStringsModule (copy)
		local TurnKey = nil
		if p16 == nil then
			TurnKey = "loading"
		elseif p16.turnKey == nil then
			local SessionId = p16.sessionId or "pending-session"
			local SequenceId = if p16.turnFeedbackIds == nil or typeof(p16.turnFeedbackIds) == "function" then nil else p16.turnFeedbackIds.sequenceId
			TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
		else
			TurnKey = p16.turnKey
		end
		local ActiveActivitySummary = makeActiveActivitySummary({}, true, makeSegmentKey(TurnKey, "activity-trailing"), nil)
		local Segments = {}
		
		if ActiveActivitySummary ~= nil then
			table.insert(Segments, ActiveActivitySummary)
		end
		local v4 = nil
		if #Segments == 0 then
			v4 = nil
		else
			local CountActionsInSegmentsResult = countActionsInSegments(Segments)
			local CHATTURNACTIVITY = nil
			local WorkedDurationSeconds = nil
			
			if WorkedDurationSeconds == nil and CountActionsInSegmentsResult == 0 then
				CHATTURNACTIVITY = LocalizationStringsModule.CHAT_TURN_ACTIVITY
			end
			v4 = {
				kind = "turn_work",
				key = makeSegmentKey(TurnKey, "work"),
				label = CHATTURNACTIVITY,
				segments = Segments,
				actionCount = CountActionsInSegmentsResult,
				workedDurationSeconds = WorkedDurationSeconds
			}
		end
		return if v4 == nil then {} else { v4 }
	end,
	projectSetupErrorSegments = function(Text, p16)
		-- upvalues: makeSegmentKey (copy)
		local TurnKey = nil
		if p16 == nil then
			TurnKey = "setup-error"
		elseif p16.turnKey == nil then
			local SessionId = p16.sessionId or "pending-session"
			local SequenceId = if p16.turnFeedbackIds == nil or typeof(p16.turnFeedbackIds) == "function" then nil else p16.turnFeedbackIds.sequenceId
			TurnKey = if SequenceId == nil then SessionId else `{SessionId}:{SequenceId}`
		else
			TurnKey = p16.turnKey
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