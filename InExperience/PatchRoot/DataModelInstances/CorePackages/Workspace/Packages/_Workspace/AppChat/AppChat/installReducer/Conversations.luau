local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ConversationsModule = require(AppChat.Conversations)
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local Immutable = require(Parent.AppCommonLib).Immutable
local OrderedMap = require(Parent.AppCommonLib).OrderedMap
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

local function markConversationAndMessagesAsRead(p1, ConversationId)
	-- upvalues: Immutable (copy)
	local v1 = p1[ConversationId]
	
	if v1 then
		assert(v1, "FFlagLuauTinyControlFlowAnalysis")
		local HasUnreadMessages = Immutable.Set(Immutable.Set(v1, "messages", (v1.messages:Map(function(p2)
			-- upvalues: Immutable (upval)
			return if p2.read then p2 else Immutable.Set(p2, "read", true)
		end))), "hasUnreadMessages", false)
		
		return (Immutable.Set(p1, HasUnreadMessages.id, HasUnreadMessages))
	else
		warn("Conversation " .. ConversationId .. " not found when marking conversation as read")
		
		return p1
	end
end

local function addMessagesToConversation(p1, ConversationId, p2)
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

local function updateMessageContentToDisplay(p3, ConversationId, MessageId, ContentToDisplay)
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

local function messagesFromResponseOfChannelsApi(ConversationId, Messages)
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

local function _(p3)
	return p3.messages or {}
end

