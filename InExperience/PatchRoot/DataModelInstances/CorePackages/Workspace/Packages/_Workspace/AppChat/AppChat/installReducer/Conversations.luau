local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ConversationsModule = require(AppChat.Conversations)
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local Immutable = require(Parent.AppCommonLib).Immutable
local OrderedMap = require(Parent.AppCommonLib).OrderedMap
local Functional = require(Parent.AppCommonLib).Functional
local MessageModelModule = require(AppChat.Models.MessageModel)
local CryoModule = require(Parent.Cryo)
local AddConversationModule = require(AppChat.Utils.addConversation)
local GetFFlagAppChatPCMFixBlockingFunction = require(Parent.SharedFlags).getFFlagAppChatPCMFixBlocking
local UpdateConversationReducerModule = require(script.Parent.updateConversationReducer)
local GetOneToOneConversationIdFromFriendIdModule = require(AppChat.Utils.getOneToOneConversationIdFromFriendId)
local GetFFlagAppChatEnableManualTranslationModule = require(AppChat.Flags.getFFlagAppChatEnableManualTranslation)
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local ConstantsModule = require(AppChat.Constants)
local config = {
	[ConstantsModule.OptInVariant.OsaContextCard] = {
		field = "osaAcknowledgementStatus",
		value = ConversationChannelsModule.OsaAcknowledgementStatus.Acknowledged
	},
	[ConstantsModule.OptInVariant.ChatOptInInfoCard] = if require(Parent.SharedFlags).FFlagAppChatEnableU13ChatOptIn then {
		field = "userOptedIntoChatMessages",
		value = ConversationChannelsModule.UserOptedIntoChatMessagesStatus.OptedIn
	} else nil
}

local function markConversationAndMessagesAsRead(p1, ConversationId) --[[ Line: 76 ]]
	-- upvalues: Immutable (copy)
	local v1 = p1[ConversationId]
	
	if v1 then
		assert(v1, "FFlagLuauTinyControlFlowAnalysis")
		local HasUnreadMessages = Immutable.Set(Immutable.Set(v1, "messages", (v1.messages:Map(function(p2) --[[ Line: 85 ]]
			-- upvalues: Immutable (upval)
			return if p2.read then p2 else Immutable.Set(p2, "read", true)
		end))), "hasUnreadMessages", false)
		
		return (Immutable.Set(p1, HasUnreadMessages.id, HasUnreadMessages))
	else
		warn("Conversation " .. ConversationId .. " not found in ReadConversation reducer")
		
		return p1
	end
end

local function addMessagesToConversation(p1, ConversationId, p2) --[[ Line: 101 ]]
	-- upvalues: Immutable (copy), OrderedMap (copy)
	local v1 = p1[ConversationId]
	
	if not v1 then
		return p1
	end
	local v2 = nil
	local PreviewMessageId = v1.previewMessageId
	local UnixTimestamp = 0
	
	if PreviewMessageId and v1.messages then
		local GetResult = v1.messages:Get(PreviewMessageId)
		
		if GetResult then
			UnixTimestamp = GetResult.sent:GetUnixTimestamp()
		end
	end
	for i = 1, #p2.messages do
		local Message = p2.messages[i]
		local GetResult = v1.messages:Get(Message.id)
		
		if GetResult then
			if v2 then
				v2.previousMessageId = GetResult.id
			end
			if Message.previousMessageId == nil and GetResult.previousMessageId ~= nil then
				Message.previousMessageId = GetResult.previousMessageId
			end
			Message.read = Message.read or GetResult.read
		elseif Message.isPreviewable and UnixTimestamp < Message.sent:GetUnixTimestamp() then
			PreviewMessageId = Message.id
			UnixTimestamp = Message.sent:GetUnixTimestamp()
		end
		v2 = Message
	end
	local JoinDictionariesResult = Immutable.JoinDictionaries(v1, { previewMessageId = PreviewMessageId })
	local InsertResult = OrderedMap.Insert(JoinDictionariesResult.messages, unpack(p2.messages))
	
	if p2.exclusiveStartMessageId and #p2.messages > 0 and InsertResult:Get(p2.exclusiveStartMessageId) then
		InsertResult = InsertResult:Insert((Immutable.Set(InsertResult:Get(p2.exclusiveStartMessageId), "previousMessageId", p2.messages[1].id)))
	end
	local GetResult = PreviewMessageId and (InsertResult and InsertResult:Get(PreviewMessageId))
	local LastUpdated = JoinDictionariesResult.lastUpdated
	
	if GetResult then
		LastUpdated = (LastUpdated and LastUpdated:GetUnixTimestamp() or 0) < GetResult.sent:GetUnixTimestamp() and GetResult.sent or JoinDictionariesResult.lastUpdated
	end
	local UsersTyping = Immutable.Set(Immutable.JoinDictionaries(JoinDictionariesResult, {
		messages = InsertResult,
		lastUpdated = LastUpdated,
		hasUnreadMessages = p2.shouldMarkConversationUnread or JoinDictionariesResult.hasUnreadMessages,
		nextCursor = p2.nextCursor,
		previousCursor = p2.previousCursor
	}), "usersTyping", {})
	
	return Immutable.Set(p1, UsersTyping.id, UsersTyping)
