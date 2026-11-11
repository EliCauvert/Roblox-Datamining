local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local ConstantsModule = require(AppChat.Constants)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local ConversationModule = require(AppChat.Models.Conversation)
local MessageModelModule = require(AppChat.Models.MessageModel)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local GetConversationListStoreModule = require(AppChat.Stores.GetConversationListStore)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local FFlagAppChatConversationStoreModule = require(AppChat.Flags.FFlagAppChatConversationStore)
local config = {
	[ConstantsModule.OptInVariant.OsaContextCard] = {
		field = "osaAcknowledgementStatus",
		value = ConversationChannelsModule.OsaAcknowledgementStatus.Acknowledged
	},
	[ConstantsModule.OptInVariant.ChatOptInInfoCard] = {
		field = "userOptedIntoChatMessages",
		value = ConversationChannelsModule.UserOptedIntoChatMessagesStatus.OptedIn
	}
}

local function _(p1, p2)
	-- upvalues: ConversationChannelsModule (copy)
	if p2 ~= nil and p2.status ~= "failed" then
		p1.upsertConversation(ConversationChannelsModule.fromChannelsApi(p2))
		
		return
	end
end

local _ = function(p1, p2)
	-- upvalues: ConversationChannelsModule (copy)
	if p2 == nil or p2.conversations == nil then return end
	for _, conversation in p2.conversations do
		if conversation ~= nil and conversation.status ~= "failed" then
			p1.upsertConversation(ConversationChannelsModule.fromChannelsApi(conversation))
		end
	end
end

local _ = function(p3, p4, p5)
	-- upvalues: CryoModule (copy)
	if p4 == nil then return end
	local Conversation = p3.getConversation(p4, false)
	
	if Conversation ~= nil then
		p3.upsertConversation(CryoModule.Dictionary.join(Conversation, p5), false)
		
		return
	end
end

local _ = function(p3)
	return if p3 == nil then nil elseif typeof(p3) == "DateTime" then p3.UnixTimestamp elseif type(p3) == "table" and p3.GetUnixTimestamp ~= nil then p3:GetUnixTimestamp() else nil
end

local _ = function(p3)
	if type(p3) == "string" then
		local Success, Result = pcall(function()
			-- upvalues: p3 (copy)
			return DateTime.fromIsoDate(p3)
		end)
		
		return if Success then Result else nil
	else
		return nil
	end
end

local _ = function(p3)
	if p3.sent == nil then
		local CreatedAt = p3.created_at or p3.createdAt
		
		if type(CreatedAt) == "string" then
			local Success1, Result1 = pcall(function()
				-- upvalues: CreatedAt (copy)
				return DateTime.fromIsoDate(CreatedAt)
			end)
			
			return if Success1 then Result1 else nil
		else
			return nil
		end
	elseif type(p3.sent) ~= "string" then
		return p3.sent
	else
		local Sent = p3.sent
		
		if type(Sent) == "string" then
			local Success, Result = pcall(function()
				-- upvalues: Sent (copy)
				return DateTime.fromIsoDate(Sent)
			end)
			
			return if Success then Result else nil
		else
			return nil
		end
	end
end

local function messagesFromWebResponse(p3, ChatMessages)
	-- upvalues: MessageModelModule (copy)
	if ChatMessages == nil then
		return {}
	end
	local Id = nil
	local FromWebResults = {}
	
	for i = #ChatMessages, 1, -1 do
		local ChatMessage = ChatMessages[i]
		local FromWebResult = MessageModelModule.fromWeb(ChatMessage, p3, Id)
		
		if FromWebResult ~= nil then
			FromWebResult.isPreviewable = ChatMessage.is_previewable
			FromWebResult.isBadgeable = ChatMessage.is_badgeable
			Id = FromWebResult.id
			table.insert(FromWebResults, 1, FromWebResult)
		end
	end
	return FromWebResults
end

local _ = function(p4)
	return if p4.isPreviewable == nil then p4.is_previewable ~= nil and p4.is_previewable else p4.isPreviewable
end

