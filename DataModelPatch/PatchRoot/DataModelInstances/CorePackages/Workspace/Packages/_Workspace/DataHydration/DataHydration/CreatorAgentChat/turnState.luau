local _ = require(script.Parent.types)

local function _(p1)
	local SequenceNumber = if p1 == nil then nil else p1.sequenceNumber
	
	return if typeof(SequenceNumber) == "number" and SequenceNumber >= 0 then SequenceNumber + 1 else nil
end

local _ = function(p1)
	local MessageId = p1.messageId
	
	return if typeof(MessageId) == "string" and MessageId ~= "" then MessageId else nil
end

local _ = function(List)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, value)
	end
	return List1
end

local function contentBlocksToText(PendingAgentMessageContent): string
	local List = {}
	
	for _, value in PendingAgentMessageContent do
		if value.type == "text" and typeof(value.text) == "string" then
			table.insert(List, value.text)
		end
	end
	return table.concat(List)
end

local function messageMapToText(AssistantMessages, AssistantMessageOrder): string
	-- upvalues: contentBlocksToText (copy)
	local List = {}
	
	for _, value in AssistantMessageOrder do
		local AssistantMessage = AssistantMessages[value]
		
		if AssistantMessage ~= nil then
			table.insert(List, contentBlocksToText(AssistantMessage))
		end
	end
	return table.concat(List)
end

local _ = function(List, p1)
	for _, value in List do
		if value == p1 then
			return List
		end
	end
	local List1 = {}
	
	for _, value1 in List do
		table.insert(List1, value1)
	end
	table.insert(List1, p1)
	
	return List1
end

local _ = function(Tbl, List, Key, List1)
	local Copy = table.clone(Tbl)
	local List2 = {}
	
	for _, value in List1 do
		table.insert(List2, value)
	end
	Copy[Key] = List2
	
	for _, value1 in List do
		if value1 == Key then
			return Copy, List
		end
	end
	local List3 = {}
	
	for _, value2 in List do
		table.insert(List3, value2)
	end
	table.insert(List3, Key)
	
	return Copy, List3
end

local function appendMessageContent(Tbl, List, Key, p2)
	local Copy = table.clone(Tbl)
	local Entry = Copy[Key]
	local List2 = nil
	
	if Entry == nil then
		List2 = {}
	else
		local List1 = {}
		
		for _, value in Entry do
			table.insert(List1, value)
		end
		List2 = List1
	end
	table.insert(List2, p2)
	Copy[Key] = List2
	
	for _, value1 in List do
		if value1 == Key then
			return Copy, List
		end
	end
	local List3 = {}
	
	for _, value2 in List do
		table.insert(List3, value2)
	end
	table.insert(List3, Key)
	
	return Copy, List3
end

local function buildActivityItems(ActivitySlots, ToolCalls)
	local List = {}
	local List1 = {}
	
	for activitySlot in ActivitySlots do
		table.insert(List1, activitySlot)
	end
	table.sort(List1)
	
	for _, value in List1 do
		local ActivitySlot = ActivitySlots[value]
		
		if ActivitySlot.kind == "agent_message" then
			table.insert(List, { kind = "agent_message", text = ActivitySlot.text })
		elseif ActivitySlot.kind == "tool_call" then
			local ToolCall = ToolCalls[ActivitySlot.toolCallId]
			table.insert(List, {
				kind = "tool_call",
				toolCallId = ActivitySlot.toolCallId,
				title = if ToolCall then ToolCall.title else nil,
				status = if ToolCall then ToolCall.status else nil
			})
		end
	end
	return List
end

local _ = function(EmptyTurnState)
	-- upvalues: buildActivityItems (copy)
	EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
end

local _ = function(EmptyTurnState, Key: number, p3)
	-- upvalues: buildActivityItems (copy)
	if Key > 0 then
		local Copy = table.clone(EmptyTurnState.activitySlots)
		Copy[Key] = p3
		EmptyTurnState.activitySlots = Copy
		EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
		
		return
	end
end

local _ = function(EmptyTurnState, p3, p4)
	-- upvalues: buildActivityItems (copy)
	local SequenceNumber = if p3 == nil then nil else p3.sequenceNumber
	local NewSequenceNumber = if typeof(SequenceNumber) == "number" and SequenceNumber >= 0 then SequenceNumber + 1 else nil
	
	if NewSequenceNumber == nil then return end
	if NewSequenceNumber > 0 then
		local Copy = table.clone(EmptyTurnState.activitySlots)
		Copy[NewSequenceNumber] = p4
		EmptyTurnState.activitySlots = Copy
		EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
		
		return
	end