end

local function updateMessageContentToDisplay(p3, ConversationId, MessageId, ContentToDisplay) --[[ Line: 186 ]]
	-- upvalues: Immutable (copy)
	local v3 = p3[ConversationId]
	
	if v3 then
		local GetResult = v3.messages:Get(MessageId)
		
		if GetResult then
			local Messages = Immutable.Set(v3, "messages", (v3.messages:Insert((Immutable.Set(GetResult, "contentToDisplay", ContentToDisplay)))))
			
			return Immutable.Set(p3, Messages.id, Messages)
		end
	end
	return p3
end

local function _(p3, p4) --[[ Line: 206 | Named "messagesFromResponse" ]]
	-- upvalues: Functional (copy), MessageModelModule (copy)
	if p4 then
		local Id = nil
		
		return (Functional.MapReverse(p4, function(p5) --[[ Line: 213 ]]
			-- upvalues: MessageModelModule (upval), p3 (copy), Id (ref)
			local FromWebResult = MessageModelModule.fromWeb(p5, p3, Id)
			Id = FromWebResult.id
			
			return FromWebResult
		end))
	else
		return {}
	end
end

local function messagesFromResponseOfChannelsApi(ConversationId, Messages) --[[ Line: 221 ]]
	-- upvalues: MessageModelModule (copy)
	if not Messages then
		return {}
	end
	local Id = nil
	local FromChannelsApiResults = {}
	
	for i = #Messages, 1, -1 do
		local FromChannelsApiResult = MessageModelModule.fromChannelsApi(Messages[i], ConversationId, Id)
		
		if FromChannelsApiResult then
			table.insert(FromChannelsApiResults, FromChannelsApiResult)
			Id = FromChannelsApiResult.id
		end
	end
	return FromChannelsApiResults
end

local _ = function(p3) --[[ Line: 243 | Named "getMessagesFromConversationResponse" ]]
	return p3.messages or {}
end