local function getNewestMessageUnixTime(p4)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy)
	if p4 == nil then
		return 0
	end
	local ConversationMessageViewModelStoreModule = GetConversationMessageViewModelStoreModule(false)
	local OrderedId = ConversationMessageViewModelStoreModule.conversationMessageListStore.getOrderedIds(p4, false)[1]
	local Message = OrderedId and ConversationMessageViewModelStoreModule.conversationMessageStore.getMessage(OrderedId, false)
	local Sent = Message
	
	if Sent then
		if Message.sent == nil then
			local CreatedAt = Message.created_at or Message.createdAt
			
			if type(CreatedAt) == "string" then
				local Success1, Result1 = pcall(function()
					-- upvalues: CreatedAt (copy)
					return DateTime.fromIsoDate(CreatedAt)
				end)
				Sent = if Success1 then Result1 else nil
			else
				Sent = nil
			end
		elseif type(Message.sent) == "string" then
			local Sent1 = Message.sent
			
			if type(Sent1) == "string" then
				local Success, Result = pcall(function()
					-- upvalues: Sent1 (copy)
					return DateTime.fromIsoDate(Sent1)
				end)
				Sent = if Success then Result else nil
			else
				Sent = nil
			end
		else
			Sent = Message.sent
		end
	end
	return (if Sent == nil then nil elseif typeof(Sent) == "DateTime" then Sent.UnixTimestamp elseif type(Sent) == "table" and Sent.GetUnixTimestamp ~= nil then Sent:GetUnixTimestamp() else nil) or 0
end

local function shouldMarkConversationUnreadFromMessages(ConversationId, Messages): boolean
	-- upvalues: getNewestMessageUnixTime (copy), Players (copy)
	if Messages == nil then
		return false
	end
	local NewestMessageUnixTime = getNewestMessageUnixTime(ConversationId)
	local Text = tostring(Players.LocalPlayer.UserId)
	
	for _, message in Messages do
		local Sent1 = nil
		if message.sent == nil then
			local CreatedAt = message.created_at or message.createdAt
			
			if type(CreatedAt) == "string" then
				local Success1, Result1 = pcall(function()
					-- upvalues: CreatedAt (copy)
					return DateTime.fromIsoDate(CreatedAt)
				end)
				Sent1 = if Success1 then Result1 else nil
			else
				Sent1 = nil
			end
		elseif type(message.sent) == "string" then
			local Sent = message.sent
			
			if type(Sent) == "string" then
				local Success, Result = pcall(function()
					-- upvalues: Sent (copy)
					return DateTime.fromIsoDate(Sent)
				end)
				Sent1 = if Success then Result else nil
			else
				Sent1 = nil
			end
		else
			Sent1 = message.sent
		end
		local UnixTimestamp = if Sent1 == nil then nil elseif typeof(Sent1) == "DateTime" then Sent1.UnixTimestamp elseif type(Sent1) == "table" and Sent1.GetUnixTimestamp ~= nil then Sent1:GetUnixTimestamp() else nil
		local SenderUserId = message.sender_user_id or message.senderTargetId
		
		if UnixTimestamp ~= nil and NewestMessageUnixTime < UnixTimestamp and SenderUserId ~= nil and tostring(SenderUserId) ~= Text and message.is_badgeable == true then
			return true
		end
	end
	return false
end

local _ = function(p4)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy)
	if p4.previewMessageId == nil then
		return 0
	end
	local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(p4.previewMessageId, false)
	local Sent = Message
	
	if Sent then
		if Message.sent == nil then
			local CreatedAt = Message.created_at or Message.createdAt
			
			if type(CreatedAt) == "string" then
				local Success1, Result1 = pcall(function()
					-- upvalues: CreatedAt (copy)
					return DateTime.fromIsoDate(CreatedAt)
				end)
				Sent = if Success1 then Result1 else nil
			else
				Sent = nil
			end
		elseif type(Message.sent) == "string" then
			local Sent1 = Message.sent
			
			if type(Sent1) == "string" then
				local Success, Result = pcall(function()
					-- upvalues: Sent1 (copy)
					return DateTime.fromIsoDate(Sent1)
				end)
				Sent = if Success then Result else nil
			else
				Sent = nil
			end
		else
			Sent = Message.sent
		end
	end
	return (if Sent == nil then nil elseif typeof(Sent) == "DateTime" then Sent.UnixTimestamp elseif type(Sent) == "table" and Sent.GetUnixTimestamp ~= nil then Sent:GetUnixTimestamp() else nil) or 0
