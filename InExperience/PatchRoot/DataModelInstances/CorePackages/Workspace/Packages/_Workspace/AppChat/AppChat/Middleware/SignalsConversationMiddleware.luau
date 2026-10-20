local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local ConstantsModule = require(AppChat.Constants)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local ConversationModule = require(AppChat.Models.Conversation)
local MessageModelModule = require(AppChat.Models.MessageModel)
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

local function messagesFromWebResponse(p2, ChatMessages)
	-- upvalues: MessageModelModule (copy)
	if ChatMessages == nil then
		return {}
	end
	local Id = nil
	local FromWebResults = {}
	
	for i = #ChatMessages, 1, -1 do
		local ChatMessage = ChatMessages[i]
		local FromWebResult = MessageModelModule.fromWeb(ChatMessage, p2, Id)
		
		if FromWebResult ~= nil then
			FromWebResult.isPreviewable = ChatMessage.is_previewable
			FromWebResult.isBadgeable = ChatMessage.is_badgeable
			Id = FromWebResult.id
			table.insert(FromWebResults, 1, FromWebResult)
		end
	end
	return FromWebResults
end

local _ = function(p3)
	return if p3.isPreviewable == nil then p3.is_previewable ~= nil and p3.is_previewable else p3.isPreviewable
end

local function getNewestMessageUnixTime(p3)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy)
	if p3 == nil then
		return 0
	end
	local ConversationMessageViewModelStoreModule = GetConversationMessageViewModelStoreModule(false)
	local OrderedId = ConversationMessageViewModelStoreModule.conversationMessageListStore.getOrderedIds(p3, false)[1]
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

local _ = function(p3)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy)
	if p3.previewMessageId == nil then
		return 0
	end
	local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(p3.previewMessageId, false)
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

local function updateConversationLastUpdatedFromMessages(p3, ConversationId, Messages, ShouldMarkConversationUnread)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), SearchIntroducedConversationIdsModule (copy), CryoModule (copy)
	if ConversationId == nil or Messages == nil then return end
	local Conversation = p3.getConversation(ConversationId, false)
	
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
		local Conversation1 = p3.getConversation(ConversationId, false)
		
		if Conversation1 ~= nil then
			p3.upsertConversation(CryoModule.Dictionary.join(Conversation1, config), false)
			
			return
		end
		return
	elseif ShouldMarkConversationUnread then
		local config = { hasUnreadMessages = true }
		
		if ConversationId == nil then return end
		local Conversation2 = p3.getConversation(ConversationId, false)
		
		if Conversation2 == nil then return end
		p3.upsertConversation(CryoModule.Dictionary.join(Conversation2, config), false)
	end
end

local function hasPreviewableMessageNewerThan(List, p4): boolean
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
			if p4 < (GetPreciseUnixTimestampModule(Sent1) or 0) then
				return true
			end
		end
	end
	return false
end

local function updateConversationFromMessages(p5, ConversationId, Messages, ShouldMarkConversationUnread)
	-- upvalues: FFlagAppChatAnyServerSideConversationSearchModule (copy), SearchIntroducedConversationIdsModule (copy), hasPreviewableMessageNewerThan (copy), GetPreciseUnixTimestampModule (copy), CryoModule (copy)
	if ConversationId == nil or Messages == nil then return end
	local Conversation = p5.getConversation(ConversationId, false)
	
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
		local Conversation1 = p5.getConversation(ConversationId, false)
		
		if Conversation1 == nil then return end
		p5.upsertConversation(CryoModule.Dictionary.join(Conversation1, t), false)
	end
end

local _ = function(p5): boolean
	local QueryArgs = if p5 == nil then nil else p5.queryArgs
	
	if type(QueryArgs) ~= "table" then
		return true
	elseif QueryArgs.pageNumber == nil then
		local Cursor = QueryArgs.cursor
		
		return Cursor == nil or Cursor == ""
	else
		return QueryArgs.pageNumber == 1
	end
end

local _ = function(p5, p6)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
	if not FFlagAppChatConversationLoadRetryModule then return end
	p6.error = CryoModule.None
	p6.isFetchingNextPage = false
	local QueryArgs = if p5 == nil then nil else p5.queryArgs
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
		p6.hasFetchedInitialPage = true
	end
end

