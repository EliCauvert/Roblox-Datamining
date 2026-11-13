local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local ConstantsModule = require(AppChat.Constants)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local ConversationModule = require(AppChat.Models.Conversation)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local GetConversationListStoreModule = require(AppChat.Stores.GetConversationListStore)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationSearchDataHydrationModule = require(AppChat.Stores.GetConversationSearchDataHydration)
local SearchIntroducedConversationIdsModule = require(AppChat.Stores.searchIntroducedConversationIds)
local NetworkingBlockingModule = require(AppChat.Http.NetworkingBlocking)
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local GetMessageSentUnixSecondsModule = require(AppChat.Utils.getMessageSentUnixSeconds)
local GetUnixTimestampMillisModule = require(AppChat.Utils.getUnixTimestampMillis)
local GetUnixTimestampSecondsModule = require(AppChat.Utils.getUnixTimestampSeconds)
local _ = require(AppChat.AppChatData.Types)
local FindNewestPreviewableMessageModule = require(AppChat.AppChatData.Conversations.findNewestPreviewableMessage)
local HasPreviewableMessageNewerThanModule = require(AppChat.AppChatData.Conversations.hasPreviewableMessageNewerThan)
local ShouldMarkUnreadModule = require(AppChat.AppChatData.Unread.shouldMarkUnread)
local ChangedParticipantsModule = require(AppChat.Conversations.Actions.ChangedParticipants)
local ConversationModerationTypeChangedModule = require(AppChat.Conversations.Actions.ConversationModerationTypeChanged)
local FriendConversationCreatedModule = require(AppChat.Conversations.Actions.FriendConversationCreated)
local FriendshipDestroyedModule = require(AppChat.Actions.FriendshipDestroyed)
local ReceivedChannelsMigrationConflictModule = require(AppChat.Conversations.Actions.ReceivedChannelsMigrationConflict)
local ReceivedConversationModule = require(AppChat.Conversations.Actions.ReceivedConversation)
local ReceivedPageConversationsModule = require(AppChat.Conversations.Actions.ReceivedPageConversations)
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local RenamedGroupConversationModule = require(AppChat.Conversations.Actions.RenamedGroupConversation)
local RequestPageConversationsModule = require(AppChat.Conversations.Actions.RequestPageConversations)
local ReceivedMessages = require(AppChat.Conversations).Actions.ReceivedMessages
local SetUserTypingModule = require(AppChat.Conversations.Actions.SetUserTyping)
local FFlagAppChatConversationStoreModule = require(AppChat.Flags.FFlagAppChatConversationStore)
local FFlagAppChatConversationLoadRetryModule = require(AppChat.Flags.FFlagAppChatConversationLoadRetry)
local FFlagAppChatAnyServerSideConversationSearchModule = require(AppChat.Flags.FFlagAppChatAnyServerSideConversationSearch)
local AppChatBatchConversationPageUpsert = game:DefineFastFlag("AppChatBatchConversationPageUpsert", false)
local FFlagAppChatDerivedConversationLatestActivityModule = require(AppChat.Flags.FFlagAppChatDerivedConversationLatestActivity)
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

local function upsertConversationResponse(p1, Conversation)
	-- upvalues: ConversationChannelsModule (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), SignalsExperimentalModule (copy), SearchIntroducedConversationIdsModule (copy)
	if Conversation == nil or Conversation.status == "failed" then return end
	local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(Conversation)
	
	if FFlagAppChatAnyServerSideConversationSearchModule then
		SignalsExperimentalModule.batch(function()
			-- upvalues: p1 (copy), FromChannelsApiResult (copy), SearchIntroducedConversationIdsModule (upval)
			p1.upsertConversation(FromChannelsApiResult)
			SearchIntroducedConversationIdsModule.remove(FromChannelsApiResult.id)
		end)
		
		return
	else
		p1.upsertConversation(FromChannelsApiResult)
	end
end

local function upsertConversationResponses(p1, ResponseBody)
	-- upvalues: AppChatBatchConversationPageUpsert (copy), SignalsExperimentalModule (copy), upsertConversationResponse (copy)
	if ResponseBody == nil or ResponseBody.conversations == nil then return end
	if AppChatBatchConversationPageUpsert then
		SignalsExperimentalModule.batch(function()
			-- upvalues: ResponseBody (copy), upsertConversationResponse (upval), p1 (copy)
			for _, conversation in ResponseBody.conversations do
				upsertConversationResponse(p1, conversation)
			end
		end)
		
		return
	end
	for _, conversation in ResponseBody.conversations do
		upsertConversationResponse(p1, conversation)
	end
