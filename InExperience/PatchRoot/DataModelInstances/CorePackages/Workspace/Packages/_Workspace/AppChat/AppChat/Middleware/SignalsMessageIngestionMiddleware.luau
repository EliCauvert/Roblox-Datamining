local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local BuildConversationMessageFromApiModule = require(AppChat.Stores.Ingestion.buildConversationMessageFromApi)
local IngestBatchModule = require(AppChat.Stores.Ingestion.ingestBatch)
local IngestOperationModule = require(AppChat.Stores.Ingestion.IngestOperation)
local ConversationsModule = require(AppChat.Conversations)
local _ = require(AppChat.MessageData.Types)
local EnumsModule = require(AppChat.MessageData.Enums)
local MessageStatus = EnumsModule.MessageStatus
local MessageType = EnumsModule.MessageType
local MessageVisibility = EnumsModule.MessageVisibility
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local FFlagAppChatIncrementalPaginationProjectionModule = require(AppChat.Flags.FFlagAppChatIncrementalPaginationProjection)
local FFlagAppChatSignalsMessageStoreModule = require(AppChat.Flags.FFlagAppChatSignalsMessageStore)

local function _(p1, p2, p3, Hidden)
	-- upvalues: MessageStatus (copy), MessageVisibility (copy)
	return if p1 then MessageStatus.Pending elseif p2 then MessageStatus.Failed elseif p3 then MessageStatus.Moderated elseif Hidden == MessageVisibility.Hidden then MessageStatus.Hidden else MessageStatus.Default
end

local function extractLegacyTimestamp(Sent)
	if Sent == nil or typeof(Sent) ~= "table" then
		return nil
	end
	if Sent.ToIsoDate then
		return Sent:ToIsoDate()
	end
	local UnixTimestamp = nil
	
	if Sent.GetUnixTimestamp then
		UnixTimestamp = Sent:GetUnixTimestamp()
	elseif Sent.UnixTimestamp then
		UnixTimestamp = Sent.UnixTimestamp
	end
	if UnixTimestamp and UnixTimestamp > 0 then
		local Success, Result = pcall(DateTime.fromUnixTimestamp, UnixTimestamp)
		
		if Success and Result then
			return Result:ToIsoDate()
		end
	end
	return nil
end

local function buildFromLegacy(Message, ConversationId)
	-- upvalues: extractLegacyTimestamp (copy), MessageType (copy), GetFFlagEnableSocialCardsFunction (copy), MessageStatus (copy), MessageVisibility (copy)
	local Failed = Message.failed
	local Moderated = Message.moderated
	local Visibility = Message.visibility
	
	return {
		id = Message.id or Message.messageId,
		type = if Message.messageType == "System" then MessageType.System else MessageType.User,
		content = Message.content,
		created_at = extractLegacyTimestamp(Message.sent),
		sender_user_id = if Message.senderTargetId then tonumber(Message.senderTargetId) else nil,
		moderation_type = Message.moderationType,
		visibility = Message.visibility,
		preview_content = Message.previewContent,
		content_to_display = Message.contentToDisplay or Message.content,
		replies_to = if Message.repliesTo and Message.repliesTo.id then {
			id = Message.repliesTo.id,
			content = Message.repliesTo.content,
			sender_user_id = if Message.repliesTo.senderTargetId then tonumber(Message.repliesTo.senderTargetId) else nil,
			created_at = extractLegacyTimestamp(Message.repliesTo.sent),
			type = if Message.repliesTo.messageType == "System" then MessageType.System else MessageType.User
		} else nil,
		cards = if GetFFlagEnableSocialCardsFunction() then Message.cards else nil,
		filtered_for_receivers = Message.filteredForReceivers,
		is_previewable = Message.isPreviewable,
		conversationId = ConversationId,
		status = if Message.isSending then MessageStatus.Pending elseif Failed then MessageStatus.Failed elseif Moderated then MessageStatus.Moderated elseif Visibility == MessageVisibility.Hidden then MessageStatus.Hidden else MessageStatus.Default,
		stableKey = Message.stableKey or (Message.stable_key or (Message.id or Message.messageId))
	}
