local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local sharedFlagsModule = require(parent.SharedFlags)
local buildConversationMessageFromApiModule = require(appChat.Stores.Ingestion.buildConversationMessageFromApi)
local ingestBatchModule = require(appChat.Stores.Ingestion.ingestBatch)
local ingestOperationModule = require(appChat.Stores.Ingestion.IngestOperation)
local conversationsModule = require(appChat.Conversations)
local networkingChatModule = require(appChat.Http.NetworkingChat)
local receivedMessages = conversationsModule.Actions.ReceivedMessages
local sendingMessage = conversationsModule.Actions.SendingMessage
local sentMessage = conversationsModule.Actions.SentMessage
local messageModerated = conversationsModule.Actions.MessageModerated
local messageFailedToSend = conversationsModule.Actions.MessageFailedToSend
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local reloadedMessagesForConversationsModule = require(appChat.Conversations.Actions.ReloadedMessagesForConversations)
local _ = require(appChat.MessageData.Types)
local enumsModule = require(appChat.MessageData.Enums)
local messageModelModule = require(appChat.Models.MessageModel)
local messageStatus = enumsModule.MessageStatus
local messageType = enumsModule.MessageType
local messageVisibility = enumsModule.MessageVisibility
local getFFlagEnableSocialCards = sharedFlagsModule.GetFFlagEnableSocialCards
local getConversationMessageViewModelStoreModule = require(appChat.Stores.GetConversationMessageViewModelStore)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)

local function _(a, b, p1, p2)
	-- upvalues: messageStatus (ref), messageVisibility (ref)
	return if a then messageStatus.Pending elseif b then messageStatus.Failed elseif p1 then messageStatus.Moderated elseif p2 == messageVisibility.Hidden then messageStatus.Hidden else messageStatus.Default
end

local function extractLegacyTimestamp(p1)
	if p1 == nil or typeof(p1) ~= "table" then
		return nil
	elseif p1.ToIsoDate then
		return p1:ToIsoDate()
	end
	local unixTimestamp = nil
	
	if p1.GetUnixTimestamp then
		unixTimestamp = p1:GetUnixTimestamp()
	elseif p1.UnixTimestamp then
		unixTimestamp = p1.UnixTimestamp
	end
	if unixTimestamp and unixTimestamp > 0 then
		local ok, status = pcall(DateTime.fromUnixTimestamp, unixTimestamp)
		
		return if ok and status then status:ToIsoDate() else nil
	end
end

local function messagesFromWebResponse(p1, p2)
	-- upvalues: messageModelModule (ref)
	if p2 == nil then
		return {}
	end
	local id = nil
	local t = {}
	
	for i = #p2, 1, -1 do
		local var1 = p2[i]
		local var2 = messageModelModule.fromWeb(var1, p1, id)
		
		if var2 ~= nil then
			var2.isPreviewable = var1.is_previewable
			var2.isBadgeable = var1.is_badgeable
			id = var2.id
			table.insert(t, 1, var2)
		end
	end
	return t
end

local function buildFromLegacy(p3, p4)
	-- upvalues: extractLegacyTimestamp (ref), messageType (ref), getFFlagEnableSocialCards (ref), messageStatus (ref), messageVisibility (ref)
	return {
		id = p3.id or p3.messageId,
		type = if p3.messageType == "System" then messageType.System else messageType.User,
		content = p3.content,
		created_at = extractLegacyTimestamp(p3.sent),
		sender_user_id = if p3.senderTargetId then tonumber(p3.senderTargetId) else nil,
		moderation_type = p3.moderationType,
		visibility = p3.visibility,
		preview_content = p3.previewContent,
		content_to_display = p3.contentToDisplay or p3.content,
		replies_to = if p3.repliesTo and p3.repliesTo.id then {
			id = p3.repliesTo.id,
			content = p3.repliesTo.content,
			sender_user_id = if p3.repliesTo.senderTargetId then tonumber(p3.repliesTo.senderTargetId) else nil,
			created_at = extractLegacyTimestamp(p3.repliesTo.sent),
			type = if p3.repliesTo.messageType == "System" then messageType.System else messageType.User
		} else nil,
		cards = if getFFlagEnableSocialCards() then p3.cards else nil,
		filtered_for_receivers = p3.filteredForReceivers,
		conversationId = p4,
		status = if p3.isSending then messageStatus.Pending elseif p3.failed then messageStatus.Failed elseif p3.moderated then messageStatus.Moderated elseif p3.visibility == messageVisibility.Hidden then messageStatus.Hidden else messageStatus.Default,
		stableKey = p3.stableKey or (p3.stable_key or (p3.id or p3.messageId))
	}
end

local function clearConversationStores(p3, p4)
	for i, v in p3.conversationMessageListStore.getOrderedIds(p4) do
		p3.conversationMessageStore.removeMessage(v)
	end
	p3.conversationMessageViewModelStore.evictConversation(p4)
	p3.conversationMessageListStore.clearConversation(p4)
end

local function ingestConversationsFromResponse(p5, _)
	-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
	if not p5 or not p5.conversations then return end
	for i, v in p5.conversations do
		local id = v.id
		
		if id and v.messages then
			ingestBatchModule(id, cryoModule.List.filterMap(v.messages, function(p6)
				-- upvalues: buildConversationMessageFromApiModule (copy), id (ref)
				return if p6 and p6.id then buildConversationMessageFromApiModule(p6, id) else nil
			end), ingestOperationModule.Prepend)
		end
	end
end

