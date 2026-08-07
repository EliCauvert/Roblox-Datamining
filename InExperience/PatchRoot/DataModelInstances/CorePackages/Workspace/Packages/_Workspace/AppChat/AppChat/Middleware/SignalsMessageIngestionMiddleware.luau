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

local function _(a, b, p0, p1) --[[ line: 64 | named "determineStatus" ]]
	-- upvalues: messageStatus (ref), messageVisibility (ref)
	return if a then messageStatus.Pending elseif b then messageStatus.Failed elseif p0 then messageStatus.Moderated elseif p1 == messageVisibility.Hidden then messageStatus.Hidden else messageStatus.Default
end

local function extractLegacyTimestamp(p2) --[[ line: 83 ]]
	if p2 == nil or typeof(p2) ~= "table" then
		return nil
	elseif p2.ToIsoDate then
		return p2:ToIsoDate()
	end
	local unixTimestamp = nil
	
	if p2.GetUnixTimestamp then
		unixTimestamp = p2:GetUnixTimestamp()
	elseif p2.UnixTimestamp then
		unixTimestamp = p2.UnixTimestamp
	end
	if unixTimestamp and unixTimestamp > 0 then
		local ok, status = pcall(DateTime.fromUnixTimestamp, unixTimestamp)
		
		return if ok and status then status:ToIsoDate() else nil
	end
end

local function messagesFromWebResponse(p3, p4) --[[ line: 105 ]]
	-- upvalues: messageModelModule (ref)
	if p4 == nil then
		return {}
	end
	local id = nil
	local t = {}
	
	for i = #p4, 1, -1 do
		local var22 = p4[i]
		local var23 = messageModelModule.fromWeb(var22, p3, id)
		
		if var23 ~= nil then
			var23.isPreviewable = var22.is_previewable
			var23.isBadgeable = var22.is_badgeable
			id = var23.id
			table.insert(t, 1, var23)
		end
	end
	return t
end

local function buildFromLegacy(p5, p6) --[[ line: 127 ]]
	-- upvalues: extractLegacyTimestamp (ref), messageType (ref), getFFlagEnableSocialCards (ref), messageStatus (ref), messageVisibility (ref)
	return {
		id = p5.id or p5.messageId,
		type = if p5.messageType == "System" then messageType.System else messageType.User,
		content = p5.content,
		created_at = extractLegacyTimestamp(p5.sent),
		sender_user_id = if p5.senderTargetId then tonumber(p5.senderTargetId) else nil,
		moderation_type = p5.moderationType,
		visibility = p5.visibility,
		preview_content = p5.previewContent,
		content_to_display = p5.contentToDisplay or p5.content,
		replies_to = if p5.repliesTo and p5.repliesTo.id then {
			id = p5.repliesTo.id,
			content = p5.repliesTo.content,
			sender_user_id = if p5.repliesTo.senderTargetId then tonumber(p5.repliesTo.senderTargetId) else nil,
			created_at = extractLegacyTimestamp(p5.repliesTo.sent),
			type = if p5.repliesTo.messageType == "System" then messageType.System else messageType.User
		} else nil,
		cards = if getFFlagEnableSocialCards() then p5.cards else nil,
		filtered_for_receivers = p5.filteredForReceivers,
		conversationId = p6,
		status = if p5.isSending then messageStatus.Pending elseif p5.failed then messageStatus.Failed elseif p5.moderated then messageStatus.Moderated elseif p5.visibility == messageVisibility.Hidden then messageStatus.Hidden else messageStatus.Default,
		stableKey = p5.stableKey or (p5.stable_key or (p5.id or p5.messageId))
	}
end

local function clearConversationStores(p7, p8) --[[ line: 159 ]]
	for i, v in p7.conversationMessageListStore.getOrderedIds(p8) do
		p7.conversationMessageStore.removeMessage(v)
	end
	p7.conversationMessageViewModelStore.evictConversation(p8)
	p7.conversationMessageListStore.clearConversation(p8)
end

local function ingestConversationsFromResponse(p9, _) --[[ line: 253 ]]
	-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
	if not p9 or not p9.conversations then return end
	for i, v in p9.conversations do
		local id = v.id
		
		if id and v.messages then
			ingestBatchModule(id, cryoModule.List.filterMap(v.messages, function(p10) --[[ line: 260 ]]
				-- upvalues: buildConversationMessageFromApiModule (copy), id (ref)
				return if p10 and p10.id then buildConversationMessageFromApiModule(p10, id) else nil
			end), ingestOperationModule.Prepend)
		end
	end
end