end

local function updateConversationLastUpdatedFromMessages(p4, ConversationId, Messages, ShouldMarkConversationUnread)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy), CryoModule (copy)
	if ConversationId == nil or Messages == nil then return end
	local Conversation = p4.getConversation(ConversationId, false)
	
	if Conversation == nil then return end
	local LastUpdated = nil
	local Id = nil
	local UnixTimestamp = nil
	
	if Conversation.previewMessageId == nil then
		UnixTimestamp = 0
	else
		local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(Conversation.previewMessageId, false)
		local Sent = Message
		
		if Sent then
			if Message.sent == nil then
				local CreatedAt = Message.created_at or Message.createdAt
				
				if type(CreatedAt) == "string" then
					local Success1, Result1 = pcall(function()
						-- upvalues: CreatedAt (copy)
						return DateTime.fromIsoDate(CreatedAt)
					end)
					Sent = if Success1 then Result1 else nil
				else
					Sent = nil
				end
			elseif type(Message.sent) == "string" then
				local Sent1 = Message.sent
				
				if type(Sent1) == "string" then
					local Success, Result = pcall(function()
						-- upvalues: Sent1 (copy)
						return DateTime.fromIsoDate(Sent1)
					end)
					Sent = if Success then Result else nil
				else
					Sent = nil
				end
			else
				Sent = Message.sent
			end
		end
		UnixTimestamp = (if Sent == nil then nil elseif typeof(Sent) == "DateTime" then Sent.UnixTimestamp elseif type(Sent) == "table" and Sent.GetUnixTimestamp ~= nil then Sent:GetUnixTimestamp() else nil) or 0
	end
	local LastUpdated1 = Conversation.lastUpdated
	local UnixTimestamp1 = (if LastUpdated1 == nil then nil elseif typeof(LastUpdated1) == "DateTime" then LastUpdated1.UnixTimestamp elseif type(LastUpdated1) == "table" and LastUpdated1.GetUnixTimestamp ~= nil then LastUpdated1:GetUnixTimestamp() else nil) or 0
	
	for _, message in Messages do
		if message ~= nil and (if message.isPreviewable == nil then message.is_previewable ~= nil and message.is_previewable else message.isPreviewable) then
			local Sent2 = nil
			if message.sent == nil then
				local CreatedAt1 = message.created_at or message.createdAt
				
				if type(CreatedAt1) == "string" then
					local Success3, Result3 = pcall(function()
						-- upvalues: CreatedAt1 (copy)
						return DateTime.fromIsoDate(CreatedAt1)
					end)
					Sent2 = if Success3 then Result3 else nil
				else
					Sent2 = nil
				end
			elseif type(message.sent) == "string" then
				local Sent1 = message.sent
				
				if type(Sent1) == "string" then
					local Success2, Result2 = pcall(function()
						-- upvalues: Sent1 (copy)
						return DateTime.fromIsoDate(Sent1)
					end)
					Sent2 = if Success2 then Result2 else nil
				else
					Sent2 = nil
				end
			else
				Sent2 = message.sent
			end
			local UnixTimestamp2 = if Sent2 == nil then nil elseif typeof(Sent2) == "DateTime" then Sent2.UnixTimestamp elseif type(Sent2) == "table" and Sent2.GetUnixTimestamp ~= nil then Sent2:GetUnixTimestamp() else nil
			
			if UnixTimestamp2 ~= nil and UnixTimestamp < UnixTimestamp2 then
				UnixTimestamp = UnixTimestamp2
				LastUpdated = Sent2
				Id = message.id
			end
		end
	end
	if LastUpdated ~= nil then
		local config = { previewMessageId = Id }
		
		if UnixTimestamp1 < UnixTimestamp then
			config.lastUpdated = LastUpdated
		end
		if ShouldMarkConversationUnread then
			config.hasUnreadMessages = true
		end
		if ConversationId == nil then return end
		local Conversation1 = p4.getConversation(ConversationId, false)
		
		if Conversation1 ~= nil then
			p4.upsertConversation(CryoModule.Dictionary.join(Conversation1, config), false)
			
			return
		end
		return
	elseif ShouldMarkConversationUnread then
		local config = { hasUnreadMessages = true }
		
		if ConversationId == nil then return end
		local Conversation2 = p4.getConversation(ConversationId, false)
		
		if Conversation2 == nil then return end
		p4.upsertConversation(CryoModule.Dictionary.join(Conversation2, config), false)
	end
