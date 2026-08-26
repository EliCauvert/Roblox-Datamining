local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local roduxModule = require(parent.Rodux)
local luauPolyfillModule = require(parent.LuauPolyfill)
local conversationsModule = require(appChat.Conversations)
local changedParticipantsModule = require(appChat.Conversations.Actions.ChangedParticipants)
local hasUnreadMessagesModule = require(appChat.Conversations.Actions.HasUnreadMessages)
local fetchedOldestMessageModule = require(appChat.Conversations.Actions.FetchedOldestMessage)
local fetchingOlderMessagesModule = require(appChat.Conversations.Actions.FetchingOlderMessages)
local messageFailedToSend = conversationsModule.Actions.MessageFailedToSend
local messageModerated = conversationsModule.Actions.MessageModerated
local readConversationModule = require(appChat.Conversations.Actions.ReadConversation)
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local receivedMessages = conversationsModule.Actions.ReceivedMessages
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local receivedChannelsMigrationConflictModule = require(appChat.Conversations.Actions.ReceivedChannelsMigrationConflict)
local renamedGroupConversationModule = require(appChat.Conversations.Actions.RenamedGroupConversation)
local sendingMessage = conversationsModule.Actions.SendingMessage
local sentMessage = conversationsModule.Actions.SentMessage
local setConversationLoadingStatusModule = require(appChat.Conversations.Actions.SetConversationLoadingStatus)
local setPinnedGameForConversationModule = require(appChat.Conversations.Actions.SetPinnedGameForConversation)
local setUserLeavingConversationModule = require(appChat.Conversations.Actions.SetUserLeavingConversation)
local setUserTypingModule = require(appChat.Conversations.Actions.SetUserTyping)
local friendConversationCreatedModule = require(appChat.Conversations.Actions.FriendConversationCreated)
local friendshipDestroyedModule = require(appChat.Actions.FriendshipDestroyed)
local reloadedMessagesForConversationsModule = require(appChat.Conversations.Actions.ReloadedMessagesForConversations)
local conversationModerationTypeChangedModule = require(appChat.Conversations.Actions.ConversationModerationTypeChanged)
local networkingChatModule = require(appChat.Http.NetworkingChat)
local networkingBlockingModule = require(appChat.Http.NetworkingBlocking)
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local immutable = require(parent.AppCommonLib).Immutable
local orderedMap = require(parent.AppCommonLib).OrderedMap
local functional = require(parent.AppCommonLib).Functional
local messageModelModule = require(appChat.Models.MessageModel)
local cryoModule = require(parent.Cryo)
local addConversationModule = require(appChat.Utils.addConversation)
local getFFlagAppChatPCMFixBlocking = require(parent.SharedFlags).getFFlagAppChatPCMFixBlocking
local updateConversationReducerModule = require(script.Parent.updateConversationReducer)
local getOneToOneConversationIdFromFriendIdModule = require(appChat.Utils.getOneToOneConversationIdFromFriendId)
local getFFlagAppChatEnableManualTranslationModule = require(appChat.Flags.getFFlagAppChatEnableManualTranslation)
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local constantsModule = require(appChat.Constants)
local t = {
	[constantsModule.OptInVariant.OsaContextCard] = {
		field = "osaAcknowledgementStatus",
		value = conversationChannelsModule.OsaAcknowledgementStatus.Acknowledged
	},
	[constantsModule.OptInVariant.ChatOptInInfoCard] = if require(parent.SharedFlags).FFlagAppChatEnableU13ChatOptIn then {
		field = "userOptedIntoChatMessages",
		value = conversationChannelsModule.UserOptedIntoChatMessagesStatus.OptedIn
	} else nil
}