end

local _ = function(EmptyTurnState, p3, ToolCallId)
	-- upvalues: buildActivityItems (copy)
	local config = { kind = "tool_call", toolCallId = ToolCallId }
	local SequenceNumber = if p3 == nil then nil else p3.sequenceNumber
	local NewSequenceNumber = if typeof(SequenceNumber) == "number" and SequenceNumber >= 0 then SequenceNumber + 1 else nil
	
	if NewSequenceNumber == nil then return end
	if NewSequenceNumber > 0 then
		local Copy = table.clone(EmptyTurnState.activitySlots)
		Copy[NewSequenceNumber] = config
		EmptyTurnState.activitySlots = Copy
		EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
		
		return
	end
end

local _ = function(p3, ToolCallId): boolean
	for _, activitySlot in p3.activitySlots do
		if activitySlot.kind == "tool_call" and activitySlot.toolCallId == ToolCallId then
			return true
		end
	end
	return false
end

local _ = function(EmptyTurnState)
	EmptyTurnState.pendingAgentMessageId = nil
	EmptyTurnState.pendingAgentMessageContent = {}
	EmptyTurnState.pendingAgentMessageSequenceIndex = nil
end

local function appendPendingAgentMessage(EmptyTurnState, PendingAgentMessageId, Content, p4)
	-- upvalues: contentBlocksToText (copy), buildActivityItems (copy)
	if EmptyTurnState.pendingAgentMessageId ~= nil and EmptyTurnState.pendingAgentMessageId ~= PendingAgentMessageId then
		local ContentBlocksToTextResult = contentBlocksToText(EmptyTurnState.pendingAgentMessageContent)
		
		if ContentBlocksToTextResult ~= "" then
			local PendingAgentMessageSequenceIndex: number = EmptyTurnState.pendingAgentMessageSequenceIndex
			
			if PendingAgentMessageSequenceIndex ~= nil then
				local config = { kind = "agent_message", text = ContentBlocksToTextResult }
				
				if PendingAgentMessageSequenceIndex > 0 then
					local Copy = table.clone(EmptyTurnState.activitySlots)
					Copy[PendingAgentMessageSequenceIndex] = config
					EmptyTurnState.activitySlots = Copy
					EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
				end
			end
		end
		EmptyTurnState.pendingAgentMessageId = nil
		EmptyTurnState.pendingAgentMessageContent = {}
		EmptyTurnState.pendingAgentMessageSequenceIndex = nil
	end
	local List = {}
	
	for _, value in EmptyTurnState.pendingAgentMessageContent do
		table.insert(List, value)
	end
	table.insert(List, Content)
	EmptyTurnState.pendingAgentMessageId = PendingAgentMessageId
	EmptyTurnState.pendingAgentMessageContent = List
	
	if EmptyTurnState.pendingAgentMessageSequenceIndex == nil then
		local SequenceNumber = if p4 == nil then nil else p4.sequenceNumber
		EmptyTurnState.pendingAgentMessageSequenceIndex = if typeof(SequenceNumber) == "number" and SequenceNumber >= 0 then SequenceNumber + 1 else nil
	end
end

local function flushPendingAgentMessageToActivity(EmptyTurnState)
	-- upvalues: contentBlocksToText (copy), buildActivityItems (copy)
	local ContentBlocksToTextResult = contentBlocksToText(EmptyTurnState.pendingAgentMessageContent)
	
	if ContentBlocksToTextResult ~= "" then
		local PendingAgentMessageSequenceIndex: number = EmptyTurnState.pendingAgentMessageSequenceIndex
		
		if PendingAgentMessageSequenceIndex ~= nil then
			local config = { kind = "agent_message", text = ContentBlocksToTextResult }
			
			if PendingAgentMessageSequenceIndex > 0 then
				local Copy = table.clone(EmptyTurnState.activitySlots)
				Copy[PendingAgentMessageSequenceIndex] = config
				EmptyTurnState.activitySlots = Copy
				EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
			end
		end
	end
	EmptyTurnState.pendingAgentMessageId = nil
	EmptyTurnState.pendingAgentMessageContent = {}
	EmptyTurnState.pendingAgentMessageSequenceIndex = nil