end

local function handleGetUserConversationsFailed(_, p5)
	p5.setListStatus({ isFetchingConversations = false })
end

local function handleGetConversationDetailsSucceeded(p5, p6)
	-- upvalues: ConversationChannelsModule (copy)
	local ResponseBody = p5.responseBody
	
	if ResponseBody ~= nil then
		if ResponseBody.conversations == nil then return end
		for _, conversation in ResponseBody.conversations do
			if conversation ~= nil and conversation.status ~= "failed" then
				p6.upsertConversation(ConversationChannelsModule.fromChannelsApi(conversation))
			end
		end
	end
end

local function handleLegacyGetUserConversationsSucceeded(p7, p8)
	-- upvalues: ConversationModule (copy)
	local ResponseBody = p7.responseBody
	
	if ResponseBody == nil then return end
	for _, value in ipairs(ResponseBody) do
		p8.upsertConversation(ConversationModule.fromWeb(value))
	end
	p8.setListStatus({ isFetchingConversations = false })
	local PageSize = p7.queryArgs and p7.queryArgs.pageSize
	
	if PageSize ~= nil and #ResponseBody < PageSize then
		p8.setListStatus({ oldestConversationIsFetched = true })
	end
end

local config1 = {
	[AppChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p9, p10)
		-- upvalues: ConversationChannelsModule (copy)
		local ResponseBody = p9.responseBody
		local Conversation = ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1])
		
		if Conversation ~= nil then
			if Conversation.status == "failed" then return end
			p10.upsertConversation(ConversationChannelsModule.fromChannelsApi(Conversation))
		end
	end,
	[AppChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p9, p10)
		-- upvalues: ConversationChannelsModule (copy)
		local ResponseBody = p9.responseBody
		local Conversation = ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1])
		
		if Conversation ~= nil then
			if Conversation.status == "failed" then return end
			p10.upsertConversation(ConversationChannelsModule.fromChannelsApi(Conversation))
		end
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p9, p10)
		-- upvalues: ConversationChannelsModule (copy)
		local ResponseBody = p9.responseBody
		
		if ResponseBody ~= nil and ResponseBody.conversations ~= nil then
			for _, conversation in ResponseBody.conversations do
				if conversation ~= nil and conversation.status ~= "failed" then
					p10.upsertConversation(ConversationChannelsModule.fromChannelsApi(conversation))
				end
			end
		end
		local NextCursor = p9.responseBody and p9.responseBody.next_cursor
		local config = { isFetchingConversations = false }
		
		if NextCursor == nil or NextCursor == "" then
			config.oldestConversationIsFetched = true
		end
		p10.setListStatus(config)
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[AppChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p11, p12)
		-- upvalues: CryoModule (copy)
		local ConversationIds = p11.postBody and p11.postBody.conversation_ids
		
		if ConversationIds == nil then return end
		for _, conversationId in ConversationIds do
			local config = { hasUnreadMessages = false }
			local v1 = conversationId == nil
			local Conversation = nil
			
			if not v1 then
				Conversation = p12.getConversation(conversationId, false)
				v1 = Conversation == nil
			end
			if not v1 then
				p12.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			end
		end
	end,
	[AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p13, p14)
		local ResponseBody = p13.responseBody
		
		if ResponseBody == nil or ResponseBody.conversation_participants_metadata == nil then return end
		for i, value in ResponseBody.conversation_participants_metadata do
			local t = {}
			
			for i1, value1 in value.participants_metadata do
				t[i1] = {
					isPending = value1.is_pending,
					isBlocked = value1.is_blocked,
					isInviter = value1.is_inviter,
					isInvited = value1.is_invited
				}
			end
			p14.setParticipantMetadata(i, t)
		end
	end,
	[AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p15, p16)
		-- upvalues: ConstantsModule (copy), config (copy), ConversationChannelsModule (copy), CryoModule (copy)
		local PostBody = p15.postBody
		
		if PostBody == nil or PostBody.action_type ~= ConstantsModule.ModalAction.Accept then return end
		local Entry = config[PostBody.modal_variant]
		
		if Entry == nil then return end
		local ConversationId = PostBody.conversation_id or ConversationChannelsModule.getFriendConversationId({ PostBody.friend_id })
		local config1 = { [Entry.field] = Entry.value }
		
		if ConversationId == nil then return end
		local Conversation = p16.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config1), false)
			
			return
		end
	end,
	[NetworkingChatModule.GetUserConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[NetworkingChatModule.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[NetworkingChatModule.GetConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[NetworkingChatModule.GetConversations.Failed.name] = handleGetUserConversationsFailed,
	[NetworkingChatModule.GetLatestMessages.Succeeded.name] = function(p15, p16)
		-- upvalues: updateConversationLastUpdatedFromMessages (copy), messagesFromWebResponse (copy)
		local ResponseBody = p15.responseBody
		
		if ResponseBody == nil then return end
		for _, value in ipairs(ResponseBody) do
			local Text = tostring(value.conversationId)
			updateConversationLastUpdatedFromMessages(p16, Text, (messagesFromWebResponse(Text, value.chatMessages)))
		end
	end,
	[NetworkingChatModule.MarkAsRead.Succeeded.name] = function(p17, p18)
		-- upvalues: CryoModule (copy)
		local ConversationId = p17.postBody and p17.postBody.conversationId
		local config = { hasUnreadMessages = false }
		
		if ConversationId == nil then return end
		local Conversation = p18.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p18.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Http.NetworkingBlocking).BlockUserById.Succeeded.name] = function(p17, p18)
		-- upvalues: ConversationChannelsModule (copy)
		local Users = p17.namedIds and p17.namedIds.users
		
		if Users == nil then return end
		local Text = tostring(Users)
		
		for _, value in p18.getConversations(false) do
			local Participants = value.participants or {}
			
			if value.type == ConversationChannelsModule.Type.OneToOne and table.find(Participants, Text) then
				p18.removeConversation(value.id)
			end
		end
		p18.removeConversation(ConversationChannelsModule.getFriendConversationId({ Text }))
	end,
	[require(AppChat.Conversations.Actions.ReceivedConversation).name] = function(p19, p20)
		p20.upsertConversation(p19.conversation)
	end,
	[require(AppChat.Conversations).Actions.ReceivedMessages.name] = function(p19, p20)
		-- upvalues: updateConversationLastUpdatedFromMessages (copy)
		updateConversationLastUpdatedFromMessages(p20, p19.conversationId, p19.messages, p19.shouldMarkConversationUnread)
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p19, p20)
		if p19.conversationId then
			p20.removeConversation(p19.conversationId)
		end
	end,
	[require(AppChat.Conversations.Actions.RenamedGroupConversation).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local ConversationId = p19.conversationId
		local config = {
			lastUpdated = p19.lastUpdated,
			title = p19.title,
			isDefaultTitle = p19.isDefaultTitle
		}
		
		if ConversationId == nil then return end
		local Conversation = p20.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ChangedParticipants).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local ConversationId = p19.conversationId
		local config = {
			participants = p19.participants,
			lastUpdated = p19.lastUpdated,
			title = p19.title
		}
		
		if ConversationId == nil then return end
		local Conversation = p20.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.HasUnreadMessages).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local Id = p19.conversation and p19.conversation.id
		local config = { hasUnreadMessages = true }
		
		if Id == nil then return end
		local Conversation = p20.getConversation(Id, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ReadConversation).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local ConversationId = p19.conversationId
		local config = { hasUnreadMessages = false }
		
		if ConversationId == nil then return end
		local Conversation = p20.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetUserTyping).name] = function(p19, p20)
		local Conversation = p19.conversationId and p20.getConversation(p19.conversationId, false)
		
		if Conversation ~= nil then
			local Copy = table.clone(Conversation.usersTyping or {})
			Copy[p19.userId] = p19.value
			p20.setUsersTyping(p19.conversationId, Copy)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetConversationLoadingStatus).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local ConversationId = p19.conversationId
		local config = { initialLoadingStatus = p19.value }
		
		if ConversationId == nil then return end
		local Conversation = p20.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetUserLeavingConversation).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local Id = p19.id
		local config = { isUserLeaving = p19.isLeaving }
		
		if Id == nil then return end
		local Conversation = p20.getConversation(Id, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetPinnedGameForConversation).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local ConversationId = p19.conversationId
		local config = {
			pinnedGame = {
				rootPlaceId = p19.rootPlaceId,
				universeId = p19.universeId
			}
		}
		
		if ConversationId == nil then return end
		local Conversation = p20.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ConversationModerationTypeChanged).name] = function(p19, p20)
		-- upvalues: CryoModule (copy)
		local ConversationId = p19.conversationId
		local config = { moderationType = p19.moderationType }
		
		if ConversationId == nil then return end
		local Conversation = p20.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p20.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.FriendConversationCreated).name] = function(p19, p20)
		if p19.oldFriendConversationId then
			p20.removeConversation(p19.oldFriendConversationId)
		end
	end,
	[require(AppChat.Actions.FriendshipDestroyed).name] = function(p19, p20)
		-- upvalues: ConversationChannelsModule (copy)
		local UserId2 = if p19.userId1 == "localUserId" then if p19.userId2 == "localUserId" then nil else p19.userId2 else p19.userId1
		
		if UserId2 ~= nil then
			p20.removeConversation(ConversationChannelsModule.getFriendConversationId({ UserId2 }))
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.RequestPageConversations).name] = function(_, p19)
		p19.setListStatus({ isFetchingConversations = true })
	end,
	[require(AppChat.Conversations.Actions.ReceivedPageConversations).name] = function(_, p19)
		p19.setListStatus({ isFetchingConversations = false })
	end,
	[require(AppChat.Conversations.Actions.RequestLatestMessages).name] = function(_, _)
		-- upvalues: GetConversationListStoreModule (copy)
		GetConversationListStoreModule(false).setLatestMessagesFetching(true)
	end,
	[require(AppChat.Conversations.Actions.ReceivedLatestMessages).name] = function(_, _)
		-- upvalues: GetConversationListStoreModule (copy)
		GetConversationListStoreModule(false).setLatestMessagesFetching(false)
	end,
	[AppChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p19, p20)
		-- upvalues: updateConversationLastUpdatedFromMessages (copy), shouldMarkConversationUnreadFromMessages (copy)
		local ConversationId = p19.queryArgs and p19.queryArgs.conversation_id
		local ResponseBody = p19.responseBody
		local Messages = ResponseBody and ResponseBody.messages
		updateConversationLastUpdatedFromMessages(p20, ConversationId, Messages, (shouldMarkConversationUnreadFromMessages(ConversationId, Messages)))
	end,
	[require(AppChat.Conversations.Actions.ReceivedOldestConversation).name] = function(_, p19)
		p19.setListStatus({ oldestConversationIsFetched = true })
	end,
	[require(AppChat.Conversations.Actions.ReceivedChannelsMigrationConflict).name] = function(_, p19)
		-- upvalues: GetConversationListStoreModule (copy)
		p19.clear()
		GetConversationListStoreModule(false).setLatestMessagesFetching(false)
	end
}

return function(Callback, _)
	-- upvalues: FFlagAppChatConversationStoreModule (copy), config1 (copy), GetConversationStoreModule (copy)
	return function(p19)
		-- upvalues: Callback (copy), FFlagAppChatConversationStoreModule (upval), config1 (upval), GetConversationStoreModule (upval)
		local CallbackResult = Callback(p19)
		
		if not FFlagAppChatConversationStoreModule then
			return CallbackResult
		end
		local Entry: (any, any) -> () = config1[p19.type]
		
		if Entry then
			Entry(p19, GetConversationStoreModule(false))
		end
		return CallbackResult
	end
end