local t = {
	[receivedMessages.name] = function(p6, _)
		-- upvalues: cryoModule (ref), buildFromLegacy (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p6.conversationId
		local messages = p6.messages
		
		if messages and conversationId then
			ingestBatchModule(conversationId, cryoModule.List.filterMap(messages, function(p7)
				-- upvalues: buildFromLegacy (copy), conversationId (ref)
				return if p7 and p7.id then buildFromLegacy(p7, conversationId) else nil
			end), ingestOperationModule.Prepend)
		end
	end,
	[sendingMessage.name] = function(p6, _)
		-- upvalues: buildFromLegacy (ref), messageStatus (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p6.conversationId
		local message = p6.message
		
		if message and message.id and conversationId then
			local var3 = buildFromLegacy(message, conversationId)
			var3.status = messageStatus.Pending
			ingestBatchModule(conversationId, { var3 }, ingestOperationModule.Prepend)
		end
	end,
	[sentMessage.name] = function(p6, p7)
		local conversationId = p6.conversationId
		local messageId = p6.messageId
		
		if conversationId and messageId then
			p7.conversationMessageListStore.removeMessage(conversationId, messageId)
			p7.conversationMessageStore.removeMessage(messageId)
		end
	end,
	[messageModerated.name] = function(p6, p7)
		-- upvalues: messageStatus (ref)
		local messageId = p6.messageId
		
		if messageId then
			p7.conversationMessageStore.updateMessage(messageId, { status = messageStatus.Moderated })
		end
	end,
	[messageFailedToSend.name] = function(p6, p7)
		-- upvalues: messageStatus (ref)
		local messageId = p6.messageId
		
		if messageId then
			p7.conversationMessageStore.updateMessage(messageId, { status = messageStatus.Failed })
		end
	end,
	[appChatNetworkingModule.rodux.GetOlderMessages.Succeeded.name] = function(p6, _)
		-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p6.queryArgs and p6.queryArgs.conversation_id
		local responseBody = p6.responseBody
		
		if conversationId and responseBody and responseBody.messages then
			local nextCursor = responseBody.next_cursor
			ingestBatchModule(conversationId, cryoModule.List.filterMap(responseBody.messages, function(p7)
				-- upvalues: buildConversationMessageFromApiModule (copy), conversationId (ref)
				return if p7 and p7.id then buildConversationMessageFromApiModule(p7, conversationId) else nil
			end), ingestOperationModule.AppendAndAdvanceCursor, if nextCursor == "" then nil else nextCursor)
		end
	end,
	[appChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p6, _)
		-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p6.queryArgs and p6.queryArgs.conversation_id
		local responseBody = p6.responseBody
		
		if conversationId and responseBody and responseBody.messages then
			ingestBatchModule(conversationId, cryoModule.List.filterMap(responseBody.messages, function(p7)
				-- upvalues: buildConversationMessageFromApiModule (copy), conversationId (ref)
				return if p7 and p7.id then buildConversationMessageFromApiModule(p7, conversationId) else nil
			end), ingestOperationModule.Prepend)
		end
	end,
	[networkingChatModule.GetLatestMessages.Succeeded.name] = function(p6, _)
		-- upvalues: messagesFromWebResponse (ref), cryoModule (ref), buildFromLegacy (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local responseBody = p6.responseBody
		
		if responseBody == nil then return end
		for i, v in ipairs(responseBody) do
			local var3 = tostring(v.conversationId)
			ingestBatchModule(var3, cryoModule.List.filterMap(messagesFromWebResponse(var3, v.chatMessages), function(p7)
				-- upvalues: buildFromLegacy (copy), var3 (ref)
				return if p7 and p7.id then buildFromLegacy(p7, var3) else nil
			end), ingestOperationModule.Prepend)
		end
	end,
	[appChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p7, p8)
		-- upvalues: ingestConversationsFromResponse (ref)
		ingestConversationsFromResponse(p7.responseBody, p8)
	end,
	[appChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = function(p7, p8)
		-- upvalues: ingestConversationsFromResponse (ref)
		ingestConversationsFromResponse(p7.responseBody, p8)
	end,
	[appChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = function(p7, p8)
		-- upvalues: ingestConversationsFromResponse (ref)
		ingestConversationsFromResponse(p7.responseBody, p8)
	end,
	[removedConversationModule.name] = function(p7, p8)
		-- upvalues: clearConversationStores (ref)
		local conversationId = p7.conversationId
		
		if conversationId then
			clearConversationStores(p8, conversationId)
		end
	end,
	[reloadedMessagesForConversationsModule.name] = function(p7, p8)
		-- upvalues: clearConversationStores (ref)
		local conversationIds = p7.conversationIds
		
		if conversationIds then
			for i, v in conversationIds do
				clearConversationStores(p8, v)
			end
		end
	end
}

return function(value, _)
	-- upvalues: fFlagAppChatSignalsMessageStoreModule (ref), t (ref), getConversationMessageViewModelStoreModule (ref)
	return function(p9)
		-- upvalues: value (ref), fFlagAppChatSignalsMessageStoreModule (copy), t (copy), getConversationMessageViewModelStoreModule (copy)
		local var4 = value(p9)
		
		if not fFlagAppChatSignalsMessageStoreModule then
			return var4
		end
		local type = t[p9.type]
		
		if type then
			local var5 = getConversationMessageViewModelStoreModule(false)
			type(p9, {
				conversationMessageStore = var5.conversationMessageStore,
				conversationMessageListStore = var5.conversationMessageListStore,
				conversationMessageViewModelStore = var5
			})
		end
		return var4
	end
end