local _ = function(p3): boolean --[[ Line: 249 | Named "isMessageFromSelf" ]]
	-- upvalues: Players (copy)
	local v3 = p3 and p3[#p3] or nil
	
	return if v3 then v3.senderTargetId == tostring(Players.LocalPlayer.UserId) else false
end

local function getShouldMarkConversationUnread(p3, Messages): boolean --[[ Line: 255 ]]
	-- upvalues: Players (copy)
	if not p3 or not p3.messages or not Messages then
		return false
	end
	local Value = p3.messages.values[p3.messages.keys[#p3.messages.keys]]
	local UnixTimestamp = Value and Value.sent and Value.sent:GetUnixTimestamp() or 0
	for i = #Messages, 1, -1 do
		local Message = Messages[i]
		
		if Message then
			if Message.sent:GetUnixTimestamp() <= UnixTimestamp then
				return false
			end
			if Message.senderTargetId ~= tostring(Players.LocalPlayer.UserId) and Message.isBadgeable then
				return true
			end
		end
	end
	return false
end

return require(Parent.Rodux).createReducer({}, {
	[require(AppChat.Conversations.Actions.ReceivedConversation).name] = function(p4, p5) --[[ Line: 292 ]]
		-- upvalues: UpdateConversationReducerModule (copy)
		return UpdateConversationReducerModule(p4, p5.conversation)
	end,
	[NetworkingChatModule.StartGroupConversation.Succeeded.name] = function(p4, p5) --[[ Line: 295 ]]
		-- upvalues: ConversationModule (copy), UpdateConversationReducerModule (copy)
		return UpdateConversationReducerModule(p4, (ConversationModule.fromWeb(p5.responseBody.conversation)))
	end,
	[NetworkingChatModule.StartOneToOneConversation.Succeeded.name] = function(p4, p5) --[[ Line: 300 ]]
		-- upvalues: ConversationModule (copy), UpdateConversationReducerModule (copy)
		return UpdateConversationReducerModule(p4, (ConversationModule.fromWeb(p5.responseBody.conversation)))
	end,
	[AppChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p4, p5) --[[ Line: 305 ]]
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy)
		local ResponseBody = p5.responseBody
		
		if ResponseBody and ResponseBody.conversations and ResponseBody.conversations[1] and ResponseBody.conversations[1].status == "success" then
			p4 = UpdateConversationReducerModule(p4, (ConversationChannelsModule.fromChannelsApi(ResponseBody.conversations[1])))
		end
		return p4
	end,
	[AppChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p4, p5) --[[ Line: 319 ]]
		-- upvalues: ConversationChannelsModule (copy), AddConversationModule (copy)
		local ResponseBody = p5.responseBody
		
		if ResponseBody and ResponseBody.conversations and ResponseBody.conversations[1] then
			p4 = AddConversationModule(p4, (ConversationChannelsModule.fromChannelsApi(ResponseBody.conversations[1])))
		end
		return p4
	end,
	[ConversationsModule.Actions.ReceivedMessages.name] = function(p4, p5) --[[ Line: 328 ]]
		-- upvalues: addMessagesToConversation (copy)
		return addMessagesToConversation(p4, p5.conversationId, p5)
	end,
	[ConversationsModule.Actions.SendingMessage.name] = function(p4, p5) --[[ Line: 331 ]]
		-- upvalues: OrderedMap (copy), Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local SendingMessages = Immutable.Set(v3, "sendingMessages", (OrderedMap.Insert(v3.sendingMessages, p5.message)))
			p4 = Immutable.Set(p4, SendingMessages.id, SendingMessages)
		end
		return p4
	end,
	[ConversationsModule.Actions.SentMessage.name] = function(p4, p5) --[[ Line: 342 ]]
		-- upvalues: OrderedMap (copy), Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local SendingMessages = Immutable.Set(v3, "sendingMessages", (OrderedMap.Delete(v3.sendingMessages, p5.messageId)))
			p4 = Immutable.Set(p4, SendingMessages.id, SendingMessages)
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.RenamedGroupConversation).name] = function(p4, p5) --[[ Line: 353 ]]
		-- upvalues: Immutable (copy)
		local ConversationId = p5.conversationId
		local v3 = p4[ConversationId]
		
		if v3 then
			p4 = Immutable.Set(p4, ConversationId, (Immutable.JoinDictionaries(v3, {
				lastUpdated = p5.lastUpdated,
				title = p5.title,
				isDefaultTitle = p5.isDefaultTitle
			})))
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.HasUnreadMessages).name] = function(p4, p5) --[[ Line: 368 ]]
		-- upvalues: Immutable (copy)
		local v3 = p5.conversation and p4[p5.conversation.id]
		
		if v3 then
			p4 = Immutable.Set(p4, p5.conversation.id, (Immutable.Set(v3, "hasUnreadMessages", true)))
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.ChangedParticipants).name] = function(p4, p5) --[[ Line: 377 ]]
		-- upvalues: Immutable (copy)
		local ConversationId = p5.conversationId
		local Participants = p5.participants
		local v3 = p4[ConversationId]
		
		if v3 then
			p4 = Immutable.Set(p4, ConversationId, (Immutable.JoinDictionaries(v3, {
				participants = Participants,
				lastUpdated = p5.lastUpdated,
				title = p5.title
			})))
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p4, p5) --[[ Line: 393 ]]
		-- upvalues: Immutable (copy)
		return Immutable.Set(p4, p5.conversationId, nil)
	end,
	[require(AppChat.Conversations.Actions.SetUserTyping).name] = function(p4, p5) --[[ Line: 397 ]]
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local UsersTyping = Immutable.Set(v3, "usersTyping", (Immutable.Set(v3.usersTyping, p5.userId, p5.value)))
			p4 = Immutable.Set(p4, UsersTyping.id, UsersTyping)
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.FetchingOlderMessages).name] = function(p4, p5) --[[ Line: 408 ]]
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local FetchingOlderMessages = Immutable.Set(v3, "fetchingOlderMessages", p5.fetchingOlderMessages)
			p4 = Immutable.Set(p4, FetchingOlderMessages.id, FetchingOlderMessages)
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.FetchedOldestMessage).name] = function(p4, p5) --[[ Line: 417 ]]
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local FetchedOldestMessage = Immutable.Set(v3, "fetchedOldestMessage", p5.fetchedOldestMessage)
			
			return Immutable.Set(p4, FetchedOldestMessage.id, FetchedOldestMessage)
		else
			return p4
		end
	end,
	[require(AppChat.Conversations.Actions.ReadConversation).name] = function(p4, p5) --[[ Line: 426 ]]
		-- upvalues: markConversationAndMessagesAsRead (copy)
		return (markConversationAndMessagesAsRead(p4, p5.conversationId))
	end,
	[ConversationsModule.Actions.MessageModerated.name] = function(p4, p5) --[[ Line: 429 ]]
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local GetResult = v3.sendingMessages:Get(p5.messageId)
			
			if GetResult then
				local SendingMessages = Immutable.Set(v3, "sendingMessages", (v3.sendingMessages:Insert((Immutable.Set(GetResult, "moderated", true)))))
				p4 = Immutable.Set(p4, SendingMessages.id, SendingMessages)
			end
		end
		return p4
	end,
	[ConversationsModule.Actions.MessageFailedToSend.name] = function(p4, p5) --[[ Line: 443 ]]
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local GetResult = v3.sendingMessages:Get(p5.messageId)
			
			if GetResult then
				local SendingMessages = Immutable.Set(v3, "sendingMessages", (v3.sendingMessages:Insert((Immutable.Set(GetResult, "failed", true)))))
				p4 = Immutable.Set(p4, SendingMessages.id, SendingMessages)
			end
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.SetConversationLoadingStatus).name] = function(p4, p5) --[[ Line: 457 ]]
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local InitialLoadingStatus = Immutable.Set(v3, "initialLoadingStatus", p5.value)
			
			return Immutable.Set(p4, InitialLoadingStatus.id, InitialLoadingStatus)
		else
			return p4
		end
	end,
	[require(AppChat.Conversations.Actions.SetUserLeavingConversation).name] = function(p4, p5) --[[ Line: 466 ]]
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.id]
		
		if v3 then
			local IsUserLeaving = Immutable.Set(v3, "isUserLeaving", p5.isLeaving)
			p4 = Immutable.Set(p4, IsUserLeaving.id, IsUserLeaving)
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.SetPinnedGameForConversation).name] = function(p4, p5) --[[ Line: 474 ]]
		-- upvalues: Immutable (copy)
		local ConversationId = p5.conversationId
		local v3 = p4[ConversationId]
		
		if v3 then
			p4 = Immutable.Set(p4, ConversationId, (Immutable.JoinDictionaries(v3, {
				pinnedGame = {
					rootPlaceId = p5.rootPlaceId,
					universeId = p5.universeId
				}
			})))
		end
		return p4
	end,
	[NetworkingChatModule.GetUserConversations.Succeeded.name] = function(p4, p5) --[[ Line: 492 ]]
		-- upvalues: ConversationModule (copy), UpdateConversationReducerModule (copy)
		for _, value in ipairs(p5.responseBody) do
			p4 = UpdateConversationReducerModule(p4, (ConversationModule.fromWeb(value)))
		end
		return p4
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p6, p7) --[[ Line: 501 ]]
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy), LuauPolyfillModule (copy), MessageModelModule (copy), addMessagesToConversation (copy)
		local ResponseBody = p7.responseBody
		
		if ResponseBody and ResponseBody.conversations then
			for _, conversation in ResponseBody.conversations do
				local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(conversation)
				p6 = UpdateConversationReducerModule(p6, FromChannelsApiResult)
				local Messages = conversation.messages or {}
				
				if Messages and #Messages > 0 then
					p6 = addMessagesToConversation(p6, FromChannelsApiResult.id, {
						messages = LuauPolyfillModule.Array.map(Messages, function(p8) --[[ Line: 511 ]]
							-- upvalues: MessageModelModule (upval), FromChannelsApiResult (copy)
							return MessageModelModule.fromChannelsApi(p8, FromChannelsApiResult.id)
						end)
					})
				end
			end
		end
		return p6
	end,
	[NetworkingChatModule.GetConversations.Succeeded.name] = function(p8, p9) --[[ Line: 526 ]]
		-- upvalues: ConversationModule (copy), UpdateConversationReducerModule (copy)
		for _, value in ipairs(p9.responseBody) do
			p8 = UpdateConversationReducerModule(p8, (ConversationModule.fromWeb(value)))
		end
		return p8
	end,
	[AppChatNetworkingModule.rodux.GetOlderMessages.Succeeded.name] = function(p10, p11) --[[ Line: 535 ]]
		-- upvalues: messagesFromResponseOfChannelsApi (copy), addMessagesToConversation (copy), Immutable (copy)
		local ConversationId = p11.queryArgs.conversation_id
		local ResponseBody = p11.responseBody
		local v3 = p10[ConversationId]
		
		if not v3 then
			return p10
		end
		assert(v3, "FFlagLuauTinyControlFlowAnalysis")
		local PreviousCursor = v3.previousCursor or nil
		local NextCursor = v3.nextCursor or nil
		
		if not ResponseBody then
			return p10
		end
		local MessagesFromResponseOfChannelsApiResult = messagesFromResponseOfChannelsApi(ConversationId, ResponseBody.messages)
		local NextCursor1 = if ResponseBody.next_cursor == "" then nil else ResponseBody.next_cursor
		
		if NextCursor1 then
			NextCursor = NextCursor1
		end
		if PreviousCursor == nil then
			PreviousCursor = if ResponseBody.previous_cursor == "" then nil else ResponseBody.previous_cursor
		end
		local AddMessagesToConversationResult = addMessagesToConversation(p10, ConversationId, {
			messages = MessagesFromResponseOfChannelsApiResult,
			nextCursor = NextCursor,
			previousCursor = PreviousCursor
		})
		
		if not NextCursor1 then
			local AddMessagesToConversationResultEntry = AddMessagesToConversationResult[ConversationId]
			
			if AddMessagesToConversationResultEntry then
				local FetchedOldestMessage = Immutable.Set(AddMessagesToConversationResultEntry, "fetchedOldestMessage", true)
				AddMessagesToConversationResult = Immutable.Set(AddMessagesToConversationResult, FetchedOldestMessage.id, FetchedOldestMessage)
			end
		end
		return AddMessagesToConversationResult
	end,
	[AppChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p10, p11) --[[ Line: 588 ]]
		-- upvalues: messagesFromResponseOfChannelsApi (copy), getShouldMarkConversationUnread (copy), addMessagesToConversation (copy)
		local ConversationId = p11.queryArgs.conversation_id
		local ResponseBody = p11.responseBody
		local v3 = p10[ConversationId]
		
		if not v3 then
			return p10
		end
		assert(v3, "FFlagLuauTinyControlFlowAnalysis")
		local PreviousCursor = v3.previousCursor or nil
		local NextCursor = v3.nextCursor or nil
		
		if not ResponseBody then
			return p10
		end
		local MessagesFromResponseOfChannelsApiResult = messagesFromResponseOfChannelsApi(ConversationId, ResponseBody.messages)
		
		if NextCursor == nil then
			NextCursor = if ResponseBody.next_cursor == "" then nil else ResponseBody.next_cursor
		end
		local PreviousCursor1 = if ResponseBody.previous_cursor == "" then nil else ResponseBody.previous_cursor
		
		if PreviousCursor1 then
			PreviousCursor = PreviousCursor1
		end
		return (addMessagesToConversation(p10, ConversationId, {
			messages = MessagesFromResponseOfChannelsApiResult,
			nextCursor = NextCursor,
			previousCursor = PreviousCursor,
			shouldMarkConversationUnread = getShouldMarkConversationUnread(v3, MessagesFromResponseOfChannelsApiResult)
		}))
	end,
	[NetworkingChatModule.GetMessages.Succeeded.name] = function(p10, p11) --[[ Line: 630 ]]
		-- upvalues: Functional (copy), MessageModelModule (copy), Players (copy), addMessagesToConversation (copy), Immutable (copy)
		local ConversationId = p11.queryArgs.conversationId
		local ResponseBody = p11.responseBody
		local MapReverseResult = nil
		
		if ResponseBody then
			local Id = nil
			MapReverseResult = Functional.MapReverse(ResponseBody, function(p12) --[[ Line: 213 ]]
				-- upvalues: MessageModelModule (upval), ConversationId (copy), Id (ref)
				local FromWebResult = MessageModelModule.fromWeb(p12, ConversationId, Id)
				Id = FromWebResult.id
				
				return FromWebResult
			end)
		else
			MapReverseResult = {}
		end
		local MapReverseResultEntry = MapReverseResult and MapReverseResult[#MapReverseResult] or nil
		local AddMessagesToConversationResult = addMessagesToConversation(p10, ConversationId, {
			messages = MapReverseResult,
			shouldMarkConversationUnread = not (if MapReverseResultEntry then MapReverseResultEntry.senderTargetId == tostring(Players.LocalPlayer.UserId) else false)
		})
		local PageSize = p11.queryArgs.pageSize
		
		if PageSize and #MapReverseResult < PageSize then
			local AddMessagesToConversationResultEntry = AddMessagesToConversationResult[ConversationId]
			
			if not AddMessagesToConversationResultEntry then
				return AddMessagesToConversationResult
			end
			assert(AddMessagesToConversationResultEntry, "FFlagLuauTinyControlFlowAnalysis")
			local AddMessagesToConversationResultEntry1 = AddMessagesToConversationResult[ConversationId]
			
			if AddMessagesToConversationResultEntry1 then
				local FetchedOldestMessage = Immutable.Set(AddMessagesToConversationResultEntry1, "fetchedOldestMessage", true)
				AddMessagesToConversationResult = Immutable.Set(AddMessagesToConversationResult, FetchedOldestMessage.id, FetchedOldestMessage)
			end
		end
		return AddMessagesToConversationResult
	end,
	[NetworkingChatModule.GetLatestMessages.Succeeded.name] = function(p10, p11) --[[ Line: 656 ]]
		-- upvalues: Functional (copy), MessageModelModule (copy), addMessagesToConversation (copy)
		for _, value in ipairs(p11.responseBody) do
			local Text = tostring(value.conversationId)
			local ChatMessages = value.chatMessages
			local MapReverseResult = nil
			
			if ChatMessages then
				local Id = nil
				MapReverseResult = Functional.MapReverse(ChatMessages, function(p12) --[[ Line: 213 ]]
					-- upvalues: MessageModelModule (upval), Text (copy), Id (ref)
					local FromWebResult = MessageModelModule.fromWeb(p12, Text, Id)
					Id = FromWebResult.id
					
					return FromWebResult
				end)
			else
				MapReverseResult = {}
			end
			p10 = addMessagesToConversation(p10, Text, { messages = MapReverseResult })
		end
		return p10
	end,
	[AppChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = function(p12, p13) --[[ Line: 668 ]]
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy), LuauPolyfillModule (copy), MessageModelModule (copy), addMessagesToConversation (copy)
		local Conversation = p13.responseBody.conversations[1]
		
		if not Conversation then
			return p12
		end
		local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(Conversation)
		local UpdateConversationReducerModuleResult = UpdateConversationReducerModule(p12, FromChannelsApiResult)
		local Messages = Conversation.messages or {}
		
		if Messages and #Messages > 0 then
			UpdateConversationReducerModuleResult = addMessagesToConversation(UpdateConversationReducerModuleResult, FromChannelsApiResult.id, {
				messages = LuauPolyfillModule.Array.map(Messages, function(p14) --[[ Line: 682 ]]
					-- upvalues: MessageModelModule (upval), FromChannelsApiResult (copy)
					return MessageModelModule.fromChannelsApi(p14, FromChannelsApiResult.id)
				end)
			})
		end
		return UpdateConversationReducerModuleResult
	end,
	[AppChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = function(p12, p13) --[[ Line: 695 ]]
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy), LuauPolyfillModule (copy), MessageModelModule (copy), addMessagesToConversation (copy)
		local ResponseBody = p13.responseBody
		
		if not ResponseBody or not ResponseBody.conversations then
			return p12
		end
		for _, conversation in ResponseBody.conversations do
			local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(conversation)
			p12 = UpdateConversationReducerModule(p12, FromChannelsApiResult)
			local Messages = conversation.messages or {}
			
			if Messages and #Messages > 0 then
				p12 = addMessagesToConversation(p12, FromChannelsApiResult.id, {
					messages = LuauPolyfillModule.Array.map(Messages, function(p14) --[[ Line: 707 ]]
						-- upvalues: MessageModelModule (upval), FromChannelsApiResult (copy)
						return MessageModelModule.fromChannelsApi(p14, FromChannelsApiResult.id)
					end)
				})
			end
		end
		return p12
	end,
	[AppChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p14, p15) --[[ Line: 720 ]]
		-- upvalues: markConversationAndMessagesAsRead (copy)
		return (markConversationAndMessagesAsRead(p14, p15.postBody.conversation_ids[1]))
	end,
	[NetworkingChatModule.MarkAsRead.Succeeded.name] = function(p14, p15) --[[ Line: 724 ]]
		-- upvalues: markConversationAndMessagesAsRead (copy)
		return (markConversationAndMessagesAsRead(p14, p15.postBody.conversationId))
	end,
	[AppChatNetworkingModule.rodux.TranslateUserMessage.Succeeded.name] = if GetFFlagAppChatEnableManualTranslationModule() then function(p14, p15) --[[ Line: 729 ]]
		-- upvalues: updateMessageContentToDisplay (copy)
		local ContentToDisplay = p15.responseBody.content_to_display
		
		return if p15.postBody.conversation_id and p15.postBody.message_id then updateMessageContentToDisplay(p14, p15.postBody.conversation_id, p15.postBody.message_id, ContentToDisplay) else p14
	end else nil,
	[require(AppChat.Conversations.Actions.ReceivedChannelsMigrationConflict).name] = function(_, _) --[[ Line: 745 ]]
		return {}
	end,
	[require(AppChat.Conversations.Actions.FriendConversationCreated).name] = function(p14, p15) --[[ Line: 748 ]]
		-- upvalues: Immutable (copy)
		return if p14[p15.oldFriendConversationId] then Immutable.Set(p14, p15.oldFriendConversationId, nil) else p14
	end,
	[require(AppChat.Actions.FriendshipDestroyed).name] = function(p14, p15) --[[ Line: 755 ]]
		-- upvalues: ConversationChannelsModule (copy), Immutable (copy)
		local UserId2 = if p15.userId1 == "localUserId" then if p15.userId2 == "localUserId" then nil else p15.userId2 else p15.userId1
		
		if UserId2 then
			assert(UserId2, "FFlagLuauTinyControlFlowAnalysis")
			local FriendConversationId = ConversationChannelsModule.getFriendConversationId({ UserId2 })
			
			return if p14[FriendConversationId] then Immutable.Set(p14, FriendConversationId, nil) else p14
		else
			return p14
		end
	end,
	[require(AppChat.Http.NetworkingBlocking).BlockUserById.Succeeded.name] = if GetFFlagAppChatPCMFixBlockingFunction() then function(SetResult, p14) --[[ Line: 773 ]]
		-- upvalues: GetOneToOneConversationIdFromFriendIdModule (copy), Immutable (copy), ConversationChannelsModule (copy)
		local Text = tostring(p14.namedIds.users)
		
		if not Text then
			return SetResult
		end
		local OneToOneConversationIdFromFriendIdModule = GetOneToOneConversationIdFromFriendIdModule(SetResult, Text)
		local SetResult1 = SetResult
		
		if OneToOneConversationIdFromFriendIdModule and SetResult[OneToOneConversationIdFromFriendIdModule] then
			SetResult1 = Immutable.Set(SetResult1, OneToOneConversationIdFromFriendIdModule, nil)
		end
		local FriendConversationId = ConversationChannelsModule.getFriendConversationId({ Text })
		
		if FriendConversationId and SetResult[FriendConversationId] then
			SetResult1 = Immutable.Set(SetResult, FriendConversationId, nil)
		end
		return SetResult1
	end else nil,
	[require(AppChat.Conversations.Actions.ReloadedMessagesForConversations).name] = function(JoinResult, p14) --[[ Line: 796 ]]
		-- upvalues: CryoModule (copy), ConversationChannelsModule (copy)
		local JoinResult1 = JoinResult
		
		for _, conversationId in p14.conversationIds do
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
				[conversationId] = CryoModule.Dictionary.join(JoinResult1[conversationId], {
					fetchedOldestMessage = false,
					messages = ConversationChannelsModule.getEmptyMessages(),
					sendingMessages = ConversationChannelsModule.getEmptySendingMessages(),
					previousCursor = CryoModule.None,
					nextCursor = CryoModule.None
				})
			})
		end
		return JoinResult1
	end,
	[require(AppChat.Conversations.Actions.ConversationModerationTypeChanged).name] = if FFlagAppChatEnableDoubleOptIn then function(p15, p16) --[[ Line: 816 ]]
		-- upvalues: Immutable (copy)
		local ConversationId = p16.conversationId
		local ModerationType = p16.moderationType
		local v3 = p15[ConversationId]
		
		return if v3 then Immutable.Set(p15, ConversationId, (Immutable.Set(v3, "moderationType", ModerationType))) else p15
	end else nil,
	[AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p15, p16) --[[ Line: 827 ]]
		-- upvalues: ConstantsModule (copy), config (copy), ConversationChannelsModule (copy), Immutable (copy)
		local PostBody = p16.postBody
		
		if PostBody.action_type ~= ConstantsModule.ModalAction.Accept then
			return p15
		end
		local Entry = config[PostBody.modal_variant]
		
		if Entry then
			local ConversationId = PostBody.conversation_id or ConversationChannelsModule.getFriendConversationId({ PostBody.friend_id })
			local v3 = ConversationId and p15[ConversationId]
			
			return if v3 then Immutable.Set(p15, ConversationId, Immutable.Set(v3, Entry.field, Entry.value)) else p15
		else
			return p15
		end
	end
})