local function markConversationAndMessagesAsRead(p1, p2)
	-- upvalues: immutable (ref)
	local var1 = p1[p2]
	
	if var1 then
		assert(var1, "FFlagLuauTinyControlFlowAnalysis")
		local hasUnreadMessages = immutable.Set(immutable.Set(var1, "messages", var1.messages:Map(function(p3)
			-- upvalues: immutable (copy)
			return if p3.read then p3 else immutable.Set(p3, "read", true)
		end)), "hasUnreadMessages", false)
		
		return immutable.Set(p1, hasUnreadMessages.id, hasUnreadMessages)
	end
	warn("Conversation " .. p1 .. " not found in ReadConversation reducer")
	
	return p1
end

local function addMessagesToConversation(p1, p2, p3)
	-- upvalues: immutable (ref), orderedMap (ref)
	local var1 = p1[p2]
	
	if not var1 then
		return p1
	end
	local var2 = nil
	local previewMessageId = var1.previewMessageId
	local var3 = 0
	
	if previewMessageId and var1.messages then
		local var4 = var1.messages:Get(previewMessageId)
		
		if var4 then
			var3 = var4.sent:GetUnixTimestamp()
		end
	end
	local id
	for i = 1, #p3.messages do
		local var5 = p3.messages[i]
		id = var1.messages:Get(var5.id)
		
		if not id then
			if var5.isPreviewable and var3 < var5.sent:GetUnixTimestamp() then
				previewMessageId = var5.id
				var3 = var5.sent:GetUnixTimestamp()
			end
			var2 = var5
		end
		if var2 then
			var2.previousMessageId = id.id
		end
		if var5.previousMessageId == nil and id.previousMessageId ~= nil then
			var5.previousMessageId = id.previousMessageId
		end
		var5.read = var5.read or id.read
	end
	var1 = immutable.JoinDictionaries(var1, { previewMessageId = previewMessageId })
	local var6 = orderedMap.Insert(var1.messages, unpack(p3.messages))
	
	if p3.exclusiveStartMessageId and #p3.messages > 0 and var6:Get(p3.exclusiveStartMessageId) then
		var6 = var6:Insert(immutable.Set(var6:Get(p3.exclusiveStartMessageId), "previousMessageId", p3.messages[1].id))
	end
	local var7 = previewMessageId and (var6 and var6:Get(previewMessageId))
	local lastUpdated = var1.lastUpdated
	
	if var7 then
		lastUpdated = if (lastUpdated and lastUpdated:GetUnixTimestamp() or 0) < var7.sent:GetUnixTimestamp() then var7.sent else var1.lastUpdated
	end
	id = immutable.Set(immutable.JoinDictionaries(var1, {
		messages = var6,
		lastUpdated = lastUpdated,
		hasUnreadMessages = p3.shouldMarkConversationUnread or var1.hasUnreadMessages,
		nextCursor = p3.nextCursor,
		previousCursor = p3.previousCursor
	}), "usersTyping", {})
	
	return immutable.Set(p1, id.id, id)
end

local function updateMessageContentToDisplay(p4, p5, p6, p7)
	-- upvalues: immutable (ref)
	local var8 = p4[p5]
	
	if var8 then
		local var9 = var8.messages:Get(p6)
		
		if var9 then
			local messages = immutable.Set(var8, "messages", var8.messages:Insert(immutable.Set(var9, "contentToDisplay", p7)))
			
			return immutable.Set(p4, messages.id, messages)
		end
	end
	return p4
end

local function _(p4, p5)
	-- upvalues: functional (ref), messageModelModule (ref)
	if p5 then
		local var8 = nil
		
		return functional.MapReverse(p5, function(p6)
			-- upvalues: messageModelModule (copy), p4 (ref), var8 (write)
			local var9 = messageModelModule.fromWeb(p6, p4, var8)
			var8 = var9.id
			
			return var9
		end)
	end
	return {}
end

local function messagesFromResponseOfChannelsApi(p4, p5)
	-- upvalues: messageModelModule (ref)
	if not p5 then
		return {}
	end
	local id = nil
	local t = {}
	
	for i = #p5, 1, -1 do
		local var8 = messageModelModule.fromChannelsApi(p5[i], p4, id)
		
		if var8 then
			table.insert(t, var8)
			id = var8.id
		end
	end
	return t
