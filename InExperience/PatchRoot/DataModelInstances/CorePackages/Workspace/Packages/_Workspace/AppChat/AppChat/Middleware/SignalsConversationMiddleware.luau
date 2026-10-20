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
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local GetPreciseUnixTimestampModule = require(AppChat.Utils.getPreciseUnixTimestamp)
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

local _ = function(p2)
	return if p2 == nil then nil elseif typeof(p2) == "DateTime" then p2.UnixTimestamp elseif type(p2) == "table" and p2.GetUnixTimestamp ~= nil then p2:GetUnixTimestamp() else nil
end

local _ = function(p2)
	if type(p2) == "string" then
		local Success, Result = pcall(function()
			-- upvalues: p2 (copy)
			return DateTime.fromIsoDate(p2)
		end)
		
		return if Success then Result else nil
	else
		return nil
	end
end

local _ = function(p2)
	if p2.sent == nil then
		local CreatedAt = p2.created_at or p2.createdAt
		
		if type(CreatedAt) == "string" then
			local Success1, Result1 = pcall(function()
				-- upvalues: CreatedAt (copy)
				return DateTime.fromIsoDate(CreatedAt)
			end)
			
			return if Success1 then Result1 else nil
		else
			return nil
		end
	elseif type(p2.sent) ~= "string" then
		return p2.sent
	else
		local Sent = p2.sent
		
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

local _ = function(p2)
	return if p2.isPreviewable == nil then p2.is_previewable ~= nil and p2.is_previewable else p2.isPreviewable
end

local function getNewestMessageUnixTime(p2)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy)
	if p2 == nil then
		return 0
	end
	local ConversationMessageViewModelStoreModule = GetConversationMessageViewModelStoreModule(false)
	local OrderedId = ConversationMessageViewModelStoreModule.conversationMessageListStore.getOrderedIds(p2, false)[1]
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

local _ = function(p2)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy)
	if p2.previewMessageId == nil then
		return 0
	end
	local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(p2.previewMessageId, false)
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

local function updateConversationLastUpdatedFromMessages(p2, ConversationId, Messages, ShouldMarkConversationUnread)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), SearchIntroducedConversationIdsModule (copy), CryoModule (copy)
	if ConversationId == nil or Messages == nil then return end
	local Conversation = p2.getConversation(ConversationId, false)
	
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

local function hasPreviewableMessageNewerThan(List, p3): boolean
	-- upvalues: GetPreciseUnixTimestampModule (copy)
	for _, value in List do
		if value ~= nil and (if value.isPreviewable == nil then value.is_previewable ~= nil and value.is_previewable else value.isPreviewable) then
			local Sent1 = nil
			if value.sent == nil then
				local CreatedAt = value.created_at or value.createdAt
				
				if type(CreatedAt) == "string" then
					local Success1, Result1 = pcall(function()
						-- upvalues: CreatedAt (copy)
						return DateTime.fromIsoDate(CreatedAt)
					end)
					Sent1 = if Success1 then Result1 else nil
				else
					Sent1 = nil
				end
			elseif type(value.sent) == "string" then
				local Sent = value.sent
				
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
				Sent1 = value.sent
			end
			if p3 < (GetPreciseUnixTimestampModule(Sent1) or 0) then
				return true
			end
		end
	end
	return false
end

local function updateConversationFromMessages(p4, ConversationId, Messages, ShouldMarkConversationUnread)
	-- upvalues: FFlagAppChatAnyServerSideConversationSearchModule (copy), SearchIntroducedConversationIdsModule (copy), hasPreviewableMessageNewerThan (copy), GetPreciseUnixTimestampModule (copy), CryoModule (copy)
	if ConversationId == nil or Messages == nil then return end
	local Conversation = p4.getConversation(ConversationId, false)
	
	if Conversation == nil then return end
	local Flag = false
	
	if FFlagAppChatAnyServerSideConversationSearchModule and SearchIntroducedConversationIdsModule.has(ConversationId) and hasPreviewableMessageNewerThan(Messages, GetPreciseUnixTimestampModule(Conversation.lastUpdated) or 0) then
		SearchIntroducedConversationIdsModule.remove(ConversationId)
		Flag = true
	end
	local t = {}
	
	if ShouldMarkConversationUnread then
		t.hasUnreadMessages = true
	end
	if Flag or ShouldMarkConversationUnread then
		if ConversationId == nil then return end
		local Conversation1 = p4.getConversation(ConversationId, false)
		
		if Conversation1 == nil then return end
		p4.upsertConversation(CryoModule.Dictionary.join(Conversation1, t), false)
	end
end

local _ = function(p4): boolean
	local QueryArgs = if p4 == nil then nil else p4.queryArgs
	
	if type(QueryArgs) ~= "table" then
		return true
	elseif QueryArgs.pageNumber == nil then
		local Cursor = QueryArgs.cursor
		
		return Cursor == nil or Cursor == ""
	else
		return QueryArgs.pageNumber == 1
	end
end