end

local function _(p2, p3, p4)
	-- upvalues: CryoModule (copy)
	if p3 == nil then return end
	local Conversation = p2.getConversation(p3, false)
	
	if Conversation ~= nil then
		p2.upsertConversation(CryoModule.Dictionary.join(Conversation, p4), false)
		
		return
	end
end

local function getNewestMessageUnixSeconds(p2)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy), GetMessageSentUnixSecondsModule (copy)
	if p2 == nil then
		return 0
	else
		local ConversationMessageViewModelStoreModule = GetConversationMessageViewModelStoreModule(false)
		local OrderedId = ConversationMessageViewModelStoreModule.conversationMessageListStore.getOrderedIds(p2, false)[1]
		local Message = OrderedId and ConversationMessageViewModelStoreModule.conversationMessageStore.getMessage(OrderedId, false)
		
		return Message and GetMessageSentUnixSecondsModule(Message) or 0
	end
end

local function shouldMarkConversationUnreadFromMessages(ConversationId, Messages)
	-- upvalues: ShouldMarkUnreadModule (copy), getNewestMessageUnixSeconds (copy), Players (copy)
	return Messages ~= nil and ShouldMarkUnreadModule(Messages, getNewestMessageUnixSeconds(ConversationId), (tostring(Players.LocalPlayer.UserId)))
end

local _ = function(p2)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy), GetMessageSentUnixSecondsModule (copy)
	if p2.previewMessageId == nil then
		return 0
	else
		local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(p2.previewMessageId, false)
		
		return Message and GetMessageSentUnixSecondsModule(Message) or 0
	end
end

local function updateConversationLastUpdatedFromMessages(p2, ConversationId, Messages, ShouldMarkConversationUnread)
	-- upvalues: FindNewestPreviewableMessageModule (copy), GetConversationMessageViewModelStoreModule (copy), GetMessageSentUnixSecondsModule (copy), GetUnixTimestampSecondsModule (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), SearchIntroducedConversationIdsModule (copy), CryoModule (copy)
	if ConversationId == nil or Messages == nil then return end
	local Conversation = p2.getConversation(ConversationId, false)
	
	if Conversation == nil then return end
	local v1 = nil
	if Conversation.previewMessageId == nil then
		v1 = 0
	else
		local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(Conversation.previewMessageId, false)
		v1 = Message and GetMessageSentUnixSecondsModule(Message) or 0
	end
	local NewestPreviewableMessageModule = FindNewestPreviewableMessageModule(Messages, v1)
	local UnixTimestampSecondsModule = GetUnixTimestampSecondsModule(Conversation.lastUpdated) or 0
	
	if NewestPreviewableMessageModule ~= nil then
		local config = {
			previewMessageId = NewestPreviewableMessageModule.messageId
		}
		
		if UnixTimestampSecondsModule < NewestPreviewableMessageModule.sentUnixSeconds then
			config.lastUpdated = NewestPreviewableMessageModule.sentDateTime
			
			if FFlagAppChatAnyServerSideConversationSearchModule then
				SearchIntroducedConversationIdsModule.remove(ConversationId)
			end
		end
		if ShouldMarkConversationUnread then
			config.hasUnreadMessages = true
		end
		if ConversationId == nil then return end
		local Conversation1 = p2.getConversation(ConversationId, false)
		
		if Conversation1 ~= nil then
			p2.upsertConversation(CryoModule.Dictionary.join(Conversation1, config), false)
			
			return
		end
		return
	elseif ShouldMarkConversationUnread then
		local config = { hasUnreadMessages = true }
		
		if ConversationId == nil then return end
		local Conversation2 = p2.getConversation(ConversationId, false)
		
		if Conversation2 == nil then return end
		p2.upsertConversation(CryoModule.Dictionary.join(Conversation2, config), false)
	end
end

