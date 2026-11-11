local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local PublishToolUtils = CreatorAgentChatModule.PublishToolUtils
local TurnStateReducer = CreatorAgentChatModule.TurnStateReducer
local SubagentTasks = CreatorAgentChatModule.SubagentTasks

local function _(p1)
	return if p1 == nil or p1.type ~= "text" or typeof(p1.text) ~= "string" then "" else p1.text
end

local function contentBlocksToText(Content): string
	if typeof(Content) ~= "table" then
		return ""
	end
	local List = {}
	
	for _, value in Content do
		local Text = if value == nil or value.type ~= "text" or typeof(value.text) ~= "string" then "" else value.text
		
		if Text ~= "" then
			table.insert(List, Text)
		end
	end
	return table.concat(List)
end

local _ = function(p1)
	local SequenceId: number = p1.sequenceId
	
	return if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil
end

local _ = function(p1)
	-- upvalues: TurnStateReducer (copy)
	return TurnStateReducer.applySessionUpdate(p1, {
		sessionUpdate = "state_change",
		state = "idle",
		stop_reason = "cancelled"
	}, nil)
end

local _ = function(p1)
	local MessageId = p1.messageId
	
	return if typeof(MessageId) == "string" and MessageId ~= "" then MessageId else nil
end

local _ = function(p1): boolean
	return p1 == "agent_message" or (p1 == "agent_message_chunk" or (p1 == "tool_call_update" or (p1 == "tool_call_content_chunk" or p1 == "state_change")))
end