local _ = function(p4, p5)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
	if not FFlagAppChatConversationLoadRetryModule then return end
	p5.error = CryoModule.None
	p5.isFetchingNextPage = false
	local QueryArgs = if p4 == nil then nil else p4.queryArgs
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
		p5.hasFetchedInitialPage = true
	end
end

local _ = function(p4, p5)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy)
	if not FFlagAppChatConversationLoadRetryModule then return end
	p5.isFetchingNextPage = false
	local QueryArgs = if p4 == nil then nil else p4.queryArgs
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
		p5.error = p4 == nil or p4.error == nil or p4.error
	end
end

local function handleGetUserConversationsFailed(p4, p5)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy)
	local config = { isFetchingConversations = false }
	
	if FFlagAppChatConversationLoadRetryModule then
		config.isFetchingNextPage = false
		local QueryArgs = if p4 == nil then nil else p4.queryArgs
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
			config.error = p4 == nil or p4.error == nil or p4.error
		end
	end
	p5.setListStatus(config)
end

local function handleGetConversationDetailsSucceeded(p4, p5)
	-- upvalues: upsertConversationResponses (copy)
	upsertConversationResponses(p5, p4.responseBody)
end

local config1 = {
	[AppChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p4, p5)
		-- upvalues: upsertConversationResponse (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		local ResponseBody = p4.responseBody
		upsertConversationResponse(p5, ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1]))
		
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[AppChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p4, p5)
		-- upvalues: upsertConversationResponse (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		local ResponseBody = p4.responseBody
		upsertConversationResponse(p5, ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1]))
		
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p4, p5)
		-- upvalues: upsertConversationResponses (copy), FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
		upsertConversationResponses(p5, p4.responseBody)
		local NextCursor = p4.responseBody and p4.responseBody.next_cursor
		local config = { isFetchingConversations = false }
		
		if NextCursor == nil or NextCursor == "" then
			config.oldestConversationIsFetched = true
		end
		if FFlagAppChatConversationLoadRetryModule then
			config.error = CryoModule.None
			config.isFetchingNextPage = false
			local QueryArgs = if p4 == nil then nil else p4.queryArgs
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
		p5.setListStatus(config)
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[AppChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p4, p5)
		-- upvalues: CryoModule (copy)
		local ConversationIds = p4.postBody and p4.postBody.conversation_ids
		
		if ConversationIds == nil then return end
		for _, conversationId in ConversationIds do
			local config = { hasUnreadMessages = false }
			local v1 = conversationId == nil
			local Conversation = nil
			
			if not v1 then
				Conversation = p5.getConversation(conversationId, false)
				v1 = Conversation == nil
			end
			if not v1 then
				p5.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			end
		end
	end,
	[AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p6, p7)
		local ResponseBody = p6.responseBody
		
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
			p7.setParticipantMetadata(i, t)
		end
	end,
	[AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p8, p9)
		-- upvalues: ConstantsModule (copy), config (copy), ConversationChannelsModule (copy), CryoModule (copy)
		local PostBody = p8.postBody
		
		if PostBody == nil or PostBody.action_type ~= ConstantsModule.ModalAction.Accept then return end
		local Entry = config[PostBody.modal_variant]
		
		if Entry == nil then return end
		local ConversationId = PostBody.conversation_id or ConversationChannelsModule.getFriendConversationId({ PostBody.friend_id })
		local config1 = { [Entry.field] = Entry.value }
		
		if ConversationId == nil then return end
		local Conversation = p9.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p9.upsertConversation(CryoModule.Dictionary.join(Conversation, config1), false)
			
			return
		end
	end,
	[NetworkingChatModule.GetUserConversations.Succeeded.name] = function(p8, p9)
		-- upvalues: ConversationModule (copy), FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
		local ResponseBody = p8.responseBody
		
		if ResponseBody == nil then return end
		for _, value in ipairs(ResponseBody) do
			p9.upsertConversation(ConversationModule.fromWeb(value))
		end
		local config = { isFetchingConversations = false }
		
		if FFlagAppChatConversationLoadRetryModule then
			config.error = CryoModule.None
			config.isFetchingNextPage = false
			local QueryArgs = if p8 == nil then nil else p8.queryArgs
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
		p9.setListStatus(config)
		local PageSize = p8.queryArgs and p8.queryArgs.pageSize
		
		if PageSize ~= nil and #ResponseBody < PageSize then
			p9.setListStatus({ oldestConversationIsFetched = true })
		end
	end,
	[NetworkingChatModule.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[require(AppChat.Http.NetworkingBlocking).BlockUserById.Succeeded.name] = function(p10, p11)
		-- upvalues: ConversationChannelsModule (copy)
		local Users = p10.namedIds and p10.namedIds.users
		
		if Users == nil then return end
		local Text = tostring(Users)
		
		for _, value in p11.getConversations(false) do
			local Participants = value.participants or {}
			
			if value.type == ConversationChannelsModule.Type.OneToOne and table.find(Participants, Text) then
				p11.removeConversation(value.id)
			end
		end
		p11.removeConversation(ConversationChannelsModule.getFriendConversationId({ Text }))
	end,
	[require(AppChat.Conversations.Actions.ReceivedConversation).name] = function(p12, p13)
		p13.upsertConversation(p12.conversation)
	end,
	[require(AppChat.Conversations).Actions.ReceivedMessages.name] = function(p12, p13)
		-- upvalues: FFlagAppChatDerivedConversationLatestActivityModule (copy), updateConversationFromMessages (copy), updateConversationLastUpdatedFromMessages (copy)
		if FFlagAppChatDerivedConversationLatestActivityModule then
			updateConversationFromMessages(p13, p12.conversationId, p12.messages, p12.shouldMarkConversationUnread)
			
			return
		else
			updateConversationLastUpdatedFromMessages(p13, p12.conversationId, p12.messages, p12.shouldMarkConversationUnread)
		end
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p12, p13)
		if p12.conversationId then
			p13.removeConversation(p12.conversationId)
		end
	end,
	[require(AppChat.Conversations.Actions.RenamedGroupConversation).name] = function(p12, p13)
		-- upvalues: CryoModule (copy)
		local ConversationId = p12.conversationId
		local config = {
			lastUpdated = p12.lastUpdated,
			title = p12.title,
			isDefaultTitle = p12.isDefaultTitle
		}
		
		if ConversationId == nil then return end
		local Conversation = p13.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p13.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ChangedParticipants).name] = function(p12, p13)
		-- upvalues: CryoModule (copy)
		local ConversationId = p12.conversationId
		local config = {
			participants = p12.participants,
			lastUpdated = p12.lastUpdated,
			title = p12.title
		}
		
		if ConversationId == nil then return end
		local Conversation = p13.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p13.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetUserTyping).name] = function(p12, p13)
		local Conversation = p12.conversationId and p13.getConversation(p12.conversationId, false)
		
		if Conversation ~= nil then
			local Copy = table.clone(Conversation.usersTyping or {})
			Copy[p12.userId] = p12.value
			p13.setUsersTyping(p12.conversationId, Copy)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ConversationModerationTypeChanged).name] = function(p12, p13)
		-- upvalues: CryoModule (copy)
		local ConversationId = p12.conversationId
		local config = { moderationType = p12.moderationType }
		
		if ConversationId == nil then return end
		local Conversation = p13.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p13.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.FriendConversationCreated).name] = function(p12, p13)
		-- upvalues: FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		if p12.oldFriendConversationId then
			p13.removeConversation(p12.oldFriendConversationId)
		end
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[require(AppChat.Actions.FriendshipDestroyed).name] = function(p12, p13)
		-- upvalues: ConversationChannelsModule (copy)
		local UserId2 = if p12.userId1 == "localUserId" then if p12.userId2 == "localUserId" then nil else p12.userId2 else p12.userId1
		
		if UserId2 ~= nil then
			p13.removeConversation(ConversationChannelsModule.getFriendConversationId({ UserId2 }))
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.RequestPageConversations).name] = function(_, p12)
		p12.setListStatus({ isFetchingConversations = true })
	end,
	[require(AppChat.Conversations.Actions.ReceivedPageConversations).name] = function(_, p12)
		p12.setListStatus({ isFetchingConversations = false })
	end,
	[AppChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p12, p13)
		-- upvalues: FFlagAppChatDerivedConversationLatestActivityModule (copy), updateConversationFromMessages (copy), shouldMarkConversationUnreadFromMessages (copy), updateConversationLastUpdatedFromMessages (copy)
		local ConversationId = p12.queryArgs and p12.queryArgs.conversation_id
		local ResponseBody = p12.responseBody
		local Messages = ResponseBody and ResponseBody.messages
		
		if FFlagAppChatDerivedConversationLatestActivityModule then
			updateConversationFromMessages(p13, ConversationId, Messages, (shouldMarkConversationUnreadFromMessages(ConversationId, Messages)))
			
			return
		else
			updateConversationLastUpdatedFromMessages(p13, ConversationId, Messages, (shouldMarkConversationUnreadFromMessages(ConversationId, Messages)))
		end
	end,
	[require(AppChat.Conversations.Actions.ReceivedChannelsMigrationConflict).name] = function(_, p12)
		-- upvalues: GetConversationListStoreModule (copy)
		p12.clear()
		GetConversationListStoreModule(false).setLatestMessagesFetching(false)
	end
}

return function(Callback, _)
	-- upvalues: FFlagAppChatConversationStoreModule (copy), config1 (copy), GetConversationStoreModule (copy)
	return function(p12)
		-- upvalues: Callback (copy), FFlagAppChatConversationStoreModule (upval), config1 (upval), GetConversationStoreModule (upval)
		local CallbackResult = Callback(p12)
		
		if not FFlagAppChatConversationStoreModule then
			return CallbackResult
		end
		local Entry: (any, any) -> () = config1[p12.type]
		
		if Entry then
			Entry(p12, GetConversationStoreModule(false))
		end
		return CallbackResult
	end
end