local _ = function(p5, p6)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy)
	if not FFlagAppChatConversationLoadRetryModule then return end
	p6.isFetchingNextPage = false
	local QueryArgs = if p5 == nil then nil else p5.queryArgs
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
		p6.error = p5 == nil or p5.error == nil or p5.error
	end
end

local function handleGetUserConversationsFailed(p5, p6)
	-- upvalues: FFlagAppChatConversationLoadRetryModule (copy)
	local config = { isFetchingConversations = false }
	
	if FFlagAppChatConversationLoadRetryModule then
		config.isFetchingNextPage = false
		local QueryArgs = if p5 == nil then nil else p5.queryArgs
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
			config.error = p5 == nil or p5.error == nil or p5.error
		end
	end
	p6.setListStatus(config)
end

local function handleGetConversationDetailsSucceeded(p5, p6)
	-- upvalues: upsertConversationResponses (copy)
	upsertConversationResponses(p6, p5.responseBody)
end

local function handleLegacyGetUserConversationsSucceeded(p5, p6)
	-- upvalues: ConversationModule (copy), FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
	local ResponseBody = p5.responseBody
	
	if ResponseBody == nil then return end
	for _, value in ipairs(ResponseBody) do
		p6.upsertConversation(ConversationModule.fromWeb(value))
	end
	local config = { isFetchingConversations = false }
	
	if FFlagAppChatConversationLoadRetryModule then
		config.error = CryoModule.None
		config.isFetchingNextPage = false
		local QueryArgs = if p5 == nil then nil else p5.queryArgs
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
	p6.setListStatus(config)
	local PageSize = p5.queryArgs and p5.queryArgs.pageSize
	
	if PageSize ~= nil and #ResponseBody < PageSize then
		p6.setListStatus({ oldestConversationIsFetched = true })
	end
end