local function updateConversationFromMessages(p2, ConversationId, Messages, ShouldMarkConversationUnread)
	-- upvalues: FFlagAppChatAnyServerSideConversationSearchModule (copy), SearchIntroducedConversationIdsModule (copy), HasPreviewableMessageNewerThanModule (copy), GetUnixTimestampMillisModule (copy), CryoModule (copy)
	if ConversationId == nil or Messages == nil then return end
	local Conversation = p2.getConversation(ConversationId, false)
	
	if Conversation == nil then return end
	local Flag = false
	
	if FFlagAppChatAnyServerSideConversationSearchModule and SearchIntroducedConversationIdsModule.has(ConversationId) and HasPreviewableMessageNewerThanModule(Messages, GetUnixTimestampMillisModule(Conversation.lastUpdated) or 0) then
		SearchIntroducedConversationIdsModule.remove(ConversationId)
		Flag = true
	end
	local t = {}
	
	if ShouldMarkConversationUnread then
		t.hasUnreadMessages = true
	end
	if Flag or ShouldMarkConversationUnread then
		if ConversationId == nil then return end
		local Conversation1 = p2.getConversation(ConversationId, false)
		
		if Conversation1 == nil then return end
		p2.upsertConversation(CryoModule.Dictionary.join(Conversation1, t), false)
	end
end

local _ = function(p2): boolean
	local QueryArgs = if p2 == nil then nil else p2.queryArgs
	
	if type(QueryArgs) ~= "table" then
		return true
	elseif QueryArgs.pageNumber == nil then
		local Cursor = QueryArgs.cursor
		
		return Cursor == nil or Cursor == ""
	else
		return QueryArgs.pageNumber == 1
	end
end

local _ = function(p2, p3)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
	if not FFlagAppChatConversationLoadRetryModule then return end
	p3.error = CryoModule.None
	p3.isFetchingNextPage = false
	local QueryArgs = if p2 == nil then nil else p2.queryArgs
	local IsPageNumberMatch = nil
	
	if type(QueryArgs) == "table" then
		if QueryArgs.pageNumber == nil then
			local Cursor = QueryArgs.cursor
			IsPageNumberMatch = Cursor == nil or Cursor == ""
		else
			IsPageNumberMatch = QueryArgs.pageNumber == 1
		end
	else
		IsPageNumberMatch = true
	end
	if IsPageNumberMatch then
		p3.hasFetchedInitialPage = true
	end
end

local _ = function(p2, p3)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy)
	if not FFlagAppChatConversationLoadRetryModule then return end
	p3.isFetchingNextPage = false
	local QueryArgs = if p2 == nil then nil else p2.queryArgs
	local IsPageNumberMatch = nil
	
	if type(QueryArgs) == "table" then
		if QueryArgs.pageNumber == nil then
			local Cursor = QueryArgs.cursor
			IsPageNumberMatch = Cursor == nil or Cursor == ""
		else
			IsPageNumberMatch = QueryArgs.pageNumber == 1
		end
	else
		IsPageNumberMatch = true
	end
	if IsPageNumberMatch then
		p3.error = p2 == nil or p2.error == nil or p2.error
	end
end

local function handleGetUserConversationsFailed(p2, p3)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy)
	local config = { isFetchingConversations = false }
	
	if FFlagAppChatConversationLoadRetryModule then
		config.isFetchingNextPage = false
		local QueryArgs = if p2 == nil then nil else p2.queryArgs
		local IsPageNumberMatch = nil
		
		if type(QueryArgs) == "table" then
			if QueryArgs.pageNumber == nil then
				local Cursor = QueryArgs.cursor
				IsPageNumberMatch = Cursor == nil or Cursor == ""
			else
				IsPageNumberMatch = QueryArgs.pageNumber == 1
			end
		else
			IsPageNumberMatch = true
		end
		if IsPageNumberMatch then
			config.error = p2 == nil or p2.error == nil or p2.error
		end
	end
	p3.setListStatus(config)
end

local function handleGetConversationDetailsSucceeded(p2, p3)
	-- upvalues: upsertConversationResponses (copy)
	upsertConversationResponses(p3, p2.responseBody)
end

