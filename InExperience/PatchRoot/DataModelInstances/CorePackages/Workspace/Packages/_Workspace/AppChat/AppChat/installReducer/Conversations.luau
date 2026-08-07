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

local function markConversationAndMessagesAsRead(p0, p1) --[[ line: 76 ]]
	-- upvalues: immutable (ref)
	local var40 = p0[p1]
	
	if var40 then
		assert(var40, "FFlagLuauTinyControlFlowAnalysis")
		local hasUnreadMessages = immutable.Set(immutable.Set(var40, "messages", var40.messages:Map(function(p2) --[[ line: 85 ]]
			-- upvalues: immutable (copy)
			return if p2.read then p2 else immutable.Set(p2, "read", true)
		end)), "hasUnreadMessages", false)
		
		return immutable.Set(p0, hasUnreadMessages.id, hasUnreadMessages)
	end
	warn("Conversation " .. p1 .. " not found in ReadConversation reducer")
	
	return p0
end

local function addMessagesToConversation(p3, p4, p5) --[[ line: 101 ]]
	-- upvalues: immutable (ref), orderedMap (ref)
	local var42 = p3[p4]
	
	if not var42 then
		return p3
	end
	local var43 = nil
	local previewMessageId = var42.previewMessageId
	local var44 = 0
	
	if previewMessageId and var42.messages then
		local var45 = var42.messages:Get(previewMessageId)
		
		if var45 then
			var44 = var45.sent:GetUnixTimestamp()
		end
	end
	local id
	for i = 1, #p5.messages do
		local var46 = p5.messages[i]
		id = var42.messages:Get(var46.id)
		
		if not id then
			if var46.isPreviewable and var44 < var46.sent:GetUnixTimestamp() then
				previewMessageId = var46.id
				var44 = var46.sent:GetUnixTimestamp()
			end
			var43 = var46
		end
		if var43 then
			var43.previousMessageId = id.id
		end
		if var46.previousMessageId == nil and id.previousMessageId ~= nil then
			var46.previousMessageId = id.previousMessageId
		end
		var46.read = var46.read or id.read
	end
	var42 = immutable.JoinDictionaries(var42, { previewMessageId = previewMessageId })
	local var48 = orderedMap.Insert(var42.messages, unpack(p5.messages))
	
	if p5.exclusiveStartMessageId and #p5.messages > 0 and var48:Get(p5.exclusiveStartMessageId) then
		var48 = var48:Insert(immutable.Set(var48:Get(p5.exclusiveStartMessageId), "previousMessageId", p5.messages[1].id))
	end
	local var49 = previewMessageId and (var48 and var48:Get(previewMessageId))
	local lastUpdated = var42.lastUpdated
	
	if var49 then
		lastUpdated = if (lastUpdated and lastUpdated:GetUnixTimestamp() or 0) < var49.sent:GetUnixTimestamp() then var49.sent else var42.lastUpdated
	end
	id = immutable.Set(immutable.JoinDictionaries(var42, {
		messages = var48,
		lastUpdated = lastUpdated,
		hasUnreadMessages = p5.shouldMarkConversationUnread or var42.hasUnreadMessages,
		nextCursor = p5.nextCursor,
		previousCursor = p5.previousCursor
	}), "usersTyping", {})
	
	return immutable.Set(p3, id.id, id)
end

local function updateMessageContentToDisplay(p6, p7, p8, p9) --[[ line: 186 ]]
	-- upvalues: immutable (ref)
	local var50 = p6[p7]
	
	if var50 then
		local var51 = var50.messages:Get(p8)
		
		if var51 then
			local messages = immutable.Set(var50, "messages", var50.messages:Insert(immutable.Set(var51, "contentToDisplay", p9)))
			
			return immutable.Set(p6, messages.id, messages)
		end
	end
	return p6
end