end

local function flushPendingAgentMessageToAssistant(EmptyTurnState)
	-- upvalues: appendMessageContent (copy), messageMapToText (copy)
	local PendingAgentMessageId = EmptyTurnState.pendingAgentMessageId
	
	if PendingAgentMessageId == nil then
		EmptyTurnState.pendingAgentMessageId = nil
		EmptyTurnState.pendingAgentMessageContent = {}
		EmptyTurnState.pendingAgentMessageSequenceIndex = nil
		
		return
	end
	local AssistantMessages = EmptyTurnState.assistantMessages
	local AssistantMessageOrder = EmptyTurnState.assistantMessageOrder
	
	for _, value in EmptyTurnState.pendingAgentMessageContent do
		AssistantMessages, AssistantMessageOrder = appendMessageContent(AssistantMessages, AssistantMessageOrder, PendingAgentMessageId, value)
	end
	EmptyTurnState.assistantMessages = AssistantMessages
	EmptyTurnState.assistantMessageOrder = AssistantMessageOrder
	EmptyTurnState.assistantText = messageMapToText(AssistantMessages, AssistantMessageOrder)
	EmptyTurnState.pendingAgentMessageId = nil
	EmptyTurnState.pendingAgentMessageContent = {}
	EmptyTurnState.pendingAgentMessageSequenceIndex = nil
end

local _ = function(p5)
	local Roblox = p5._meta and p5._meta._roblox
	
	return if typeof(Roblox) == "table" then Roblox else nil
end

local function recordEventMeta(p5, SequenceNumber: number, p6)
	if typeof(SequenceNumber) ~= "number" or SequenceNumber < 0 then return end
	local Roblox = p6._meta and p6._meta._roblox
	local Roblox1 = if typeof(Roblox) == "table" then Roblox else nil
	
	if Roblox1 == nil then return end
	local TurnId: number = Roblox1.turnId
	local EmittedTime = Roblox1.emittedTime
	local ReferenceId = Roblox1.referenceId
	local IsTurnIdAbove: boolean = typeof(TurnId) == "number" and TurnId > 0
	local IsNotEmittedTimeMatch: boolean = typeof(EmittedTime) == "string" and EmittedTime ~= ""
	local IsNotReferenceIdMatch: boolean = typeof(ReferenceId) == "string" and ReferenceId ~= ""
	
	if not IsTurnIdAbove and not IsNotEmittedTimeMatch and not IsNotReferenceIdMatch then return end
	local T = if p5.eventMetaBySequenceId == nil then {} else table.clone(p5.eventMetaBySequenceId)
	local T1 = if T[SequenceNumber] == nil then {} else table.clone(T[SequenceNumber])
	
	if IsTurnIdAbove then
		T1.turnId = TurnId
	end
	if IsNotEmittedTimeMatch then
		T1.emittedTime = EmittedTime
	end
	if IsNotReferenceIdMatch then
		T1.referenceId = ReferenceId
	end
	T[SequenceNumber] = T1
	p5.eventMetaBySequenceId = T
end

local _ = function(p5)
	local Roblox = p5._meta and p5._meta._roblox
	local Roblox1 = if typeof(Roblox) == "table" then Roblox else nil
	local TurnId = if typeof(Roblox1) == "table" then Roblox1.turnId else nil
	
	return if typeof(TurnId) == "number" and TurnId > 0 then TurnId else nil
end

local _ = function(p5)
	local Roblox = p5._meta and p5._meta._roblox
	local Roblox1 = if typeof(Roblox) == "table" then Roblox else nil
	local ReferenceId = if typeof(Roblox1) == "table" then Roblox1.referenceId else nil
	
	return if typeof(ReferenceId) == "string" and ReferenceId ~= "" then ReferenceId else nil
end