local config1 = {
	[AppChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p2, p3)
		-- upvalues: upsertConversationResponse (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		local ResponseBody = p2.responseBody
		upsertConversationResponse(p3, ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1]))
		
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[AppChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p2, p3)
		-- upvalues: upsertConversationResponse (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		local ResponseBody = p2.responseBody
		upsertConversationResponse(p3, ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1]))
		
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p2, p3)
		-- upvalues: upsertConversationResponses (copy), FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
		upsertConversationResponses(p3, p2.responseBody)
		local NextCursor = p2.responseBody and p2.responseBody.next_cursor
		local config = { isFetchingConversations = false }
		
		if NextCursor == nil or NextCursor == "" then
			config.oldestConversationIsFetched = true
		end
		if FFlagAppChatConversationLoadRetryModule then
			config.error = CryoModule.None
			config.isFetchingNextPage = false
			local QueryArgs = if p2 == nil then nil else p2.queryArgs
			local IsPageNumberMatch = nil
			
			if type(QueryArgs) == "table" then
				if QueryArgs.pageNumber == nil then
					local Cursor = QueryArgs.cursor
					IsPageNumberMatch = Cursor == nil or Cursor == ""
				else
					IsPageNumberMatch = QueryArgs.pageNumber == 1
				end
			else
				IsPageNumberMatch = true
			end
			if IsPageNumberMatch then
				config.hasFetchedInitialPage = true
			end
		end
		p3.setListStatus(config)
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[AppChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p2, p3)
		-- upvalues: CryoModule (copy)
		local ConversationIds = p2.postBody and p2.postBody.conversation_ids
		
		if ConversationIds == nil then return end
		for _, conversationId in ConversationIds do
			local config = { hasUnreadMessages = false }
			local v1 = conversationId == nil
			local Conversation = nil
			
			if not v1 then
				Conversation = p3.getConversation(conversationId, false)
				v1 = Conversation == nil
			end
			if not v1 then
				p3.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			end
		end
	end,
	[AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p4, p5)
		local ResponseBody = p4.responseBody
		
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
			p5.setParticipantMetadata(i, t)
		end
	end,
	[AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p6, p7)
		-- upvalues: ConstantsModule (copy), config (copy), ConversationChannelsModule (copy), CryoModule (copy)
		local PostBody = p6.postBody
		
		if PostBody == nil or PostBody.action_type ~= ConstantsModule.ModalAction.Accept then return end
		local Entry = config[PostBody.modal_variant]
		
		if Entry == nil then return end
		local ConversationId = PostBody.conversation_id or ConversationChannelsModule.getFriendConversationId({ PostBody.friend_id })
		local config1 = { [Entry.field] = Entry.value }
		
		if ConversationId == nil then return end
		local Conversation = p7.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p7.upsertConversation(CryoModule.Dictionary.join(Conversation, config1), false)
			
			return
		end
	end,
	[NetworkingChatModule.GetUserConversations.Succeeded.name] = function(p6, p7)
		-- upvalues: ConversationModule (copy), FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
		local ResponseBody = p6.responseBody
		
		if ResponseBody == nil then return end
		for _, value in ipairs(ResponseBody) do
			p7.upsertConversation(ConversationModule.fromWeb(value))
		end
		local config = { isFetchingConversations = false }
		
		if FFlagAppChatConversationLoadRetryModule then
			config.error = CryoModule.None
			config.isFetchingNextPage = false
			local QueryArgs = if p6 == nil then nil else p6.queryArgs
			local IsPageNumberMatch = nil
			
			if type(QueryArgs) == "table" then
				if QueryArgs.pageNumber == nil then
					local Cursor = QueryArgs.cursor
					IsPageNumberMatch = Cursor == nil or Cursor == ""
				else
					IsPageNumberMatch = QueryArgs.pageNumber == 1
				end
			else
				IsPageNumberMatch = true
			end
			if IsPageNumberMatch then
				config.hasFetchedInitialPage = true
			end
		end
		p7.setListStatus(config)
		local PageSize = p6.queryArgs and p6.queryArgs.pageSize
		
		if PageSize ~= nil and #ResponseBody < PageSize then
			p7.setListStatus({ oldestConversationIsFetched = true })
		end
	end,
	[NetworkingChatModule.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[NetworkingBlockingModule.BlockUserById.Succeeded.name] = function(p8, p9)
		-- upvalues: ConversationChannelsModule (copy)
		local Users = p8.namedIds and p8.namedIds.users
		
		if Users == nil then return end
		local Text = tostring(Users)
		
		for _, value in p9.getConversations(false) do
			local Participants = value.participants or {}
			
			if value.type == ConversationChannelsModule.Type.OneToOne and table.find(Participants, Text) then
				p9.removeConversation(value.id)
			end
		end
		p9.removeConversation(ConversationChannelsModule.getFriendConversationId({ Text }))
	end,
	[ReceivedConversationModule.name] = function(p10, p11)
		p11.upsertConversation(p10.conversation)
	end,
	[ReceivedMessages.name] = function(p10, p11)
		-- upvalues: FFlagAppChatDerivedConversationLatestActivityModule (copy), updateConversationFromMessages (copy), updateConversationLastUpdatedFromMessages (copy)
		if FFlagAppChatDerivedConversationLatestActivityModule then
			updateConversationFromMessages(p11, p10.conversationId, p10.messages, p10.shouldMarkConversationUnread)
			
			return
		else
			updateConversationLastUpdatedFromMessages(p11, p10.conversationId, p10.messages, p10.shouldMarkConversationUnread)
		end
	end,
	[RemovedConversationModule.name] = function(p10, p11)
		if p10.conversationId then
			p11.removeConversation(p10.conversationId)
		end
	end,
	[RenamedGroupConversationModule.name] = function(p10, p11)
		-- upvalues: CryoModule (copy)
		local ConversationId = p10.conversationId
		local config = {
			lastUpdated = p10.lastUpdated,
			title = p10.title,
			isDefaultTitle = p10.isDefaultTitle
		}
		
		if ConversationId == nil then return end
		local Conversation = p11.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p11.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[ChangedParticipantsModule.name] = function(p10, p11)
		-- upvalues: CryoModule (copy)
		local ConversationId = p10.conversationId
		local config = {
			participants = p10.participants,
			lastUpdated = p10.lastUpdated,
			title = p10.title
		}
		
		if ConversationId == nil then return end
		local Conversation = p11.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p11.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[SetUserTypingModule.name] = function(p10, p11)
		local Conversation = p10.conversationId and p11.getConversation(p10.conversationId, false)
		
		if Conversation ~= nil then
			local Copy = table.clone(Conversation.usersTyping or {})
			Copy[p10.userId] = p10.value
			p11.setUsersTyping(p10.conversationId, Copy)
			
			return
		end
	end,
	[ConversationModerationTypeChangedModule.name] = function(p10, p11)
		-- upvalues: CryoModule (copy)
		local ConversationId = p10.conversationId
		local config = { moderationType = p10.moderationType }
		
		if ConversationId == nil then return end
		local Conversation = p11.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p11.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[FriendConversationCreatedModule.name] = function(p10, p11)
		-- upvalues: FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		if p10.oldFriendConversationId then
			p11.removeConversation(p10.oldFriendConversationId)
		end
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[FriendshipDestroyedModule.name] = function(p10, p11)
		-- upvalues: ConversationChannelsModule (copy)
		local UserId2 = if p10.userId1 == "localUserId" then if p10.userId2 == "localUserId" then nil else p10.userId2 else p10.userId1
		
		if UserId2 ~= nil then
			p11.removeConversation(ConversationChannelsModule.getFriendConversationId({ UserId2 }))
			
			return
		end
	end,
	[RequestPageConversationsModule.name] = function(_, p10)
		p10.setListStatus({ isFetchingConversations = true })
	end,
	[ReceivedPageConversationsModule.name] = function(_, p10)
		p10.setListStatus({ isFetchingConversations = false })
	end,
	[AppChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p10, p11)
		-- upvalues: FFlagAppChatDerivedConversationLatestActivityModule (copy), updateConversationFromMessages (copy), shouldMarkConversationUnreadFromMessages (copy), updateConversationLastUpdatedFromMessages (copy)
		local ConversationId = p10.queryArgs and p10.queryArgs.conversation_id
		local ResponseBody = p10.responseBody
		local Messages = ResponseBody and ResponseBody.messages
		
		if FFlagAppChatDerivedConversationLatestActivityModule then
			updateConversationFromMessages(p11, ConversationId, Messages, shouldMarkConversationUnreadFromMessages(ConversationId, Messages))
			
			return
		else
			updateConversationLastUpdatedFromMessages(p11, ConversationId, Messages, shouldMarkConversationUnreadFromMessages(ConversationId, Messages))
		end
	end,
	[ReceivedChannelsMigrationConflictModule.name] = function(_, p10)
		-- upvalues: GetConversationListStoreModule (copy)
		p10.clear()
		GetConversationListStoreModule(false).setLatestMessagesFetching(false)
	end
}

return function(Callback, _)
	-- upvalues: FFlagAppChatConversationStoreModule (copy), config1 (copy), GetConversationStoreModule (copy)
	return function(p10)
		-- upvalues: Callback (copy), FFlagAppChatConversationStoreModule (upval), config1 (upval), GetConversationStoreModule (upval)
		local CallbackResult = Callback(p10)
		
		if not FFlagAppChatConversationStoreModule then
			return CallbackResult
		end
		local Entry: (any, any) -> () = config1[p10.type]
		
		if Entry then
			Entry(p10, GetConversationStoreModule(false))
		end
		return CallbackResult
	end
end