local t = {
	[receivedMessages.name] = function(p11, _) --[[ line: 170 ]]
		-- upvalues: cryoModule (ref), buildFromLegacy (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p11.conversationId
		local messages = p11.messages
		
		if messages and conversationId then
			ingestBatchModule(conversationId, cryoModule.List.filterMap(messages, function(p12) --[[ line: 174 ]]
				-- upvalues: buildFromLegacy (copy), conversationId (ref)
				return if p12 and p12.id then buildFromLegacy(p12, conversationId) else nil
			end), ingestOperationModule.Prepend)
		end
	end,
	[sendingMessage.name] = function(p13, _) --[[ line: 181 ]]
		-- upvalues: buildFromLegacy (ref), messageStatus (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p13.conversationId
		local message = p13.message
		
		if message and message.id and conversationId then
			local var24 = buildFromLegacy(message, conversationId)
			var24.status = messageStatus.Pending
			ingestBatchModule(conversationId, { var24 }, ingestOperationModule.Prepend)
		end
	end,
	[sentMessage.name] = function(p14, p15) --[[ line: 191 ]]
		local conversationId = p14.conversationId
		local messageId = p14.messageId
		
		if conversationId and messageId then
			p15.conversationMessageListStore.removeMessage(conversationId, messageId)
			p15.conversationMessageStore.removeMessage(messageId)
		end
	end,
	[messageModerated.name] = function(p16, p17) --[[ line: 200 ]]
		-- upvalues: messageStatus (ref)
		local messageId = p16.messageId
		
		if messageId then
			p17.conversationMessageStore.updateMessage(messageId, { status = messageStatus.Moderated })
		end
	end,
	[messageFailedToSend.name] = function(p18, p19) --[[ line: 207 ]]
		-- upvalues: messageStatus (ref)
		local messageId = p18.messageId
		
		if messageId then
			p19.conversationMessageStore.updateMessage(messageId, { status = messageStatus.Failed })
		end
	end,
	[appChatNetworkingModule.rodux.GetOlderMessages.Succeeded.name] = function(p20, _) --[[ line: 214 ]]
		-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p20.queryArgs and p20.queryArgs.conversation_id
		local responseBody = p20.responseBody
		
		if conversationId and responseBody and responseBody.messages then
			local nextCursor = responseBody.next_cursor
			ingestBatchModule(conversationId, cryoModule.List.filterMap(responseBody.messages, function(p21) --[[ line: 218 ]]
				-- upvalues: buildConversationMessageFromApiModule (copy), conversationId (ref)
				return if p21 and p21.id then buildConversationMessageFromApiModule(p21, conversationId) else nil
			end), ingestOperationModule.AppendAndAdvanceCursor, if nextCursor == "" then nil else nextCursor)
		end
	end,
	[appChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p22, _) --[[ line: 226 ]]
		-- upvalues: cryoModule (ref), buildConversationMessageFromApiModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local conversationId = p22.queryArgs and p22.queryArgs.conversation_id
		local responseBody = p22.responseBody
		
		if conversationId and responseBody and responseBody.messages then
			ingestBatchModule(conversationId, cryoModule.List.filterMap(responseBody.messages, function(p23) --[[ line: 230 ]]
				-- upvalues: buildConversationMessageFromApiModule (copy), conversationId (ref)
				return if p23 and p23.id then buildConversationMessageFromApiModule(p23, conversationId) else nil
			end), ingestOperationModule.Prepend)
		end
	end,
	[networkingChatModule.GetLatestMessages.Succeeded.name] = function(p24, _) --[[ line: 237 ]]
		-- upvalues: messagesFromWebResponse (ref), cryoModule (ref), buildFromLegacy (ref), ingestBatchModule (ref), ingestOperationModule (ref)
		local responseBody = p24.responseBody
		
		if responseBody == nil then return end
		for i, v in ipairs(responseBody) do
			local var27 = tostring(v.conversationId)
			ingestBatchModule(var27, cryoModule.List.filterMap(messagesFromWebResponse(var27, v.chatMessages), function(p25) --[[ line: 246 ]]
				-- upvalues: buildFromLegacy (copy), var27 (ref)
				return if p25 and p25.id then buildFromLegacy(p25, var27) else nil
			end), ingestOperationModule.Prepend)
		end
	end,
	[appChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p26, p27) --[[ line: 268 ]]
		-- upvalues: ingestConversationsFromResponse (ref)
		ingestConversationsFromResponse(p26.responseBody, p27)
	end,
	[appChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = function(p28, p29) --[[ line: 272 ]]
		-- upvalues: ingestConversationsFromResponse (ref)
		ingestConversationsFromResponse(p28.responseBody, p29)
	end,
	[appChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = function(p30, p31) --[[ line: 276 ]]
		-- upvalues: ingestConversationsFromResponse (ref)
		ingestConversationsFromResponse(p30.responseBody, p31)
	end,
	[removedConversationModule.name] = function(p32, p33) --[[ line: 280 ]]
		-- upvalues: clearConversationStores (ref)
		local conversationId = p32.conversationId
		
		if conversationId then
			clearConversationStores(p33, conversationId)
		end
	end,
	[reloadedMessagesForConversationsModule.name] = function(p34, p35) --[[ line: 287 ]]
		-- upvalues: clearConversationStores (ref)
		local conversationIds = p34.conversationIds
		
		if conversationIds then
			for i, v in conversationIds do
				clearConversationStores(p35, v)
			end
		end
	end
}

return function(value, _) --[[ line: 312 | named "SignalsMessageIngestionMiddleware" ]]
	-- upvalues: fFlagAppChatSignalsMessageStoreModule (ref), t (ref), getConversationMessageViewModelStoreModule (ref)
	return function(p36) --[[ line: 313 ]]
		-- upvalues: value (ref), fFlagAppChatSignalsMessageStoreModule (copy), t (copy), getConversationMessageViewModelStoreModule (copy)
		local var28 = value(p36)
		
		if not fFlagAppChatSignalsMessageStoreModule then
			return var28
		end
		local type = t[p36.type]
		
		if type then
			local var29 = getConversationMessageViewModelStoreModule(false)
			type(p36, {
				conversationMessageStore = var29.conversationMessageStore,
				conversationMessageListStore = var29.conversationMessageListStore,
				conversationMessageViewModelStore = var29
			})
		end
		return var28
	end
end