local function applyToolCallUpdate(EmptyTurnState, p5, p6)
	-- upvalues: buildActivityItems (copy)
	local ToolCallId = p5.toolCallId
	
	if typeof(ToolCallId) ~= "string" or ToolCallId == "" then return end
	local ToolCall = EmptyTurnState.toolCalls[ToolCallId]
	local NoToolCall = ToolCall == nil
	local Config = if ToolCall == nil then { toolCallId = ToolCallId } else table.clone(ToolCall)
	
	if p5.title ~= nil then
		Config.title = p5.title
	end
	if p5.kind ~= nil then
		Config.kind = p5.kind
	end
	if p5.status ~= nil then
		Config.status = p5.status
	end
	if p5.rawInput ~= nil then
		Config.rawInput = p5.rawInput
	end
	if p5.rawOutput ~= nil then
		Config.rawOutput = p5.rawOutput
	end
	if p5.content ~= nil then
		Config.content = p5.content
	end
	local Roblox = p5._meta and p5._meta._roblox
	local Roblox1 = if typeof(Roblox) == "table" then Roblox else nil
	local TurnId = if typeof(Roblox1) == "table" then Roblox1.turnId else nil
	local TurnId1 = if typeof(TurnId) == "number" and TurnId > 0 then TurnId else nil
	
	if TurnId1 ~= nil then
		Config.turnId = TurnId1
	end
	local Roblox2 = p5._meta and p5._meta._roblox
	local Roblox21 = if typeof(Roblox2) == "table" then Roblox2 else nil
	local ReferenceId = if typeof(Roblox21) == "table" then Roblox21.referenceId else nil
	local ReferenceId1 = if typeof(ReferenceId) == "string" and ReferenceId ~= "" then ReferenceId else nil
	
	if ReferenceId1 ~= nil then
		Config.referenceId = ReferenceId1
	end
	local Copy = table.clone(EmptyTurnState.toolCalls)
	Copy[ToolCallId] = Config
	EmptyTurnState.toolCalls = Copy
	
	if NoToolCall then
		EmptyTurnState.toolCallCount += 1
	end
	if not NoToolCall then
		local Flag = false
		
		for _, activitySlot in EmptyTurnState.activitySlots do
			if activitySlot.kind == "tool_call" and activitySlot.toolCallId == ToolCallId then
				Flag = true
				break
			end
		end
		if Flag then
			EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
			
			return
		end
	end
	local config = { kind = "tool_call", toolCallId = ToolCallId }
	local SequenceNumber = if p6 == nil then nil else p6.sequenceNumber
	local NewSequenceNumber = if typeof(SequenceNumber) == "number" and SequenceNumber >= 0 then SequenceNumber + 1 else nil
	
	if NewSequenceNumber == nil then return end
	if NewSequenceNumber > 0 then
		local Copy1 = table.clone(EmptyTurnState.activitySlots)
		Copy1[NewSequenceNumber] = config
		EmptyTurnState.activitySlots = Copy1
		EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
		
		return
	end
end

local function applyToolCallContentChunk(EmptyTurnState, p7, p8)
	-- upvalues: buildActivityItems (copy)
	local ToolCallId = p7.toolCallId
	local Content = p7.content
	
	if typeof(ToolCallId) ~= "string" or ToolCallId == "" or typeof(Content) ~= "table" then return end
	local ToolCall = EmptyTurnState.toolCalls[ToolCallId]
	local NoToolCall = ToolCall == nil
	local Config = if ToolCall == nil then { toolCallId = ToolCallId } else table.clone(ToolCall)
	local Content1 = Config.content
	local Content2 = nil
	
	if Content1 == nil then
		Content2 = {}
	else
		local List = {}
		
		for _, value in Content1 do
			table.insert(List, value)
		end
		Content2 = List
	end
	table.insert(Content2, Content)
	Config.content = Content2
	local Copy = table.clone(EmptyTurnState.toolCalls)
	Copy[ToolCallId] = Config
	EmptyTurnState.toolCalls = Copy
	
	if NoToolCall then
		EmptyTurnState.toolCallCount += 1
	end
	if not NoToolCall then
		local Flag = false
		
		for _, activitySlot in EmptyTurnState.activitySlots do
			if activitySlot.kind == "tool_call" and activitySlot.toolCallId == ToolCallId then
				Flag = true
				break
			end
		end
		if Flag then
			EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
			
			return
		end
	end
	local config = { kind = "tool_call", toolCallId = ToolCallId }
	local SequenceNumber = if p8 == nil then nil else p8.sequenceNumber
	local NewSequenceNumber = if typeof(SequenceNumber) == "number" and SequenceNumber >= 0 then SequenceNumber + 1 else nil
	
	if NewSequenceNumber == nil then return end
	if NewSequenceNumber > 0 then
		local Copy1 = table.clone(EmptyTurnState.activitySlots)
		Copy1[NewSequenceNumber] = config
		EmptyTurnState.activitySlots = Copy1
		EmptyTurnState.activityItems = buildActivityItems(EmptyTurnState.activitySlots, EmptyTurnState.toolCalls)
		
		return
	end