local _ = function(p1): boolean
	return p1.assistantText ~= "" or (#p1.activityItems > 0 or p1.toolCallCount > 0)
end

local _ = function(p1): boolean
	return p1.assistantText ~= "" or (#p1.activityItems > 0 or p1.toolCallCount > 0) or (#p1.pendingAgentMessageContent > 0 or (p1.status == "cancelled" or p1.stopReason == "cancelled"))
end

local _ = function(Tbl)
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean
		local SequenceId: number = A.sequenceId
		local SequenceId1: number = B.sequenceId
		
		return ((if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil) or -1) < ((if typeof(SequenceId1) == "number" and SequenceId1 >= 0 then SequenceId1 else nil) or -1)
	end)
	
	return Copy
end

local function parseChatItems(List, p1)
	-- upvalues: contentBlocksToText (copy), TurnStateReducer (copy)
	local List1 = {}
	local ApplySessionUpdateResult = nil
	local StartSequenceId = nil
	local EndSequenceId = nil
	local SequenceIds = {}
	local Flag = false
	
	local function flushActiveTurn()
		-- upvalues: ApplySessionUpdateResult (ref), Flag (ref), List1 (copy), StartSequenceId (ref), EndSequenceId (ref), SequenceIds (ref)
		if ApplySessionUpdateResult ~= nil and Flag then
			local ApplySessionUpdateResult1 = ApplySessionUpdateResult
			
			if ApplySessionUpdateResult1.assistantText ~= "" or (#ApplySessionUpdateResult1.activityItems > 0 or ApplySessionUpdateResult1.toolCallCount > 0) or (#ApplySessionUpdateResult1.pendingAgentMessageContent > 0 or (ApplySessionUpdateResult1.status == "cancelled" or ApplySessionUpdateResult1.stopReason == "cancelled")) then
				table.insert(List1, {
					kind = "assistant_turn",
					startSequenceId = StartSequenceId,
					endSequenceId = EndSequenceId,
					sequenceIds = SequenceIds,
					turnState = ApplySessionUpdateResult
				})
			end
		end
		ApplySessionUpdateResult = nil
		StartSequenceId = nil
		EndSequenceId = nil
		SequenceIds = {}
		Flag = false
	end
	
	local function appendUserMessage(MessageId, SequenceId, Text)
		-- upvalues: List1 (copy)
		if Text == "" then return end
		local Entry = List1[#List1]
		
		if Entry == nil or Entry.kind ~= "user_message" or Entry.messageId ~= MessageId then
			table.insert(List1, {
				kind = "user_message",
				messageId = MessageId,
				sequenceId = SequenceId,
				text = Text
			})
			
			return
		else
			Entry.text ..= Text
		end
	end
	
	for _, value in List do
		local SessionUpdate = value.sessionUpdate
		local SequenceId: number = value.sequenceId
		local SequenceId1 = if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil
		
		if SessionUpdate ~= "user_message" and SessionUpdate ~= "user_message_chunk" then
			if SessionUpdate == "agent_message" or (SessionUpdate == "agent_message_chunk" or (SessionUpdate == "tool_call_update" or (SessionUpdate == "tool_call_content_chunk" or SessionUpdate == "state_change"))) then
				if ApplySessionUpdateResult == nil then
					ApplySessionUpdateResult = TurnStateReducer.createEmptyTurnState(p1)
				end
				if SessionUpdate == "state_change" and value.state == "running" then
					Flag = true
				end
				if SequenceId1 ~= nil then
					table.insert(SequenceIds, SequenceId1)
					
					if StartSequenceId == nil or SequenceId1 < StartSequenceId then
						StartSequenceId = SequenceId1
					end
					if EndSequenceId == nil or EndSequenceId < SequenceId1 then
						EndSequenceId = SequenceId1
					end
				end
				ApplySessionUpdateResult = TurnStateReducer.applySessionUpdate(ApplySessionUpdateResult, value, { sequenceNumber = SequenceId1 })
				
				if ApplySessionUpdateResult.isDone then
					flushActiveTurn()
				end
				continue
			end
			continue
		end
		if ApplySessionUpdateResult ~= nil then
			local ApplySessionUpdateResult1 = ApplySessionUpdateResult
			
			if ApplySessionUpdateResult1.assistantText ~= "" or (#ApplySessionUpdateResult1.activityItems > 0 or ApplySessionUpdateResult1.toolCallCount > 0) then
				flushActiveTurn()
			end
		end
		local ContentBlocksToTextResult = nil
		if SessionUpdate == "user_message" then
			ContentBlocksToTextResult = contentBlocksToText(value.content)
		else
			local Content = value.content
			ContentBlocksToTextResult = if Content == nil or Content.type ~= "text" or typeof(Content.text) ~= "string" then "" else Content.text
		end
		local MessageId = value.messageId
		appendUserMessage(if typeof(MessageId) == "string" and MessageId ~= "" then MessageId else nil, SequenceId1, ContentBlocksToTextResult)
	end
	flushActiveTurn()
	
	return List1
end

local _ = function(p2, p3)
	return {
		kind = "user_message",
		id = if p3 == nil or p2.sequenceId == nil then p2.messageId else `{p3}:{p2.sequenceId}:user`,
		text = p2.text
	}
end

local _ = function(p2, p3)
	return if p3 == nil or p2.eventMetaBySequenceId == nil then nil else p2.eventMetaBySequenceId[p3]
end

local function resolveTurnId(TurnState, p2)
	local EndSequenceId = p2.endSequenceId
	local EventMetaBySequenceIdEntry = if EndSequenceId == nil or TurnState.eventMetaBySequenceId == nil then nil else TurnState.eventMetaBySequenceId[EndSequenceId]
	
	if EventMetaBySequenceIdEntry ~= nil and EventMetaBySequenceIdEntry.turnId ~= nil then
		return EventMetaBySequenceIdEntry.turnId
	end
	local EventMetaBySequenceIdEntry1 = nil
	for _, sequenceId in p2.sequenceIds do
		EventMetaBySequenceIdEntry1 = if sequenceId == nil or TurnState.eventMetaBySequenceId == nil then nil else TurnState.eventMetaBySequenceId[sequenceId]
		
		if EventMetaBySequenceIdEntry1 ~= nil and EventMetaBySequenceIdEntry1.turnId ~= nil then
			return EventMetaBySequenceIdEntry1.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p3, TurnFeedbackIds)
	-- upvalues: PublishToolUtils (copy), resolveTurnId (copy)
	local LatestSuccessfulResult = PublishToolUtils.getLatestSuccessfulResult(p3.turnState)
	
	return {
		universeId = TurnFeedbackIds.universeId,
		placeId = TurnFeedbackIds.placeId,
		sessionId = TurnFeedbackIds.sessionId,
		sequenceId = p3.endSequenceId,
		turnId = resolveTurnId(p3.turnState, p3),
		publishedVersionNumber = if LatestSuccessfulResult == nil then nil else LatestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if LatestSuccessfulResult == nil then nil else LatestSuccessfulResult.rollbackTargetVersionNumber
	}
end

return function(Tbl, p3)
	-- upvalues: parseChatItems (copy), TurnStateReducer (copy), PublishToolUtils (copy), SubagentTasks (copy), buildTurnFeedbackIds (copy)
	local SessionId = p3.sessionId
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean
		local SequenceId: number = A.sequenceId
		local SequenceId1: number = B.sequenceId
		
		return ((if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil) or -1) < ((if typeof(SequenceId1) == "number" and SequenceId1 >= 0 then SequenceId1 else nil) or -1)
	end)
	local ParseChatItemsResult = parseChatItems(Copy, SessionId or "")
	local LatestSequenceId = nil
	
	for _, value in Tbl do
		local SequenceId: number = value.sequenceId
		local SequenceId1 = if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil
		
		if SequenceId1 ~= nil and (LatestSequenceId == nil or LatestSequenceId < SequenceId1) then
			LatestSequenceId = SequenceId1
		end
	end
	local List = {}
	local IncludesPublishTool = false
	local SubagentTaskState = nil
	local Count: number? = nil
	local ActiveTurnState = nil
	local StartSequenceId = nil
	local SequenceIds = nil
	
	for _, value1 in ParseChatItemsResult do
		if value1.kind == "user_message" then
			table.insert(List, {
				kind = "user_message",
				id = if SessionId == nil or value1.sequenceId == nil then value1.messageId else `{SessionId}:{value1.sequenceId}:user`,
				text = value1.text
			})
			continue
		end
		local TurnState = value1.turnState
		
		if p3.optimisticCancelledStartSequenceId ~= nil and value1.startSequenceId == p3.optimisticCancelledStartSequenceId and not TurnState.isDone then
			TurnState = TurnStateReducer.applySessionUpdate(TurnState, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = "cancelled"
			}, nil)
		end
		if PublishToolUtils.includesPublishPlaceTool(TurnState) then
			IncludesPublishTool = true
		end
		local FromTurnStateResult = SubagentTasks.fromTurnState(TurnState)
		
		if FromTurnStateResult ~= nil then
			SubagentTaskState = FromTurnStateResult
		end
		local Text = if SessionId == nil or value1.startSequenceId == nil then nil else `{SessionId}:{value1.startSequenceId}`
		local NoIsDone = not TurnState.isDone
		table.insert(List, {
			kind = "assistant_turn",
			id = Text,
			isDone = TurnState.isDone,
			turnState = TurnState,
			turnKey = Text,
			startSequenceId = value1.startSequenceId,
			endSequenceId = value1.endSequenceId,
			optimisticLocalTools = if NoIsDone then p3.optimisticLocalTools else nil,
			universeId = p3.universeId,
			sessionId = SessionId,
			turnFeedbackIds = buildTurnFeedbackIds(value1, p3)
		})
		
		if NoIsDone then
			Count = #List
			ActiveTurnState = TurnState
			StartSequenceId = value1.startSequenceId
			SequenceIds = value1.sequenceIds
		end
	end
	local PendingUserMessage = p3.pendingUserMessage
	
	if PendingUserMessage ~= nil and PendingUserMessage ~= "" then
		local PendingUserMessageAfterSequenceId = p3.pendingUserMessageAfterSequenceId or -1
		local Flag = false
		
		for _, value2 in ParseChatItemsResult do
			if value2.kind == "user_message" then
				local SequenceId = value2.sequenceId
				
				if SequenceId ~= nil and PendingUserMessageAfterSequenceId < SequenceId then
					Flag = true
					break
				end
			end
		end
		if not Flag then
			table.insert(List, {
				kind = "user_message",
				id = if SessionId == nil then nil else `{SessionId}:pending`,
				text = PendingUserMessage
			})
		end
	end
	local LiveAssistantMessage = p3.liveAssistantMessage
	local Entry = List[#List]
	local IsAssistantTurn: boolean = Entry ~= nil and Entry.kind == "assistant_turn"
	
	if LiveAssistantMessage ~= nil and not IsAssistantTurn then
		local LiveName = if SessionId == nil then nil else `{SessionId}:live`
		table.insert(List, {
			kind = "assistant_turn",
			isDone = false,
			id = LiveName,
			turnKey = LiveName,
			loading = LiveAssistantMessage.setupErrorText == nil or nil,
			setupErrorText = LiveAssistantMessage.setupErrorText,
			universeId = p3.universeId,
			turnFeedbackIds = {}
		})
	end
	return {
		messages = List,
		includesPublishTool = IncludesPublishTool,
		activeTurnItemIndex = Count,
		activeTurnState = ActiveTurnState,
		activeTurnStartSequenceId = StartSequenceId,
		activeTurnSequenceIds = SequenceIds,
		subagentTaskState = SubagentTaskState,
		latestSequenceId = LatestSequenceId
	}
end