local function _(p10, p11) --[[ line: 206 | named "messagesFromResponse" ]]
	-- upvalues: functional (ref), messageModelModule (ref)
	if p11 then
		local var53 = nil
		
		return functional.MapReverse(p11, function(p12) --[[ line: 213 ]]
			-- upvalues: messageModelModule (copy), p10 (ref), var53 (write)
			local var54 = messageModelModule.fromWeb(p12, p10, var53)
			var53 = var54.id
			
			return var54
		end)
	end
	return {}
end

local function messagesFromResponseOfChannelsApi(p13, p14) --[[ line: 221 ]]
	-- upvalues: messageModelModule (ref)
	if not p14 then
		return {}
	end
	local id = nil
	local t = {}
	
	for i = #p14, 1, -1 do
		local var56 = messageModelModule.fromChannelsApi(p14[i], p13, id)
		
		if var56 then
			table.insert(t, var56)
			id = var56.id
		end
	end
	return t
end

local _ = function(p15) --[[ line: 243 | named "getMessagesFromConversationResponse" ]]
	return p15.messages or {}
end

local _ = function(p16) --[[ line: 249 | named "isMessageFromSelf" ]]
	-- upvalues: playersService (ref)
	return if if p16 then p16[#p16] else nil then true else false
end

local function getShouldMarkConversationUnread(p17, p18) --[[ line: 255 ]]
	-- upvalues: playersService (ref)
	if not p17 or not p17.messages or not p18 then
		return false
	end
	local var57 = p17.messages.values[p17.messages.keys[#p17.messages.keys]]
	local var58 = var57 and (var57.sent and (var57.sent:GetUnixTimestamp() or 0))
	
	for i = #p18, 1, -1 do
		local var59 = p18[i]
		
		if not var59 then
			continue
		end
		if var59.sent:GetUnixTimestamp() > var58 then
			if var59.senderTargetId == tostring(playersService.LocalPlayer.UserId) or not var59.isBadgeable then
				continue
			end
			return true
		end
		return false
	end
	return false
end

return roduxModule.createReducer({}, {
	[receivedConversationModule.name] = function(p19, p20) --[[ line: 292 ]]
		-- upvalues: updateConversationReducerModule (ref)
		return updateConversationReducerModule(p19, p20.conversation)
	end,
	[networkingChatModule.StartGroupConversation.Succeeded.name] = function(p21, p22) --[[ line: 295 ]]
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		return updateConversationReducerModule(p21, conversationModule.fromWeb(p22.responseBody.conversation))
	end,
	[networkingChatModule.StartOneToOneConversation.Succeeded.name] = function(p23, p24) --[[ line: 300 ]]
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		return updateConversationReducerModule(p23, conversationModule.fromWeb(p24.responseBody.conversation))
	end,
	[appChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p25, p26) --[[ line: 305 ]]
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref)
		local responseBody = p26.responseBody
		
		if responseBody and responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].status == "success") then
			p25 = updateConversationReducerModule(p25, conversationChannelsModule.fromChannelsApi(responseBody.conversations[1]))
		end
		return p25
	end,
	[appChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p27, p28) --[[ line: 319 ]]
		-- upvalues: conversationChannelsModule (ref), addConversationModule (ref)
		local responseBody = p28.responseBody
		
		if responseBody and responseBody.conversations and responseBody.conversations[1] then
			p27 = addConversationModule(p27, conversationChannelsModule.fromChannelsApi(responseBody.conversations[1]))
		end
		return p27
	end,
	[receivedMessages.name] = function(p29, p30) --[[ line: 328 ]]
		-- upvalues: addMessagesToConversation (ref)
		return addMessagesToConversation(p29, p30.conversationId, p30)
	end,
	[sendingMessage.name] = function(p31, p32) --[[ line: 331 ]]
		-- upvalues: orderedMap (ref), immutable (ref)
		local conversationId = p31[p32.conversationId]
		
		if conversationId then
			local sendingMessages = immutable.Set(conversationId, "sendingMessages", orderedMap.Insert(conversationId.sendingMessages, p32.message))
			p31 = immutable.Set(p31, sendingMessages.id, sendingMessages)
		end
		return p31
	end,
	[sentMessage.name] = function(p33, p34) --[[ line: 342 ]]
		-- upvalues: orderedMap (ref), immutable (ref)
		local conversationId = p33[p34.conversationId]
		
		if conversationId then
			local sendingMessages = immutable.Set(conversationId, "sendingMessages", orderedMap.Delete(conversationId.sendingMessages, p34.messageId))
			p33 = immutable.Set(p33, sendingMessages.id, sendingMessages)
		end
		return p33
	end,
	[renamedGroupConversationModule.name] = function(p35, p36) --[[ line: 353 ]]
		-- upvalues: immutable (ref)
		local conversationId = p36.conversationId
		local var62 = p35[conversationId]
		
		if var62 then
			p35 = immutable.Set(p35, conversationId, immutable.JoinDictionaries(var62, {
				lastUpdated = p36.lastUpdated,
				title = p36.title,
				isDefaultTitle = p36.isDefaultTitle
			}))
		end
		return p35
	end,
	[hasUnreadMessagesModule.name] = function(p37, p38) --[[ line: 368 ]]
		-- upvalues: immutable (ref)
		local id = p38.conversation and p37[p38.conversation.id]
		
		if id then
			p37 = immutable.Set(p37, p38.conversation.id, immutable.Set(id, "hasUnreadMessages", true))
		end
		return p37
	end,
	[changedParticipantsModule.name] = function(p39, p40) --[[ line: 377 ]]
		-- upvalues: immutable (ref)
		local conversationId = p40.conversationId
		local participants = p40.participants
		local var64 = p39[conversationId]
		
		if var64 then
			p39 = immutable.Set(p39, conversationId, immutable.JoinDictionaries(var64, {
				participants = participants,
				lastUpdated = p40.lastUpdated,
				title = p40.title
			}))
		end
		return p39
	end,
	[removedConversationModule.name] = function(p41, p42) --[[ line: 393 ]]
		-- upvalues: immutable (ref)
		return immutable.Set(p41, p42.conversationId, nil)
	end,
	[setUserTypingModule.name] = function(p43, p44) --[[ line: 397 ]]
		-- upvalues: immutable (ref)
		local conversationId = p43[p44.conversationId]
		
		if conversationId then
			local usersTyping = immutable.Set(conversationId, "usersTyping", immutable.Set(conversationId.usersTyping, p44.userId, p44.value))
			p43 = immutable.Set(p43, usersTyping.id, usersTyping)
		end
		return p43
	end,
	[fetchingOlderMessagesModule.name] = function(p45, p46) --[[ line: 408 ]]
		-- upvalues: immutable (ref)
		local conversationId = p45[p46.conversationId]
		
		if conversationId then
			local fetchingOlderMessages = immutable.Set(conversationId, "fetchingOlderMessages", p46.fetchingOlderMessages)
			p45 = immutable.Set(p45, fetchingOlderMessages.id, fetchingOlderMessages)
		end
		return p45
	end,
	[fetchedOldestMessageModule.name] = function(p47, p48) --[[ line: 417 ]]
		-- upvalues: immutable (ref)
		local conversationId = p47[p48.conversationId]
		
		if conversationId then
			local fetchedOldestMessage = immutable.Set(conversationId, "fetchedOldestMessage", p48.fetchedOldestMessage)
			
			return immutable.Set(p47, fetchedOldestMessage.id, fetchedOldestMessage)
		end
		return p47
	end,
	[readConversationModule.name] = function(p49, p50) --[[ line: 426 ]]
		-- upvalues: markConversationAndMessagesAsRead (ref)
		return markConversationAndMessagesAsRead(p49, p50.conversationId)
	end,
	[messageModerated.name] = function(p51, p52) --[[ line: 429 ]]
		-- upvalues: immutable (ref)
		local conversationId = p51[p52.conversationId]
		
		if conversationId then
			local messageId = conversationId.sendingMessages:Get(p52.messageId)
			
			if messageId then
				local sendingMessages = immutable.Set(conversationId, "sendingMessages", conversationId.sendingMessages:Insert(immutable.Set(messageId, "moderated", true)))
				p51 = immutable.Set(p51, sendingMessages.id, sendingMessages)
			end
		end
		return p51
	end,
	[messageFailedToSend.name] = function(p53, p54) --[[ line: 443 ]]
		-- upvalues: immutable (ref)
		local conversationId = p53[p54.conversationId]
		
		if conversationId then
			local messageId = conversationId.sendingMessages:Get(p54.messageId)
			
			if messageId then
				local sendingMessages = immutable.Set(conversationId, "sendingMessages", conversationId.sendingMessages:Insert(immutable.Set(messageId, "failed", true)))
				p53 = immutable.Set(p53, sendingMessages.id, sendingMessages)
			end
		end
		return p53
	end,
	[setConversationLoadingStatusModule.name] = function(p55, p56) --[[ line: 457 ]]
		-- upvalues: immutable (ref)
		local conversationId = p55[p56.conversationId]
		
		if conversationId then
			local initialLoadingStatus = immutable.Set(conversationId, "initialLoadingStatus", p56.value)
			
			return immutable.Set(p55, initialLoadingStatus.id, initialLoadingStatus)
		end
		return p55
	end,
	[setUserLeavingConversationModule.name] = function(p57, p58) --[[ line: 466 ]]
		-- upvalues: immutable (ref)
		local id = p57[p58.id]
		
		if id then
			local isUserLeaving = immutable.Set(id, "isUserLeaving", p58.isLeaving)
			p57 = immutable.Set(p57, isUserLeaving.id, isUserLeaving)
		end
		return p57
	end,
	[setPinnedGameForConversationModule.name] = function(p59, p60) --[[ line: 474 ]]
		-- upvalues: immutable (ref)
		local conversationId = p60.conversationId
		local var74 = p59[conversationId]
		
		if var74 then
			p59 = immutable.Set(p59, conversationId, immutable.JoinDictionaries(var74, {
				pinnedGame = {
					rootPlaceId = p60.rootPlaceId,
					universeId = p60.universeId
				}
			}))
		end
		return p59
	end,
	[networkingChatModule.GetUserConversations.Succeeded.name] = function(p61, p62) --[[ line: 492 ]]
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		for i, v in ipairs(p62.responseBody) do
			p61 = updateConversationReducerModule(p61, conversationModule.fromWeb(v))
		end
		return p61
	end,
	[appChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p63, p64) --[[ line: 501 ]]
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref), luauPolyfillModule (ref), messageModelModule (ref), addMessagesToConversation (ref)
		local responseBody = p64.responseBody
		
		if responseBody and responseBody.conversations then
			for i, v in responseBody.conversations do
				local var75 = conversationChannelsModule.fromChannelsApi(v)
				p63 = updateConversationReducerModule(p63, var75)
				local messages = v.messages or {}
				
				if messages and #messages > 0 then
					p63 = addMessagesToConversation(p63, var75.id, {
						messages = luauPolyfillModule.Array.map(messages, function(p65) --[[ line: 511 ]]
							-- upvalues: messageModelModule (copy), var75 (ref)
							return messageModelModule.fromChannelsApi(p65, var75.id)
						end)
					})
				end
			end
		end
		return p63
	end,
	[networkingChatModule.GetConversations.Succeeded.name] = function(p66, p67) --[[ line: 526 ]]
		-- upvalues: conversationModule (ref), updateConversationReducerModule (ref)
		for i, v in ipairs(p67.responseBody) do
			p66 = updateConversationReducerModule(p66, conversationModule.fromWeb(v))
		end
		return p66
	end,
	[appChatNetworkingModule.rodux.GetOlderMessages.Succeeded.name] = function(p68, p69) --[[ line: 535 ]]
		-- upvalues: messagesFromResponseOfChannelsApi (ref), addMessagesToConversation (ref), immutable (ref)
		local conversationId = p69.queryArgs.conversation_id
		local responseBody = p69.responseBody
		local _ = {}
		local var77 = p68[conversationId]
		
		if not var77 then
			return p68
		end
		assert(var77, "FFlagLuauTinyControlFlowAnalysis")
		local previousCursor = var77.previousCursor or nil
		local nextCursor = var77.nextCursor or nil
		
		if not responseBody then
			return p68
		end
		local var80 = messagesFromResponseOfChannelsApi(conversationId, responseBody.messages)
		local var81 = if responseBody.next_cursor == "" then nil else responseBody.next_cursor
		
		if var81 then
			nextCursor = var81
		end
		if previousCursor == nil then
			previousCursor = if responseBody.previous_cursor == "" then nil else responseBody.previous_cursor
		end
		p68 = addMessagesToConversation(p68, conversationId, {
			messages = var80,
			nextCursor = nextCursor,
			previousCursor = previousCursor
		})
		
		if not var81 then
			local var82 = p68[conversationId]
			
			if var82 then
				local fetchedOldestMessage = immutable.Set(var82, "fetchedOldestMessage", true)
				p68 = immutable.Set(p68, fetchedOldestMessage.id, fetchedOldestMessage)
			end
		end
		return p68
	end,
	[appChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p70, p71) --[[ line: 588 ]]
		-- upvalues: messagesFromResponseOfChannelsApi (ref), getShouldMarkConversationUnread (ref), addMessagesToConversation (ref)
		local conversationId = p71.queryArgs.conversation_id
		local responseBody = p71.responseBody
		local var84 = p70[conversationId]
		
		if not var84 then
			return p70
		end
		assert(var84, "FFlagLuauTinyControlFlowAnalysis")
		local previousCursor = var84.previousCursor or nil
		local nextCursor = var84.nextCursor or nil
		
		if not responseBody then
			return p70
		end
		local var87 = messagesFromResponseOfChannelsApi(conversationId, responseBody.messages)
		
		if nextCursor == nil then
			nextCursor = if responseBody.next_cursor == "" then nil else responseBody.next_cursor
		end
		local var88 = if responseBody.previous_cursor == "" then nil else responseBody.previous_cursor
		
		if var88 then
			previousCursor = var88
		end
		return addMessagesToConversation(p70, conversationId, {
			messages = var87,
			nextCursor = nextCursor,
			previousCursor = previousCursor,
			shouldMarkConversationUnread = getShouldMarkConversationUnread(var84, var87)
		})
	end,
	[networkingChatModule.GetMessages.Succeeded.name] = function(p72, p73) --[[ line: 630 ]]
		-- upvalues: functional (ref), messageModelModule (ref), playersService (ref), addMessagesToConversation (ref), immutable (ref)
		local t, pageSize
		local conversationId = p73.queryArgs.conversationId
		local responseBody = p73.responseBody
		
		if responseBody then
			pageSize = nil
			t = functional.MapReverse(responseBody, function(p74) --[[ line: 213 ]]
				-- upvalues: messageModelModule (copy), conversationId (ref), pageSize (write)
				local var54 = messageModelModule.fromWeb(p74, conversationId, pageSize)
				var53 = var54.id
				
				return var54
			end)
		else
			t = {}
		end
		p72 = addMessagesToConversation(p72, conversationId, {
			messages = t,
			shouldMarkConversationUnread = not (if if t then t[#t] else nil then true else false)
		})
		pageSize = p73.queryArgs.pageSize
		
		if pageSize and #t < pageSize then
			local var90 = p72[conversationId]
			
			if not var90 then
				return p72
			end
			assert(var90, "FFlagLuauTinyControlFlowAnalysis")
			local var91 = p72[conversationId]
			
			if var91 then
				local fetchedOldestMessage = immutable.Set(var91, "fetchedOldestMessage", true)
				p72 = immutable.Set(p72, fetchedOldestMessage.id, fetchedOldestMessage)
			end
		end
		return p72
	end,
	[networkingChatModule.GetLatestMessages.Succeeded.name] = function(p75, p76) --[[ line: 656 ]]
		-- upvalues: functional (ref), messageModelModule (ref), addMessagesToConversation (ref)
		for i, v in ipairs(p76.responseBody) do
			local t
			local var93 = tostring(v.conversationId)
			local chatMessages = v.chatMessages
			
			if chatMessages then
				local var95 = nil
				t = functional.MapReverse(chatMessages, function(p77) --[[ line: 213 ]]
					-- upvalues: messageModelModule (copy), var93 (ref), var95 (write)
					local var54 = messageModelModule.fromWeb(p77, var93, var95)
					var53 = var54.id
					
					return var54
				end)
			else
				t = {}
			end
			p75 = addMessagesToConversation(p75, var93, { messages = t })
		end
		return p75
	end,
	[appChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = function(p78, p79) --[[ line: 668 ]]
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref), luauPolyfillModule (ref), messageModelModule (ref), addMessagesToConversation (ref)
		local var96 = p79.responseBody.conversations[1]
		
		if not var96 then
			return p78
		end
		local var97 = conversationChannelsModule.fromChannelsApi(var96)
		p78 = updateConversationReducerModule(p78, var97)
		local messages = var96.messages or {}
		
		if messages and #messages > 0 then
			p78 = addMessagesToConversation(p78, var97.id, {
				messages = luauPolyfillModule.Array.map(messages, function(p80) --[[ line: 682 ]]
					-- upvalues: messageModelModule (copy), var97 (ref)
					return messageModelModule.fromChannelsApi(p80, var97.id)
				end)
			})
		end
		return p78
	end,
	[appChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = function(p81, p82) --[[ line: 695 ]]
		-- upvalues: conversationChannelsModule (ref), updateConversationReducerModule (ref), luauPolyfillModule (ref), messageModelModule (ref), addMessagesToConversation (ref)
		local responseBody = p82.responseBody
		
		if not responseBody or not responseBody.conversations then
			return p81
		end
		for i, v in responseBody.conversations do
			local var99 = conversationChannelsModule.fromChannelsApi(v)
			p81 = updateConversationReducerModule(p81, var99)
			local messages = v.messages or {}
			
			if messages and #messages > 0 then
				p81 = addMessagesToConversation(p81, var99.id, {
					messages = luauPolyfillModule.Array.map(messages, function(p83) --[[ line: 707 ]]
						-- upvalues: messageModelModule (copy), var99 (ref)
						return messageModelModule.fromChannelsApi(p83, var99.id)
					end)
				})
			end
		end
		return p81
	end,
	[appChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p84, p85) --[[ line: 720 ]]
		-- upvalues: markConversationAndMessagesAsRead (ref)
		return markConversationAndMessagesAsRead(p84, p85.postBody.conversation_ids[1])
	end,
	[networkingChatModule.MarkAsRead.Succeeded.name] = function(p86, p87) --[[ line: 724 ]]
		-- upvalues: markConversationAndMessagesAsRead (ref)
		return markConversationAndMessagesAsRead(p86, p87.postBody.conversationId)
	end,
	[appChatNetworkingModule.rodux.TranslateUserMessage.Succeeded.name] = if getFFlagAppChatEnableManualTranslationModule() then function(p88, p89) --[[ line: 729 ]]
		-- upvalues: updateMessageContentToDisplay (ref)
		return if p89.postBody.conversation_id and p89.postBody.message_id then updateMessageContentToDisplay(p88, p89.postBody.conversation_id, p89.postBody.message_id, p89.responseBody.content_to_display) else p88
	end else nil,
	[receivedChannelsMigrationConflictModule.name] = function(_, _) --[[ line: 745 ]]
		return {}
	end,
	[friendConversationCreatedModule.name] = function(p90, p91) --[[ line: 748 ]]
		-- upvalues: immutable (ref)
		return if p90[p91.oldFriendConversationId] then immutable.Set(p90, p91.oldFriendConversationId, nil) else p90
	end,
	[friendshipDestroyedModule.name] = function(p92, p93) --[[ line: 755 ]]
		-- upvalues: conversationChannelsModule (ref), immutable (ref)
		local var101 = if p93.userId1 ~= "localUserId" then if p93.userId2 ~= "localUserId" then nil else p93.userId2 else p93.userId1
		
		if not var101 then
			return p92
		end
		assert(var101, "FFlagLuauTinyControlFlowAnalysis")
		local friendConversationId = conversationChannelsModule.getFriendConversationId({ var101 })
		
		return if p92[friendConversationId] then immutable.Set(p92, friendConversationId, nil) else p92
	end,
	[networkingBlockingModule.BlockUserById.Succeeded.name] = if getFFlagAppChatPCMFixBlocking() then function(p94, p95) --[[ line: 773 ]]
		-- upvalues: getOneToOneConversationIdFromFriendIdModule (ref), immutable (ref), conversationChannelsModule (ref)
		local var103 = tostring(p95.namedIds.users)
		
		if not var103 then
			return p94
		end
		local var104 = getOneToOneConversationIdFromFriendIdModule(p94, var103)
		local var105 = p94
		
		if var104 and p94[var104] then
			var105 = immutable.Set(var105, var104, nil)
		end
		local friendConversationId = conversationChannelsModule.getFriendConversationId({ var103 })
		
		if friendConversationId and p94[friendConversationId] then
			var105 = immutable.Set(p94, friendConversationId, nil)
		end
		return var105
	end else nil,
	[reloadedMessagesForConversationsModule.name] = function(p96, p97) --[[ line: 796 ]]
		-- upvalues: cryoModule (ref), conversationChannelsModule (ref)
		local var107 = p96
		
		for i, v in p97.conversationIds do
			var107 = cryoModule.Dictionary.join(var107, {
				[v] = cryoModule.Dictionary.join(var107[v], {
					fetchedOldestMessage = false,
					messages = conversationChannelsModule.getEmptyMessages(),
					sendingMessages = conversationChannelsModule.getEmptySendingMessages(),
					previousCursor = cryoModule.None,
					nextCursor = cryoModule.None
				})
			})
		end
		return var107
	end,
	[conversationModerationTypeChangedModule.name] = if fFlagAppChatEnableDoubleOptIn then function(p98, p99) --[[ line: 816 ]]
		-- upvalues: immutable (ref)
		local conversationId = p99.conversationId
		local var108 = p98[conversationId]
		
		return if var108 then immutable.Set(p98, conversationId, immutable.Set(var108, "moderationType", p99.moderationType)) else p98
	end else nil,
	[appChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p100, p101) --[[ line: 827 ]]
		-- upvalues: constantsModule (ref), t (ref), conversationChannelsModule (ref), immutable (ref)
		local postBody = p101.postBody
		
		if postBody.action_type ~= constantsModule.ModalAction.Accept then
			return p100
		end
		local modalVariant = t[postBody.modal_variant]
		
		if not modalVariant then
			return p100
		end
		local conversationId = postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ postBody.friend_id })
		local var110 = conversationId and p100[conversationId]
		
		return if var110 then immutable.Set(p100, conversationId, immutable.Set(var110, modalVariant.field, modalVariant.value)) else p100
	end
})