end

return {
	applySessionUpdate = function(Tbl, p9, p10)
		-- upvalues: recordEventMeta (copy), flushPendingAgentMessageToAssistant (copy), flushPendingAgentMessageToActivity (copy), messageMapToText (copy), appendPendingAgentMessage (copy), applyToolCallUpdate (copy), applyToolCallContentChunk (copy)
		local SessionUpdate = p9.sessionUpdate
		local Copy = table.clone(Tbl)
		recordEventMeta(Copy, if p10 == nil then nil else p10.sequenceNumber, p9)
		
		if Copy.status == "queued" then
			Copy.status = "streaming"
		end
		if SessionUpdate ~= "agent_message_chunk" then
			if SessionUpdate == "state_change" and p9.state == "idle" then
				flushPendingAgentMessageToAssistant(Copy)
			else
				flushPendingAgentMessageToActivity(Copy)
			end
		end
		if SessionUpdate == "agent_message" then
			local MessageId = p9.messageId
			local MessageId1 = if typeof(MessageId) == "string" and MessageId ~= "" then MessageId else nil
			local Content = p9.content
			
			if MessageId1 ~= nil and typeof(Content) == "table" then
				local AssistantMessageOrder = Copy.assistantMessageOrder
				local Copy1 = table.clone(Copy.assistantMessages)
				local List = {}
				
				for _, value in Content do
					table.insert(List, value)
				end
				Copy1[MessageId1] = List
				local AssistantMessageOrder1 = nil
				
				for _, value1 in AssistantMessageOrder do
					if value1 == MessageId1 then
						AssistantMessageOrder1 = AssistantMessageOrder
						Copy.assistantMessages = Copy1
						Copy.assistantMessageOrder = AssistantMessageOrder1
						Copy.assistantText = messageMapToText(Copy.assistantMessages, Copy.assistantMessageOrder)
						
						return Copy
					end
				end
				local List1 = {}
				
				for _, value2 in AssistantMessageOrder do
					table.insert(List1, value2)
				end
				table.insert(List1, MessageId1)
				AssistantMessageOrder1 = List1
			end
		elseif SessionUpdate == "agent_message_chunk" then
			local MessageId = p9.messageId
			local MessageId2 = if typeof(MessageId) == "string" and MessageId ~= "" then MessageId else nil
			local Content = p9.content
			
			if MessageId2 ~= nil and typeof(Content) == "table" then
				appendPendingAgentMessage(Copy, MessageId2, Content, p10)
				
				return Copy
			end
		else
			if SessionUpdate == "tool_call_update" then
				applyToolCallUpdate(Copy, p9, p10)
				
				return Copy
			end
			if SessionUpdate == "tool_call_content_chunk" then
				applyToolCallContentChunk(Copy, p9, p10)
				
				return Copy
			end
			if SessionUpdate == "state_change" then
				if p9.state == "running" or p9.state == "requires_action" then
					Copy.status = "streaming"
					
					return Copy
				end
				if p9.state == "idle" then
					local StopReason = p9.stop_reason
					
					if typeof(StopReason) == "string" then
						Copy.stopReason = StopReason
					else
						Copy.stopReason = "end_turn"
					end
					Copy.status = if Copy.stopReason == "cancelled" then "cancelled" else "succeeded"
					Copy.isDone = true
					
					return Copy
				end
			elseif SessionUpdate == "session_info_update" then
				Copy.infoUpdate = { title = p9.title }
			end
		end
		return Copy
	end,
	createEmptyTurnState = function(SessionId, RequestId)
		return {
			status = "queued",
			assistantText = "",
			pendingAgentMessageId = nil,
			pendingAgentMessageSequenceIndex = nil,
			toolCallCount = 0,
			infoUpdate = nil,
			stopReason = nil,
			error = nil,
			errorCode = nil,
			isDone = false,
			sessionId = SessionId,
			requestId = RequestId,
			assistantMessages = {},
			assistantMessageOrder = {},
			pendingAgentMessageContent = {},
			activitySlots = {},
			activityItems = {},
			toolCalls = {},
			eventMetaBySequenceId = {}
		}
	end
}