local function getShouldMarkConversationUnread(p3, Messages): boolean
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
	[require(AppChat.Conversations.Actions.ReceivedConversation).name] = function(p4, p5)
		-- upvalues: UpdateConversationReducerModule (copy)
		return UpdateConversationReducerModule(p4, p5.conversation)
	end,
	[AppChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p4, p5)
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy)
		local ResponseBody = p5.responseBody
		
		if ResponseBody and ResponseBody.conversations and ResponseBody.conversations[1] and ResponseBody.conversations[1].status == "success" then
			p4 = UpdateConversationReducerModule(p4, (ConversationChannelsModule.fromChannelsApi(ResponseBody.conversations[1])))
		end
		return p4
	end,
	[AppChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p4, p5)
		-- upvalues: ConversationChannelsModule (copy), AddConversationModule (copy)
		local ResponseBody = p5.responseBody
		
		if ResponseBody and ResponseBody.conversations and ResponseBody.conversations[1] then
			p4 = AddConversationModule(p4, (ConversationChannelsModule.fromChannelsApi(ResponseBody.conversations[1])))
		end
		return p4
	end,
	[ConversationsModule.Actions.ReceivedMessages.name] = function(p4, p5)
		-- upvalues: addMessagesToConversation (copy)
		return addMessagesToConversation(p4, p5.conversationId, p5)
	end,
	[ConversationsModule.Actions.SendingMessage.name] = function(p4, p5)
		-- upvalues: OrderedMap (copy), Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local SendingMessages = Immutable.Set(v3, "sendingMessages", (OrderedMap.Insert(v3.sendingMessages, p5.message)))
			p4 = Immutable.Set(p4, SendingMessages.id, SendingMessages)
		end
		return p4
	end,
	[ConversationsModule.Actions.SentMessage.name] = function(p4, p5)
		-- upvalues: OrderedMap (copy), Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local SendingMessages = Immutable.Set(v3, "sendingMessages", (OrderedMap.Delete(v3.sendingMessages, p5.messageId)))
			p4 = Immutable.Set(p4, SendingMessages.id, SendingMessages)
		end
		return p4
	end,
	[require(AppChat.Conversations.Actions.RenamedGroupConversation).name] = function(p4, p5)
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
	[require(AppChat.Conversations.Actions.ChangedParticipants).name] = function(p4, p5)
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
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p4, p5)
		-- upvalues: Immutable (copy)
		return Immutable.Set(p4, p5.conversationId, nil)
	end,
	[require(AppChat.Conversations.Actions.SetUserTyping).name] = function(p4, p5)
		-- upvalues: Immutable (copy)
		local v3 = p4[p5.conversationId]
		
		if v3 then
			local UsersTyping = Immutable.Set(v3, "usersTyping", (Immutable.Set(v3.usersTyping, p5.userId, p5.value)))
			p4 = Immutable.Set(p4, UsersTyping.id, UsersTyping)
		end
		return p4
	end,
	[ConversationsModule.Actions.MessageModerated.name] = function(p4, p5)
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
	[ConversationsModule.Actions.MessageFailedToSend.name] = function(p4, p5)
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
	[require(AppChat.Http.NetworkingChat).GetUserConversations.Succeeded.name] = function(p4, p5)
		-- upvalues: ConversationModule (copy), UpdateConversationReducerModule (copy)
		for _, value in ipairs(p5.responseBody) do
			p4 = UpdateConversationReducerModule(p4, (ConversationModule.fromWeb(value)))
		end
		return p4
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p6, p7)
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy), LuauPolyfillModule (copy), MessageModelModule (copy), addMessagesToConversation (copy)
		local ResponseBody = p7.responseBody
		
		if ResponseBody and ResponseBody.conversations then
			for _, conversation in ResponseBody.conversations do
				local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(conversation)
				p6 = UpdateConversationReducerModule(p6, FromChannelsApiResult)
				local Messages = conversation.messages or {}
				
				if Messages and #Messages > 0 then
					p6 = addMessagesToConversation(p6, FromChannelsApiResult.id, {
						messages = LuauPolyfillModule.Array.map(Messages, function(p8)
							-- upvalues: MessageModelModule (upval), FromChannelsApiResult (copy)
							return MessageModelModule.fromChannelsApi(p8, FromChannelsApiResult.id)
						end)
					})
				end
			end
		end
		return p6
	end,
	[AppChatNetworkingModule.rodux.GetOlderMessages.Succeeded.name] = function(p8, p9)
		-- upvalues: messagesFromResponseOfChannelsApi (copy), addMessagesToConversation (copy), Immutable (copy)
		local ConversationId = p9.queryArgs.conversation_id
		local ResponseBody = p9.responseBody
		local v3 = p8[ConversationId]
		
		if not v3 then
			return p8
		end
		assert(v3, "FFlagLuauTinyControlFlowAnalysis")
		local PreviousCursor = v3.previousCursor or nil
		local NextCursor = v3.nextCursor or nil
		
		if not ResponseBody then
			return p8
		end
		local MessagesFromResponseOfChannelsApiResult = messagesFromResponseOfChannelsApi(ConversationId, ResponseBody.messages)
		local NextCursor1 = if ResponseBody.next_cursor == "" then nil else ResponseBody.next_cursor
		
		if NextCursor1 then
			NextCursor = NextCursor1
		end
		if PreviousCursor == nil then
			PreviousCursor = if ResponseBody.previous_cursor == "" then nil else ResponseBody.previous_cursor
		end
		local AddMessagesToConversationResult = addMessagesToConversation(p8, ConversationId, {
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
	[AppChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p8, p9)
		-- upvalues: messagesFromResponseOfChannelsApi (copy), getShouldMarkConversationUnread (copy), addMessagesToConversation (copy)
		local ConversationId = p9.queryArgs.conversation_id
		local ResponseBody = p9.responseBody
		local v3 = p8[ConversationId]
		
		if not v3 then
			return p8
		end
		assert(v3, "FFlagLuauTinyControlFlowAnalysis")
		local PreviousCursor = v3.previousCursor or nil
		local NextCursor = v3.nextCursor or nil
		
		if not ResponseBody then
			return p8
		end
		local MessagesFromResponseOfChannelsApiResult = messagesFromResponseOfChannelsApi(ConversationId, ResponseBody.messages)
		
		if NextCursor == nil then
			NextCursor = if ResponseBody.next_cursor == "" then nil else ResponseBody.next_cursor
		end
		local PreviousCursor1 = if ResponseBody.previous_cursor == "" then nil else ResponseBody.previous_cursor
		
		if PreviousCursor1 then
			PreviousCursor = PreviousCursor1
		end
		return (addMessagesToConversation(p8, ConversationId, {
			messages = MessagesFromResponseOfChannelsApiResult,
			nextCursor = NextCursor,
			previousCursor = PreviousCursor,
			shouldMarkConversationUnread = getShouldMarkConversationUnread(v3, MessagesFromResponseOfChannelsApiResult)
		}))
	end,
	[AppChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = function(p8, p9)
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy), LuauPolyfillModule (copy), MessageModelModule (copy), addMessagesToConversation (copy)
		local Conversation = p9.responseBody.conversations[1]
		
		if not Conversation then
			return p8
		end
		local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(Conversation)
		local UpdateConversationReducerModuleResult = UpdateConversationReducerModule(p8, FromChannelsApiResult)
		local Messages = Conversation.messages or {}
		
		if Messages and #Messages > 0 then
			UpdateConversationReducerModuleResult = addMessagesToConversation(UpdateConversationReducerModuleResult, FromChannelsApiResult.id, {
				messages = LuauPolyfillModule.Array.map(Messages, function(p10)
					-- upvalues: MessageModelModule (upval), FromChannelsApiResult (copy)
					return MessageModelModule.fromChannelsApi(p10, FromChannelsApiResult.id)
				end)
			})
		end
		return UpdateConversationReducerModuleResult
	end,
	[AppChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = function(p8, p9)
		-- upvalues: ConversationChannelsModule (copy), UpdateConversationReducerModule (copy), LuauPolyfillModule (copy), MessageModelModule (copy), addMessagesToConversation (copy)
		local ResponseBody = p9.responseBody
		
		if not ResponseBody or not ResponseBody.conversations then
			return p8
		end
		for _, conversation in ResponseBody.conversations do
			local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(conversation)
			p8 = UpdateConversationReducerModule(p8, FromChannelsApiResult)
			local Messages = conversation.messages or {}
			
			if Messages and #Messages > 0 then
				p8 = addMessagesToConversation(p8, FromChannelsApiResult.id, {
					messages = LuauPolyfillModule.Array.map(Messages, function(p10)
						-- upvalues: MessageModelModule (upval), FromChannelsApiResult (copy)
						return MessageModelModule.fromChannelsApi(p10, FromChannelsApiResult.id)
					end)
				})
			end
		end
		return p8
	end,
	[AppChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p10, p11)
		-- upvalues: markConversationAndMessagesAsRead (copy)
		return (markConversationAndMessagesAsRead(p10, p11.postBody.conversation_ids[1]))
	end,
	[AppChatNetworkingModule.rodux.TranslateUserMessage.Succeeded.name] = if GetFFlagAppChatEnableManualTranslationModule() then function(p10, p11)
		-- upvalues: updateMessageContentToDisplay (copy)
		local ContentToDisplay = p11.responseBody.content_to_display
		
		return if p11.postBody.conversation_id and p11.postBody.message_id then updateMessageContentToDisplay(p10, p11.postBody.conversation_id, p11.postBody.message_id, ContentToDisplay) else p10
	end else nil,
	[require(AppChat.Conversations.Actions.ReceivedChannelsMigrationConflict).name] = function(_, _)
		return {}
	end,
	[require(AppChat.Conversations.Actions.FriendConversationCreated).name] = function(p10, p11)
		-- upvalues: Immutable (copy)
		return if p10[p11.oldFriendConversationId] then Immutable.Set(p10, p11.oldFriendConversationId, nil) else p10
	end,
	[require(AppChat.Actions.FriendshipDestroyed).name] = function(p10, p11)
		-- upvalues: ConversationChannelsModule (copy), Immutable (copy)
		local UserId2 = if p11.userId1 == "localUserId" then if p11.userId2 == "localUserId" then nil else p11.userId2 else p11.userId1
		
		if UserId2 then
			assert(UserId2, "FFlagLuauTinyControlFlowAnalysis")
			local FriendConversationId = ConversationChannelsModule.getFriendConversationId({ UserId2 })
			
			return if p10[FriendConversationId] then Immutable.Set(p10, FriendConversationId, nil) else p10
		else
			return p10
		end
	end,
	[require(AppChat.Http.NetworkingBlocking).BlockUserById.Succeeded.name] = if GetFFlagAppChatPCMFixBlockingFunction() then function(SetResult, p10)
		-- upvalues: GetOneToOneConversationIdFromFriendIdModule (copy), Immutable (copy), ConversationChannelsModule (copy)
		local Text = tostring(p10.namedIds.users)
		
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
	[require(AppChat.Conversations.Actions.ReloadedMessagesForConversations).name] = function(JoinResult, p10)
		-- upvalues: CryoModule (copy), ConversationChannelsModule (copy)
		local JoinResult1 = JoinResult
		
		for _, conversationId in p10.conversationIds do
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
	[require(AppChat.Conversations.Actions.ConversationModerationTypeChanged).name] = if FFlagAppChatEnableDoubleOptIn then function(p11, p12)
		-- upvalues: Immutable (copy)
		local ConversationId = p12.conversationId
		local ModerationType = p12.moderationType
		local v3 = p11[ConversationId]
		
		return if v3 then Immutable.Set(p11, ConversationId, (Immutable.Set(v3, "moderationType", ModerationType))) else p11
	end else nil,
	[AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p11, p12)
		-- upvalues: ConstantsModule (copy), config (copy), ConversationChannelsModule (copy), Immutable (copy)
		local PostBody = p12.postBody
		
		if PostBody.action_type ~= ConstantsModule.ModalAction.Accept then
			return p11
		end
		local Entry = config[PostBody.modal_variant]
		
		if Entry then
			local ConversationId = PostBody.conversation_id or ConversationChannelsModule.getFriendConversationId({ PostBody.friend_id })
			local v3 = ConversationId and p11[ConversationId]
			
			return if v3 then Immutable.Set(p11, ConversationId, Immutable.Set(v3, Entry.field, Entry.value)) else p11
		else
			return p11
		end
	end
})