end

local function clearConversationStores(p1, ConversationId)
	for _, value in p1.conversationMessageListStore.getOrderedIds(ConversationId) do
		p1.conversationMessageStore.removeMessage(value)
	end
	p1.conversationMessageViewModelStore.evictConversation(ConversationId)
	p1.conversationMessageListStore.clearConversation(ConversationId)
end

local function ingestConversationsFromResponse(ResponseBody, _)
	-- upvalues: CryoModule (copy), BuildConversationMessageFromApiModule (copy), IngestBatchModule (copy), IngestOperationModule (copy)
	if not ResponseBody or not ResponseBody.conversations then return end
	for _, conversation in ResponseBody.conversations do
		local Id = conversation.id
		
		if Id and conversation.messages then
			IngestBatchModule(Id, CryoModule.List.filterMap(conversation.messages, function(p2)
				-- upvalues: BuildConversationMessageFromApiModule (upval), Id (copy)
				return if p2 and p2.id then BuildConversationMessageFromApiModule(p2, Id) else nil
			end), IngestOperationModule.Prepend)
		end
	end
end

local config = {
	[ConversationsModule.Actions.ReceivedMessages.name] = function(p2, _)
		-- upvalues: CryoModule (copy), buildFromLegacy (copy), IngestBatchModule (copy), IngestOperationModule (copy)
		local ConversationId = p2.conversationId
		local Messages = p2.messages
		
		if Messages and ConversationId then
			IngestBatchModule(ConversationId, CryoModule.List.filterMap(Messages, function(p3)
				-- upvalues: buildFromLegacy (upval), ConversationId (copy)
				return if p3 and p3.id then buildFromLegacy(p3, ConversationId) else nil
			end), IngestOperationModule.Prepend)
		end
	end,
	[ConversationsModule.Actions.SendingMessage.name] = function(p2, _)
		-- upvalues: buildFromLegacy (copy), MessageStatus (copy), IngestBatchModule (copy), IngestOperationModule (copy)
		local ConversationId = p2.conversationId
		local Message = p2.message
		
		if Message and Message.id and ConversationId then
			local FromLegacy = buildFromLegacy(Message, ConversationId)
			FromLegacy.status = MessageStatus.Pending
			IngestBatchModule(ConversationId, { FromLegacy }, IngestOperationModule.Prepend)
		end
	end,
	[ConversationsModule.Actions.SentMessage.name] = function(p2, p3)
		local ConversationId = p2.conversationId
		local MessageId = p2.messageId
		
		if ConversationId and MessageId then
			p3.conversationMessageListStore.removeMessage(ConversationId, MessageId)
			p3.conversationMessageStore.removeMessage(MessageId)
		end
	end,
	[ConversationsModule.Actions.MessageModerated.name] = function(p2, p3)
		-- upvalues: MessageStatus (copy), FFlagAppChatIncrementalPaginationProjectionModule (copy)
		local MessageId = p2.messageId
		
		if MessageId then
			p3.conversationMessageStore.updateMessage(MessageId, { status = MessageStatus.Moderated })
			
			if FFlagAppChatIncrementalPaginationProjectionModule and p2.conversationId then
				p3.conversationMessageListStore.publishMessageUpdates(p2.conversationId, { MessageId })
			end
		end
	end,
	[ConversationsModule.Actions.MessageFailedToSend.name] = function(p2, p3)
		-- upvalues: MessageStatus (copy), FFlagAppChatIncrementalPaginationProjectionModule (copy)
		local MessageId = p2.messageId
		
		if MessageId then
			p3.conversationMessageStore.updateMessage(MessageId, { status = MessageStatus.Failed })
			
			if FFlagAppChatIncrementalPaginationProjectionModule and p2.conversationId then
				p3.conversationMessageListStore.publishMessageUpdates(p2.conversationId, { MessageId })
			end
		end
	end,
	[AppChatNetworkingModule.rodux.GetOlderMessages.Succeeded.name] = function(p2, _)
		-- upvalues: CryoModule (copy), BuildConversationMessageFromApiModule (copy), IngestBatchModule (copy), IngestOperationModule (copy)
		local ConversationId = p2.queryArgs and p2.queryArgs.conversation_id
		local ResponseBody = p2.responseBody
		
		if ConversationId and ResponseBody and ResponseBody.messages then
			local NextCursor = ResponseBody.next_cursor
			IngestBatchModule(ConversationId, CryoModule.List.filterMap(ResponseBody.messages, function(p3)
				-- upvalues: BuildConversationMessageFromApiModule (upval), ConversationId (copy)
				return if p3 and p3.id then BuildConversationMessageFromApiModule(p3, ConversationId) else nil
			end), IngestOperationModule.AppendAndAdvanceCursor, if NextCursor == "" then nil else NextCursor)
		end
	end,
	[AppChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p2, _)
		-- upvalues: CryoModule (copy), BuildConversationMessageFromApiModule (copy), IngestBatchModule (copy), IngestOperationModule (copy)
		local ConversationId = p2.queryArgs and p2.queryArgs.conversation_id
		local ResponseBody = p2.responseBody
		
		if ConversationId and ResponseBody and ResponseBody.messages then
			IngestBatchModule(ConversationId, CryoModule.List.filterMap(ResponseBody.messages, function(p3)
				-- upvalues: BuildConversationMessageFromApiModule (upval), ConversationId (copy)
				return if p3 and p3.id then BuildConversationMessageFromApiModule(p3, ConversationId) else nil
			end), IngestOperationModule.Prepend)
		end
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p2, p3)
		-- upvalues: ingestConversationsFromResponse (copy)
		ingestConversationsFromResponse(p2.responseBody, p3)
	end,
	[AppChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = function(p2, p3)
		-- upvalues: ingestConversationsFromResponse (copy)
		ingestConversationsFromResponse(p2.responseBody, p3)
	end,
	[AppChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = function(p2, p3)
		-- upvalues: ingestConversationsFromResponse (copy)
		ingestConversationsFromResponse(p2.responseBody, p3)
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p2, p3)
		-- upvalues: clearConversationStores (copy)
		local ConversationId = p2.conversationId
		
		if ConversationId then
			clearConversationStores(p3, ConversationId)
		end
	end,
	[require(AppChat.Conversations.Actions.ReloadedMessagesForConversations).name] = function(p2, p3)
		-- upvalues: clearConversationStores (copy)
		local ConversationIds = p2.conversationIds
		
		if ConversationIds then
			for _, conversationId in ConversationIds do
				clearConversationStores(p3, conversationId)
			end
		end
	end
}

return function(Callback, _)
	-- upvalues: FFlagAppChatSignalsMessageStoreModule (copy), config (copy), GetConversationMessageViewModelStoreModule (copy)
	return function(p4)
		-- upvalues: Callback (copy), FFlagAppChatSignalsMessageStoreModule (upval), config (upval), GetConversationMessageViewModelStoreModule (upval)
		local CallbackResult = Callback(p4)
		
		if not FFlagAppChatSignalsMessageStoreModule then
			return CallbackResult
		end
		local Entry: (any, any) -> () = config[p4.type]
		
		if Entry then
			local ConversationMessageViewModelStoreModule = GetConversationMessageViewModelStoreModule(false)
			Entry(p4, {
				conversationMessageStore = ConversationMessageViewModelStoreModule.conversationMessageStore,
				conversationMessageListStore = ConversationMessageViewModelStoreModule.conversationMessageListStore,
				conversationMessageViewModelStore = ConversationMessageViewModelStoreModule
			})
		end
		return CallbackResult
	end
end