end

local _ = function(p6)
	return p6.messages or {}
end

local _ = function(p6)
	-- upvalues: playersService (ref)
	return if if p6 then p6[#p6] else nil then true else false
end

local function getShouldMarkConversationUnread(p6, p7)
	-- upvalues: playersService (ref)
	if not p6 or not p6.messages or not p7 then
		return false
	end
	local var9 = p6.messages.values[p6.messages.keys[#p6.messages.keys]]
	local var10 = var9 and (var9.sent and (var9.sent:GetUnixTimestamp() or 0))
	
	for i = #p7, 1, -1 do
		local var11 = p7[i]
		
		if not var11 then
			continue
		end
		if var11.sent:GetUnixTimestamp() > var10 then
			if var11.senderTargetId == tostring(playersService.LocalPlayer.UserId) or not var11.isBadgeable then
				continue
			end
			return true
		end
		return false
	end
	return false
end

return roduxModule.createReducer({}, {
	[receivedConversationModule.name] = function(p8, p9)
		-- upvalues: updateConversationReducerModule (ref)
		return updateConversationReducerModule(p8, p9.conversation)
	end,
	[networkingChatModule.StartGroupConversation.Succeeded.name] = function(p8, p9)
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		return updateConversationReducerModule(p8, conversationModule.fromWeb(p9.responseBody.conversation))
	end,
	[networkingChatModule.StartOneToOneConversation.Succeeded.name] = function(p8, p9)
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		return updateConversationReducerModule(p8, conversationModule.fromWeb(p9.responseBody.conversation))
	end,
	[appChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p8, p9)
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref)
		local responseBody = p9.responseBody
		
		if responseBody and responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].status == "success") then
			p8 = updateConversationReducerModule(p8, conversationChannelsModule.fromChannelsApi(responseBody.conversations[1]))
		end
		return p8
	end,
	[appChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p8, p9)
		-- upvalues: conversationChannelsModule (ref), addConversationModule (ref)
		local responseBody = p9.responseBody
		
		if responseBody and responseBody.conversations and responseBody.conversations[1] then
			p8 = addConversationModule(p8, conversationChannelsModule.fromChannelsApi(responseBody.conversations[1]))
		end
		return p8
	end,
	[receivedMessages.name] = function(p8, p9)
		-- upvalues: addMessagesToConversation (ref)
		return addMessagesToConversation(p8, p9.conversationId, p9)
	end,
	[sendingMessage.name] = function(p8, p9)
		-- upvalues: orderedMap (ref), immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local sendingMessages = immutable.Set(conversationId, "sendingMessages", orderedMap.Insert(conversationId.sendingMessages, p9.message))
			p8 = immutable.Set(p8, sendingMessages.id, sendingMessages)
		end
		return p8
	end,
	[sentMessage.name] = function(p8, p9)
		-- upvalues: orderedMap (ref), immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local sendingMessages = immutable.Set(conversationId, "sendingMessages", orderedMap.Delete(conversationId.sendingMessages, p9.messageId))
			p8 = immutable.Set(p8, sendingMessages.id, sendingMessages)
		end
		return p8
	end,
	[renamedGroupConversationModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p9.conversationId
		local var12 = p8[conversationId]
		
		if var12 then
			p8 = immutable.Set(p8, conversationId, immutable.JoinDictionaries(var12, {
				lastUpdated = p9.lastUpdated,
				title = p9.title,
				isDefaultTitle = p9.isDefaultTitle
			}))
		end
		return p8
	end,
	[hasUnreadMessagesModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local id = p9.conversation and p8[p9.conversation.id]
		
		if id then
			p8 = immutable.Set(p8, p9.conversation.id, immutable.Set(id, "hasUnreadMessages", true))
		end
		return p8
	end,
	[changedParticipantsModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p9.conversationId
		local participants = p9.participants
		local var12 = p8[conversationId]
		
		if var12 then
			p8 = immutable.Set(p8, conversationId, immutable.JoinDictionaries(var12, {
				participants = participants,
				lastUpdated = p9.lastUpdated,
				title = p9.title
			}))
		end
		return p8
	end,
	[removedConversationModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		return immutable.Set(p8, p9.conversationId, nil)
	end,
	[setUserTypingModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local usersTyping = immutable.Set(conversationId, "usersTyping", immutable.Set(conversationId.usersTyping, p9.userId, p9.value))
			p8 = immutable.Set(p8, usersTyping.id, usersTyping)
		end
		return p8
	end,
	[fetchingOlderMessagesModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local fetchingOlderMessages = immutable.Set(conversationId, "fetchingOlderMessages", p9.fetchingOlderMessages)
			p8 = immutable.Set(p8, fetchingOlderMessages.id, fetchingOlderMessages)
		end
		return p8
	end,
	[fetchedOldestMessageModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local fetchedOldestMessage = immutable.Set(conversationId, "fetchedOldestMessage", p9.fetchedOldestMessage)
			
			return immutable.Set(p8, fetchedOldestMessage.id, fetchedOldestMessage)
		end
		return p8
	end,
	[readConversationModule.name] = function(p8, p9)
		-- upvalues: markConversationAndMessagesAsRead (ref)
		return markConversationAndMessagesAsRead(p8, p9.conversationId)
	end,
	[messageModerated.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local messageId = conversationId.sendingMessages:Get(p9.messageId)
			
			if messageId then
				local sendingMessages = immutable.Set(conversationId, "sendingMessages", conversationId.sendingMessages:Insert(immutable.Set(messageId, "moderated", true)))
				p8 = immutable.Set(p8, sendingMessages.id, sendingMessages)
			end
		end
		return p8
	end,
	[messageFailedToSend.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local messageId = conversationId.sendingMessages:Get(p9.messageId)
			
			if messageId then
				local sendingMessages = immutable.Set(conversationId, "sendingMessages", conversationId.sendingMessages:Insert(immutable.Set(messageId, "failed", true)))
				p8 = immutable.Set(p8, sendingMessages.id, sendingMessages)
			end
		end
		return p8
	end,
	[setConversationLoadingStatusModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p8[p9.conversationId]
		
		if conversationId then
			local initialLoadingStatus = immutable.Set(conversationId, "initialLoadingStatus", p9.value)
			
			return immutable.Set(p8, initialLoadingStatus.id, initialLoadingStatus)
		end
		return p8
	end,
	[setUserLeavingConversationModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local id = p8[p9.id]
		
		if id then
			local isUserLeaving = immutable.Set(id, "isUserLeaving", p9.isLeaving)
			p8 = immutable.Set(p8, isUserLeaving.id, isUserLeaving)
		end
		return p8
	end,
	[setPinnedGameForConversationModule.name] = function(p8, p9)
		-- upvalues: immutable (ref)
		local conversationId = p9.conversationId
		local var12 = p8[conversationId]
		
		if var12 then
			p8 = immutable.Set(p8, conversationId, immutable.JoinDictionaries(var12, {
				pinnedGame = {
					rootPlaceId = p9.rootPlaceId,
					universeId = p9.universeId
				}
			}))
		end
		return p8
	end,
	[networkingChatModule.GetUserConversations.Succeeded.name] = function(p8, p9)
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		for i, v in ipairs(p9.responseBody) do
			p8 = updateConversationReducerModule(p8, conversationModule.fromWeb(v))
		end
		return p8
	end,
	[appChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p10, p11)
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref), luauPolyfillModule (ref), messageModelModule (ref), addMessagesToConversation (ref)
		local responseBody = p11.responseBody
		
		if responseBody and responseBody.conversations then
			for i, v in responseBody.conversations do
				local var12 = conversationChannelsModule.fromChannelsApi(v)
				p10 = updateConversationReducerModule(p10, var12)
				local messages = v.messages or {}
				
				if messages and #messages > 0 then
					p10 = addMessagesToConversation(p10, var12.id, {
						messages = luauPolyfillModule.Array.map(messages, function(p12)
							-- upvalues: messageModelModule (copy), var12 (ref)
							return messageModelModule.fromChannelsApi(p12, var12.id)
						end)
					})
				end
			end
		end
		return p10
	end,
	[networkingChatModule.GetConversations.Succeeded.name] = function(p12, p13)
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		for i, v in ipairs(p13.responseBody) do
			p12 = updateConversationReducerModule(p12, conversationModule.fromWeb(v))
		end
		return p12
	end,
	[appChatNetworkingModule.rodux.GetOlderMessages.Succeeded.name] = function(p14, p15)
		-- upvalues: messagesFromResponseOfChannelsApi (ref), addMessagesToConversation (ref), immutable (ref)
		local conversationId = p15.queryArgs.conversation_id
		local responseBody = p15.responseBody
		local _ = {}
		local var13 = p14[conversationId]
		
		if not var13 then
			return p14
		end
		assert(var13, "FFlagLuauTinyControlFlowAnalysis")
		local previousCursor = var13.previousCursor or nil
		local nextCursor = var13.nextCursor or nil
		
		if not responseBody then
			return p14
		end
		local var14 = messagesFromResponseOfChannelsApi(conversationId, responseBody.messages)
		local var15 = if responseBody.next_cursor == "" then nil else responseBody.next_cursor
		
		if var15 then
			nextCursor = var15
		end
		if previousCursor == nil then
			previousCursor = if responseBody.previous_cursor == "" then nil else responseBody.previous_cursor
		end
		p14 = addMessagesToConversation(p14, conversationId, {
			messages = var14,
			nextCursor = nextCursor,
			previousCursor = previousCursor
		})
		
		if not var15 then
			local var16 = p14[conversationId]
			
			if var16 then
				local fetchedOldestMessage = immutable.Set(var16, "fetchedOldestMessage", true)
				p14 = immutable.Set(p14, fetchedOldestMessage.id, fetchedOldestMessage)
			end
		end
		return p14
	end,
	[appChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p14, p15)
		-- upvalues: messagesFromResponseOfChannelsApi (ref), getShouldMarkConversationUnread (ref), addMessagesToConversation (ref)
		local conversationId = p15.queryArgs.conversation_id
		local responseBody = p15.responseBody
		local var13 = p14[conversationId]
		
		if not var13 then
			return p14
		end
		assert(var13, "FFlagLuauTinyControlFlowAnalysis")
		local previousCursor = var13.previousCursor or nil
		local nextCursor = var13.nextCursor or nil
		
		if not responseBody then
			return p14
		end
		local var14 = messagesFromResponseOfChannelsApi(conversationId, responseBody.messages)
		
		if nextCursor == nil then
			nextCursor = if responseBody.next_cursor == "" then nil else responseBody.next_cursor
		end
		local var15 = if responseBody.previous_cursor == "" then nil else responseBody.previous_cursor
		
		if var15 then
			previousCursor = var15
		end
		return addMessagesToConversation(p14, conversationId, {
			messages = var14,
			nextCursor = nextCursor,
			previousCursor = previousCursor,
			shouldMarkConversationUnread = getShouldMarkConversationUnread(var13, var14)
		})
	end,
	[networkingChatModule.GetMessages.Succeeded.name] = function(p14, p15)
		-- upvalues: functional (ref), messageModelModule (ref), playersService (ref), addMessagesToConversation (ref), immutable (ref)
		local t, pageSize
		local conversationId = p15.queryArgs.conversationId
		local responseBody = p15.responseBody
		
		if responseBody then
			pageSize = nil
			t = functional.MapReverse(responseBody, function(p16)
				-- upvalues: messageModelModule (copy), conversationId (ref), pageSize (write)
				local var13 = messageModelModule.fromWeb(p16, conversationId, pageSize)
				var53 = var13.id
				
				return var13
			end)
		else
			t = {}
		end
		p14 = addMessagesToConversation(p14, conversationId, {
			messages = t,
			shouldMarkConversationUnread = not (if if t then t[#t] else nil then true else false)
		})
		pageSize = p15.queryArgs.pageSize
		
		if pageSize and #t < pageSize then
			local var13 = p14[conversationId]
			
			if not var13 then
				return p14
			end
			assert(var13, "FFlagLuauTinyControlFlowAnalysis")
			local var14 = p14[conversationId]
			
			if var14 then
				local fetchedOldestMessage = immutable.Set(var14, "fetchedOldestMessage", true)
				p14 = immutable.Set(p14, fetchedOldestMessage.id, fetchedOldestMessage)
			end
		end
		return p14
	end,
	[networkingChatModule.GetLatestMessages.Succeeded.name] = function(p14, p15)
		-- upvalues: functional (ref), messageModelModule (ref), addMessagesToConversation (ref)
		for i, v in ipairs(p15.responseBody) do
			local t
			local var13 = tostring(v.conversationId)
			local chatMessages = v.chatMessages
			
			if chatMessages then
				local var14 = nil
				t = functional.MapReverse(chatMessages, function(p16)
					-- upvalues: messageModelModule (copy), var13 (ref), var14 (write)
					local var15 = messageModelModule.fromWeb(p16, var13, var14)
					var53 = var15.id
					
					return var15
				end)
			else
				t = {}
			end
			p14 = addMessagesToConversation(p14, var13, { messages = t })
		end
		return p14
	end,
	[appChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = function(p16, p17)
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref), luauPolyfillModule (ref), messageModelModule (ref), addMessagesToConversation (ref)
		local var15 = p17.responseBody.conversations[1]
		
		if not var15 then
			return p16
		end
		local var16 = conversationChannelsModule.fromChannelsApi(var15)
		p16 = updateConversationReducerModule(p16, var16)
		local messages = var15.messages or {}
		
		if messages and #messages > 0 then
			p16 = addMessagesToConversation(p16, var16.id, {
				messages = luauPolyfillModule.Array.map(messages, function(p18)
					-- upvalues: messageModelModule (copy), var16 (ref)
					return messageModelModule.fromChannelsApi(p18, var16.id)
				end)
			})
		end
		return p16
	end,
	[appChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = function(p16, p17)
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref), luauPolyfillModule (ref), messageModelModule (ref), addMessagesToConversation (ref)
		local responseBody = p17.responseBody
		
		if not responseBody or not responseBody.conversations then
			return p16
		end
		for i, v in responseBody.conversations do
			local var15 = conversationChannelsModule.fromChannelsApi(v)
			p16 = updateConversationReducerModule(p16, var15)
			local messages = v.messages or {}
			
			if messages and #messages > 0 then
				p16 = addMessagesToConversation(p16, var15.id, {
					messages = luauPolyfillModule.Array.map(messages, function(p18)
						-- upvalues: messageModelModule (copy), var15 (ref)
						return messageModelModule.fromChannelsApi(p18, var15.id)
					end)
				})
			end
		end
		return p16
	end,
	[appChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p18, p19)
		-- upvalues: markConversationAndMessagesAsRead (ref)
		return markConversationAndMessagesAsRead(p18, p19.postBody.conversation_ids[1])
	end,
	[networkingChatModule.MarkAsRead.Succeeded.name] = function(p18, p19)
		-- upvalues: markConversationAndMessagesAsRead (ref)
		return markConversationAndMessagesAsRead(p18, p19.postBody.conversationId)
	end,
	[appChatNetworkingModule.rodux.TranslateUserMessage.Succeeded.name] = if getFFlagAppChatEnableManualTranslationModule() then function(p18, p19)
		-- upvalues: updateMessageContentToDisplay (ref)
		return if p19.postBody.conversation_id and p19.postBody.message_id then updateMessageContentToDisplay(p18, p19.postBody.conversation_id, p19.postBody.message_id, p19.responseBody.content_to_display) else p18
	end else nil,
	[receivedChannelsMigrationConflictModule.name] = function(_, _)
		return {}
	end,
	[friendConversationCreatedModule.name] = function(p18, p19)
		-- upvalues: immutable (ref)
		return if p18[p19.oldFriendConversationId] then immutable.Set(p18, p19.oldFriendConversationId, nil) else p18
	end,
	[friendshipDestroyedModule.name] = function(p18, p19)
		-- upvalues: conversationChannelsModule (ref), immutable (ref)
		local var16 = if p19.userId1 ~= "localUserId" then if p19.userId2 ~= "localUserId" then nil else p19.userId2 else p19.userId1
		
		if not var16 then
			return p18
		end
		assert(var16, "FFlagLuauTinyControlFlowAnalysis")
		local friendConversationId = conversationChannelsModule.getFriendConversationId({ var16 })
		
		return if p18[friendConversationId] then immutable.Set(p18, friendConversationId, nil) else p18
	end,
	[networkingBlockingModule.BlockUserById.Succeeded.name] = if getFFlagAppChatPCMFixBlocking() then function(p18, p19)
		-- upvalues: getOneToOneConversationIdFromFriendIdModule (ref), immutable (ref), conversationChannelsModule (ref)
		local var16 = tostring(p19.namedIds.users)
		
		if not var16 then
			return p18
		end
		local var17 = getOneToOneConversationIdFromFriendIdModule(p18, var16)
		local var18 = p18
		
		if var17 and p18[var17] then
			var18 = immutable.Set(var18, var17, nil)
		end
		local friendConversationId = conversationChannelsModule.getFriendConversationId({ var16 })
		
		if friendConversationId and p18[friendConversationId] then
			var18 = immutable.Set(p18, friendConversationId, nil)
		end
		return var18
	end else nil,
	[reloadedMessagesForConversationsModule.name] = function(p18, p19)
		-- upvalues: cryoModule (ref), conversationChannelsModule (ref)
		local var16 = p18
		
		for i, v in p19.conversationIds do
			var16 = cryoModule.Dictionary.join(var16, {
				[v] = cryoModule.Dictionary.join(var16[v], {
					fetchedOldestMessage = false,
					messages = conversationChannelsModule.getEmptyMessages(),
					sendingMessages = conversationChannelsModule.getEmptySendingMessages(),
					previousCursor = cryoModule.None,
					nextCursor = cryoModule.None
				})
			})
		end
		return var16
	end,
	[conversationModerationTypeChangedModule.name] = if fFlagAppChatEnableDoubleOptIn then function(p20, p21)
		-- upvalues: immutable (ref)
		local conversationId = p21.conversationId
		local var17 = p20[conversationId]
		
		return if var17 then immutable.Set(p20, conversationId, immutable.Set(var17, "moderationType", p21.moderationType)) else p20
	end else nil,
	[appChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p20, p21)
		-- upvalues: constantsModule (ref), t (ref), conversationChannelsModule (ref), immutable (ref)
		local postBody = p21.postBody
		
		if postBody.action_type ~= constantsModule.ModalAction.Accept then
			return p20
		end
		local modalVariant = t[postBody.modal_variant]
		
		if not modalVariant then
			return p20
		end
		local conversationId = postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ postBody.friend_id })
		local var17 = conversationId and p20[conversationId]
		
		return if var17 then immutable.Set(p20, conversationId, immutable.Set(var17, modalVariant.field, modalVariant.value)) else p20
	end
})