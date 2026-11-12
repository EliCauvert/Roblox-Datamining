local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local ChatTypesModule = require(script.Parent.chatTypes)
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildExperienceThoughtStatus = CreatorAgentChatModule.FFlagBuildExperienceThoughtStatus
local PublishToolUtils = CreatorAgentChatModule.PublishToolUtils
local TurnStateReducer = CreatorAgentChatModule.TurnStateReducer
local SubagentTasks = CreatorAgentChatModule.SubagentTasks

local function _(p1)
	return if p1 == nil or p1.type ~= "text" or typeof(p1.text) ~= "string" then "" else p1.text
end

local _ = function(p1)
	return if p1 == nil or p1.type ~= "image" or typeof(p1.uri) ~= "string" or p1.uri == "" then nil else { uri = p1.uri }
end

local function contentBlockToResourceAttachment(Content)
	return if Content == nil or Content.type ~= "resource_link" or typeof(Content.name) ~= "string" or Content.name == "" or typeof(Content.uri) ~= "string" or Content.uri == "" then if Content == nil or Content.type ~= "resource" or typeof(Content.resource) ~= "table" or typeof(Content.resource.uri) ~= "string" or Content.resource.uri == "" or typeof(Content.resource.text) ~= "string" then nil else { type = "resource", resource = Content.resource } else {
		type = "resource_link",
		name = Content.name,
		uri = Content.uri,
		mimeType = if typeof(Content.mimeType) == "string" then Content.mimeType else nil
	}
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

local function contentBlocksToImages(Content)
	local List = {}
	
	if typeof(Content) ~= "table" then
		return List
	end
	for _, value in Content do
		local Config = if value == nil or value.type ~= "image" or typeof(value.uri) ~= "string" or value.uri == "" then nil else { uri = value.uri }
		
		if Config ~= nil then
			table.insert(List, Config)
		end
	end
	return List
end

local function contentBlocksToResourceAttachments(Content)
	-- upvalues: contentBlockToResourceAttachment (copy)
	local List = {}
	
	if typeof(Content) ~= "table" then
		return List
	end
	for _, value in Content do
		local ContentBlockToResourceAttachmentResult = contentBlockToResourceAttachment(value)
		
		if ContentBlockToResourceAttachmentResult ~= nil then
			table.insert(List, ContentBlockToResourceAttachmentResult)
		end
	end
	return List
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
	-- upvalues: FFlagBuildExperienceThoughtStatus (copy)
	return p1 == "agent_message" or (p1 == "agent_message_chunk" or (p1 == "tool_call_update" or (p1 == "tool_call_content_chunk" or (p1 == "state_change" or FFlagBuildExperienceThoughtStatus and p1 == "agent_thought_chunk"))))
end