local config1 = {
	[AppChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = function(p7, p8)
		-- upvalues: upsertConversationResponse (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		local ResponseBody = p7.responseBody
		upsertConversationResponse(p8, ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1]))
		
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[AppChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = function(p7, p8)
		-- upvalues: upsertConversationResponse (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		local ResponseBody = p7.responseBody
		upsertConversationResponse(p8, ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1]))
		
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = function(p7, p8)
		-- upvalues: upsertConversationResponses (copy), FFlagAppChatConversationLoadRetryModule (copy), CryoModule (copy)
		upsertConversationResponses(p8, p7.responseBody)
		local NextCursor = p7.responseBody and p7.responseBody.next_cursor
		local config = { isFetchingConversations = false }
		
		if NextCursor == nil or NextCursor == "" then
			config.oldestConversationIsFetched = true
		end
		if FFlagAppChatConversationLoadRetryModule then
			config.error = CryoModule.None
			config.isFetchingNextPage = false
			local QueryArgs = if p7 == nil then nil else p7.queryArgs
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
		p8.setListStatus(config)
	end,
	[AppChatNetworkingModule.rodux.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[AppChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[AppChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p7, p8)
		-- upvalues: CryoModule (copy)
		local ConversationIds = p7.postBody and p7.postBody.conversation_ids
		
		if ConversationIds == nil then return end
		for _, conversationId in ConversationIds do
			local config = { hasUnreadMessages = false }
			local v1 = conversationId == nil
			local Conversation = nil
			
			if not v1 then
				Conversation = p8.getConversation(conversationId, false)
				v1 = Conversation == nil
			end
			if not v1 then
				p8.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			end
		end
	end,
	[AppChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p9, p10)
		local ResponseBody = p9.responseBody
		
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
			p10.setParticipantMetadata(i, t)
		end
	end,
	[AppChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p11, p12)
		-- upvalues: ConstantsModule (copy), config (copy), ConversationChannelsModule (copy), CryoModule (copy)
		local PostBody = p11.postBody
		
		if PostBody == nil or PostBody.action_type ~= ConstantsModule.ModalAction.Accept then return end
		local Entry = config[PostBody.modal_variant]
		
		if Entry == nil then return end
		local ConversationId = PostBody.conversation_id or ConversationChannelsModule.getFriendConversationId({ PostBody.friend_id })
		local config1 = { [Entry.field] = Entry.value }
		
		if ConversationId == nil then return end
		local Conversation = p12.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p12.upsertConversation(CryoModule.Dictionary.join(Conversation, config1), false)
			
			return
		end
	end,
	[NetworkingChatModule.GetUserConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[NetworkingChatModule.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[NetworkingChatModule.GetConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[NetworkingChatModule.GetConversations.Failed.name] = handleGetUserConversationsFailed,
	[NetworkingChatModule.GetLatestMessages.Succeeded.name] = function(p11, p12)
		-- upvalues: FFlagAppChatDerivedConversationLatestActivityModule (copy), updateConversationFromMessages (copy), messagesFromWebResponse (copy), updateConversationLastUpdatedFromMessages (copy)
		local ResponseBody = p11.responseBody
		
		if ResponseBody == nil then return end
		for _, value in ipairs(ResponseBody) do
			local Text = tostring(value.conversationId)
			
			if FFlagAppChatDerivedConversationLatestActivityModule then
				updateConversationFromMessages(p12, Text, (messagesFromWebResponse(Text, value.chatMessages)))
			else
				updateConversationLastUpdatedFromMessages(p12, Text, (messagesFromWebResponse(Text, value.chatMessages)))
			end
		end
	end,
	[NetworkingChatModule.MarkAsRead.Succeeded.name] = function(p13, p14)
		-- upvalues: CryoModule (copy)
		local ConversationId = p13.postBody and p13.postBody.conversationId
		local config = { hasUnreadMessages = false }
		
		if ConversationId == nil then return end
		local Conversation = p14.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p14.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Http.NetworkingBlocking).BlockUserById.Succeeded.name] = function(p13, p14)
		-- upvalues: ConversationChannelsModule (copy)
		local Users = p13.namedIds and p13.namedIds.users
		
		if Users == nil then return end
		local Text = tostring(Users)
		
		for _, value in p14.getConversations(false) do
			local Participants = value.participants or {}
			
			if value.type == ConversationChannelsModule.Type.OneToOne and table.find(Participants, Text) then
				p14.removeConversation(value.id)
			end
		end
		p14.removeConversation(ConversationChannelsModule.getFriendConversationId({ Text }))
	end,
	[require(AppChat.Conversations.Actions.ReceivedConversation).name] = function(p15, p16)
		p16.upsertConversation(p15.conversation)
	end,
	[require(AppChat.Conversations).Actions.ReceivedMessages.name] = function(p15, p16)
		-- upvalues: FFlagAppChatDerivedConversationLatestActivityModule (copy), updateConversationFromMessages (copy), updateConversationLastUpdatedFromMessages (copy)
		if FFlagAppChatDerivedConversationLatestActivityModule then
			updateConversationFromMessages(p16, p15.conversationId, p15.messages, p15.shouldMarkConversationUnread)
			
			return
		else
			updateConversationLastUpdatedFromMessages(p16, p15.conversationId, p15.messages, p15.shouldMarkConversationUnread)
		end
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p15, p16)
		if p15.conversationId then
			p16.removeConversation(p15.conversationId)
		end
	end,
	[require(AppChat.Conversations.Actions.RenamedGroupConversation).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local ConversationId = p15.conversationId
		local config = {
			lastUpdated = p15.lastUpdated,
			title = p15.title,
			isDefaultTitle = p15.isDefaultTitle
		}
		
		if ConversationId == nil then return end
		local Conversation = p16.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ChangedParticipants).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local ConversationId = p15.conversationId
		local config = {
			participants = p15.participants,
			lastUpdated = p15.lastUpdated,
			title = p15.title
		}
		
		if ConversationId == nil then return end
		local Conversation = p16.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.HasUnreadMessages).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local Id = p15.conversation and p15.conversation.id
		local config = { hasUnreadMessages = true }
		
		if Id == nil then return end
		local Conversation = p16.getConversation(Id, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ReadConversation).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local ConversationId = p15.conversationId
		local config = { hasUnreadMessages = false }
		
		if ConversationId == nil then return end
		local Conversation = p16.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetUserTyping).name] = function(p15, p16)
		local Conversation = p15.conversationId and p16.getConversation(p15.conversationId, false)
		
		if Conversation ~= nil then
			local Copy = table.clone(Conversation.usersTyping or {})
			Copy[p15.userId] = p15.value
			p16.setUsersTyping(p15.conversationId, Copy)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetConversationLoadingStatus).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local ConversationId = p15.conversationId
		local config = { initialLoadingStatus = p15.value }
		
		if ConversationId == nil then return end
		local Conversation = p16.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetUserLeavingConversation).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local Id = p15.id
		local config = { isUserLeaving = p15.isLeaving }
		
		if Id == nil then return end
		local Conversation = p16.getConversation(Id, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.SetPinnedGameForConversation).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local ConversationId = p15.conversationId
		local config = {
			pinnedGame = {
				rootPlaceId = p15.rootPlaceId,
				universeId = p15.universeId
			}
		}
		
		if ConversationId == nil then return end
		local Conversation = p16.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.ConversationModerationTypeChanged).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		local ConversationId = p15.conversationId
		local config = { moderationType = p15.moderationType }
		
		if ConversationId == nil then return end
		local Conversation = p16.getConversation(ConversationId, false)
		
		if Conversation ~= nil then
			p16.upsertConversation(CryoModule.Dictionary.join(Conversation, config), false)
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.FriendConversationCreated).name] = function(p15, p16)
		-- upvalues: FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
		if p15.oldFriendConversationId then
			p16.removeConversation(p15.oldFriendConversationId)
		end
		if FFlagAppChatAnyServerSideConversationSearchModule then
			GetConversationSearchDataHydrationModule(false).invalidate()
		end
	end,
	[require(AppChat.Actions.FriendshipDestroyed).name] = function(p15, p16)
		-- upvalues: ConversationChannelsModule (copy)
		local UserId2 = if p15.userId1 == "localUserId" then if p15.userId2 == "localUserId" then nil else p15.userId2 else p15.userId1
		
		if UserId2 ~= nil then
			p16.removeConversation(ConversationChannelsModule.getFriendConversationId({ UserId2 }))
			
			return
		end
	end,
	[require(AppChat.Conversations.Actions.RequestPageConversations).name] = function(_, p15)
		p15.setListStatus({ isFetchingConversations = true })
	end,
	[require(AppChat.Conversations.Actions.ReceivedPageConversations).name] = function(_, p15)
		p15.setListStatus({ isFetchingConversations = false })
	end,
	[require(AppChat.Conversations.Actions.RequestLatestMessages).name] = function(_, _)
		-- upvalues: GetConversationListStoreModule (copy)
		GetConversationListStoreModule(false).setLatestMessagesFetching(true)
	end,
	[require(AppChat.Conversations.Actions.ReceivedLatestMessages).name] = function(_, _)
		-- upvalues: GetConversationListStoreModule (copy)
		GetConversationListStoreModule(false).setLatestMessagesFetching(false)
	end,
	[AppChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p15, p16)
		-- upvalues: FFlagAppChatDerivedConversationLatestActivityModule (copy), updateConversationFromMessages (copy), shouldMarkConversationUnreadFromMessages (copy), updateConversationLastUpdatedFromMessages (copy)
		local ConversationId = p15.queryArgs and p15.queryArgs.conversation_id
		local ResponseBody = p15.responseBody
		local Messages = ResponseBody and ResponseBody.messages
		
		if FFlagAppChatDerivedConversationLatestActivityModule then
			updateConversationFromMessages(p16, ConversationId, Messages, (shouldMarkConversationUnreadFromMessages(ConversationId, Messages)))
			
			return
		else
			updateConversationLastUpdatedFromMessages(p16, ConversationId, Messages, (shouldMarkConversationUnreadFromMessages(ConversationId, Messages)))
		end
	end,
	[require(AppChat.Conversations.Actions.ReceivedOldestConversation).name] = function(_, p15)
		p15.setListStatus({ oldestConversationIsFetched = true })
	end,
	[require(AppChat.Conversations.Actions.ReceivedChannelsMigrationConflict).name] = function(_, p15)
		-- upvalues: GetConversationListStoreModule (copy)
		p15.clear()
		GetConversationListStoreModule(false).setLatestMessagesFetching(false)
	end
}

return function(Callback, _)
	-- upvalues: FFlagAppChatConversationStoreModule (copy), config1 (copy), GetConversationStoreModule (copy)
	return function(p15)
		-- upvalues: Callback (copy), FFlagAppChatConversationStoreModule (upval), config1 (upval), GetConversationStoreModule (upval)
		local CallbackResult = Callback(p15)
		
		if not FFlagAppChatConversationStoreModule then
			return CallbackResult
		end
		local Entry: (any, any) -> () = config1[p15.type]
		
		if Entry then
			Entry(p15, GetConversationStoreModule(false))
		end
		return CallbackResult
	end
end