local _ = function(p1): boolean
	return p1.assistantText ~= "" or (#p1.activityItems > 0 or p1.toolCallCount > 0)
end

local _ = function(p1): boolean
	if p1.assistantText ~= "" or p1.toolCallCount > 0 then
		return true
	end
	for _, activityItem in p1.activityItems do
		if activityItem.kind ~= "thought" then
			return true
		end
	end
	return false
end

local function shouldEmitAssistantTurn(ApplySessionUpdateResult, p2): boolean
	-- upvalues: FFlagBuildExperienceThoughtStatus (copy)
	local IsNotAssistantTextMatch = nil
	if FFlagBuildExperienceThoughtStatus then
		if ApplySessionUpdateResult.assistantText == "" and ApplySessionUpdateResult.toolCallCount <= 0 then
			IsNotAssistantTextMatch = false
			
			for _, activityItem in ApplySessionUpdateResult.activityItems do
				if activityItem.kind ~= "thought" then
					IsNotAssistantTextMatch = true
					break
				end
			end
		else
			IsNotAssistantTextMatch = true
		end
	else
		IsNotAssistantTextMatch = ApplySessionUpdateResult.assistantText ~= "" or (#ApplySessionUpdateResult.activityItems > 0 or ApplySessionUpdateResult.toolCallCount > 0)
	end
	if not IsNotAssistantTextMatch then
		IsNotAssistantTextMatch = #ApplySessionUpdateResult.pendingAgentMessageContent > 0 or (FFlagBuildExperienceThoughtStatus and p2 and ApplySessionUpdateResult.latestThought ~= nil and not ApplySessionUpdateResult.isDone or (ApplySessionUpdateResult.status == "cancelled" or (ApplySessionUpdateResult.stopReason == "cancelled" or ApplySessionUpdateResult.stopReason == "error")))
	end
	return IsNotAssistantTextMatch
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

local function parseChatItems(List, p3)
	-- upvalues: shouldEmitAssistantTurn (copy), FFlagBuildExperienceThoughtStatus (copy), contentBlocksToText (copy), contentBlocksToImages (copy), contentBlocksToResourceAttachments (copy), contentBlockToResourceAttachment (copy), TurnStateReducer (copy)
	local List1 = {}
	local ApplySessionUpdateResult = nil
	local StartSequenceId = nil
	local EndSequenceId = nil
	local SequenceIds = {}
	local Flag = false
	
	local function flushActiveTurn(p4)
		-- upvalues: ApplySessionUpdateResult (ref), Flag (ref), shouldEmitAssistantTurn (upval), FFlagBuildExperienceThoughtStatus (upval), List1 (copy), StartSequenceId (ref), EndSequenceId (ref), SequenceIds (ref)
		if ApplySessionUpdateResult ~= nil and Flag and shouldEmitAssistantTurn(ApplySessionUpdateResult, if FFlagBuildExperienceThoughtStatus then p4 else nil) then
			table.insert(List1, {
				kind = "assistant_turn",
				startSequenceId = StartSequenceId,
				endSequenceId = EndSequenceId,
				sequenceIds = SequenceIds,
				turnState = ApplySessionUpdateResult
			})
		end
		ApplySessionUpdateResult = nil
		StartSequenceId = nil
		EndSequenceId = nil
		SequenceIds = {}
		Flag = false
	end
	
	local function appendUserMessage(MessageId, SequenceId, Text, Images, ResourceAttachments)
		-- upvalues: List1 (copy)
		if Text == "" and #Images == 0 and #ResourceAttachments == 0 then return end
		local Entry = List1[#List1]
		
		if Entry == nil or Entry.kind ~= "user_message" or Entry.messageId ~= MessageId then
			table.insert(List1, {
				kind = "user_message",
				messageId = MessageId,
				sequenceId = SequenceId,
				text = Text,
				images = Images,
				resourceAttachments = ResourceAttachments
			})
			
			return
		end
		Entry.text ..= Text
		
		for _, image in Images do
			table.insert(Entry.images, image)
		end
		for _, resourceAttachment in ResourceAttachments do
			table.insert(Entry.resourceAttachments, resourceAttachment)
		end
	end
	
	for _, value in List do
		local SessionUpdate = value.sessionUpdate
		local SequenceId: number = value.sequenceId
		local SequenceId1 = if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil
		
		if SessionUpdate ~= "user_message" and SessionUpdate ~= "user_message_chunk" then
			if SessionUpdate == "agent_message" or (SessionUpdate == "agent_message_chunk" or (SessionUpdate == "tool_call_update" or (SessionUpdate == "tool_call_content_chunk" or (SessionUpdate == "state_change" or FFlagBuildExperienceThoughtStatus and SessionUpdate == "agent_thought_chunk")))) then
				if ApplySessionUpdateResult == nil then
					ApplySessionUpdateResult = TurnStateReducer.createEmptyTurnState(p3)
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
		local ContentBlocksToImagesResult = nil
		if SessionUpdate == "user_message" then
			ContentBlocksToImagesResult = contentBlocksToImages(value.content)
		else
			ContentBlocksToImagesResult = {}
			local Content = value.content
			local Config = if Content == nil or Content.type ~= "image" or typeof(Content.uri) ~= "string" or Content.uri == "" then nil else { uri = Content.uri }
			
			if Config ~= nil then
				table.insert(ContentBlocksToImagesResult, Config)
			end
		end
		local ContentBlocksToResourceAttachmentsResult = nil
		if SessionUpdate == "user_message" then
			ContentBlocksToResourceAttachmentsResult = contentBlocksToResourceAttachments(value.content)
		else
			ContentBlocksToResourceAttachmentsResult = {}
			local ContentBlockToResourceAttachmentResult = contentBlockToResourceAttachment(value.content)
			
			if ContentBlockToResourceAttachmentResult ~= nil then
				table.insert(ContentBlocksToResourceAttachmentsResult, ContentBlockToResourceAttachmentResult)
			end
		end
		local MessageId = value.messageId
		appendUserMessage(if typeof(MessageId) == "string" and MessageId ~= "" then MessageId else nil, SequenceId1, ContentBlocksToTextResult, ContentBlocksToImagesResult, ContentBlocksToResourceAttachmentsResult)
	end
	flushActiveTurn(if FFlagBuildExperienceThoughtStatus then true else nil)
	
	return List1
end

local function buildUserMessageItem(UserMessageItem, SessionId)
	return {
		kind = "user_message",
		id = if SessionId == nil or UserMessageItem.sequenceId == nil then UserMessageItem.messageId else `{SessionId}:{UserMessageItem.sequenceId}:user`,
		text = UserMessageItem.text,
		images = UserMessageItem.images,
		resourceAttachments = if #UserMessageItem.resourceAttachments > 0 then UserMessageItem.resourceAttachments else nil
	}
end

local _ = function(p4, p5)
	return if p5 == nil or p4.eventMetaBySequenceId == nil then nil else p4.eventMetaBySequenceId[p5]
end

local function resolveTurnId(TurnState, p4)
	local EndSequenceId = p4.endSequenceId
	local EventMetaBySequenceIdEntry = if EndSequenceId == nil or TurnState.eventMetaBySequenceId == nil then nil else TurnState.eventMetaBySequenceId[EndSequenceId]
	
	if EventMetaBySequenceIdEntry ~= nil and EventMetaBySequenceIdEntry.turnId ~= nil then
		return EventMetaBySequenceIdEntry.turnId
	end
	local EventMetaBySequenceIdEntry1 = nil
	for _, sequenceId in p4.sequenceIds do
		EventMetaBySequenceIdEntry1 = if sequenceId == nil or TurnState.eventMetaBySequenceId == nil then nil else TurnState.eventMetaBySequenceId[sequenceId]
		
		if EventMetaBySequenceIdEntry1 ~= nil and EventMetaBySequenceIdEntry1.turnId ~= nil then
			return EventMetaBySequenceIdEntry1.turnId
		end
	end
	return nil
end

local function buildTurnFeedbackIds(p5, TurnFeedbackIds)
	-- upvalues: PublishToolUtils (copy), resolveTurnId (copy)
	local LatestSuccessfulResult = PublishToolUtils.getLatestSuccessfulResult(p5.turnState)
	
	return {
		universeId = TurnFeedbackIds.universeId,
		placeId = TurnFeedbackIds.placeId,
		sessionId = TurnFeedbackIds.sessionId,
		sequenceId = p5.endSequenceId,
		turnId = resolveTurnId(p5.turnState, p5),
		publishedVersionNumber = if LatestSuccessfulResult == nil then nil else LatestSuccessfulResult.publishedVersionNumber,
		rollbackTargetVersionNumber = if LatestSuccessfulResult == nil then nil else LatestSuccessfulResult.rollbackTargetVersionNumber
	}
end

return function(Tbl, p5)
	-- upvalues: parseChatItems (copy), buildUserMessageItem (copy), TurnStateReducer (copy), PublishToolUtils (copy), SubagentTasks (copy), FFlagBuildAdUpsellModule (copy), buildTurnFeedbackIds (copy), ChatTypesModule (copy)
	local SessionId = p5.sessionId
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
	local Count1: number? = nil
	
	for _, value1 in ParseChatItemsResult do
		if value1.kind == "user_message" then
			table.insert(List, (buildUserMessageItem(value1, SessionId)))
			continue
		end
		local TurnState = value1.turnState
		local NoIsDone: boolean = p5.optimisticCancelledStartSequenceId ~= nil and (value1.startSequenceId == p5.optimisticCancelledStartSequenceId and not TurnState.isDone)
		
		if NoIsDone then
			TurnState = TurnStateReducer.applySessionUpdate(TurnState, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = "cancelled"
			}, nil)
		end
		local IncludesPublishPlaceToolResult = PublishToolUtils.includesPublishPlaceTool(TurnState)
		
		if IncludesPublishPlaceToolResult then
			IncludesPublishTool = true
		end
		local FromTurnStateResult = SubagentTasks.fromTurnState(TurnState)
		
		if FromTurnStateResult ~= nil then
			SubagentTaskState = FromTurnStateResult
		end
		local Text = if SessionId == nil or value1.startSequenceId == nil then nil else `{SessionId}:{value1.startSequenceId}`
		local NoIsDone1 = not TurnState.isDone
		table.insert(List, {
			kind = "assistant_turn",
			id = Text,
			isDone = TurnState.isDone,
			turnState = TurnState,
			turnKey = Text,
			startSequenceId = value1.startSequenceId,
			endSequenceId = value1.endSequenceId,
			isOptimisticallyCancelled = if FFlagBuildAdUpsellModule and NoIsDone then true else nil,
			optimisticLocalTools = if NoIsDone1 then p5.optimisticLocalTools else nil,
			universeId = p5.universeId,
			sessionId = SessionId,
			turnFeedbackIds = buildTurnFeedbackIds(value1, p5)
		})
		
		if IncludesPublishPlaceToolResult and TurnState.isDone then
			Count1 = #List
		end
		if NoIsDone1 then
			Count = #List
			ActiveTurnState = TurnState
			StartSequenceId = value1.startSequenceId
			SequenceIds = value1.sequenceIds
		end
	end
	if Count1 ~= nil then
		List[Count1].isLatestPublishTurn = true
	end
	local IsAwaitingUserMessageEcho = false
	local PendingUserMessage = p5.pendingUserMessage
	local PendingUserImages = p5.pendingUserImages or {}
	local PendingUserResourceAttachments = p5.pendingUserResourceAttachments or {}
	
	if PendingUserMessage ~= nil and PendingUserMessage ~= "" or (#PendingUserImages > 0 or #PendingUserResourceAttachments > 0) then
		local PendingUserMessageAfterSequenceId = p5.pendingUserMessageAfterSequenceId or -1
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
			IsAwaitingUserMessageEcho = true
			table.insert(List, {
				kind = "user_message",
				id = if SessionId == nil then nil else `{SessionId}{ChatTypesModule.PENDING_USER_MESSAGE_ID_SUFFIX}`,
				text = PendingUserMessage or "",
				images = PendingUserImages,
				resourceAttachments = PendingUserResourceAttachments
			})
		end
	end
	local LiveAssistantMessage = p5.liveAssistantMessage
	local Entry = List[#List]
	local IsAssistantTurn: boolean = Entry ~= nil and Entry.kind == "assistant_turn"
	
	if IsAssistantTurn then
		local StartSequenceId1 = Entry.startSequenceId
		IsAssistantTurn = StartSequenceId1 == nil or (p5.pendingUserMessageAfterSequenceId or -1) < StartSequenceId1
	end
	if LiveAssistantMessage ~= nil and not IsAssistantTurn then
		local LiveName = if SessionId == nil then nil else `{SessionId}:live`
		table.insert(List, {
			kind = "assistant_turn",
			isDone = false,
			id = LiveName,
			turnKey = LiveName,
			loading = LiveAssistantMessage.setupErrorText == nil or nil,
			setupErrorText = LiveAssistantMessage.setupErrorText,
			universeId = p5.universeId,
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
		isAwaitingUserMessageEcho = IsAwaitingUserMessageEcho,
		latestSequenceId = LatestSequenceId
	}
end