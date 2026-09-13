local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local constantsModule = require(appChat.Constants)
local conversationsModule = require(appChat.Conversations)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local conversationModule = require(appChat.Models.Conversation)
local messageModelModule = require(appChat.Models.MessageModel)
local getConversationMessageViewModelStoreModule = require(appChat.Stores.GetConversationMessageViewModelStore)
local getConversationListStoreModule = require(appChat.Stores.GetConversationListStore)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local networkingBlockingModule = require(appChat.Http.NetworkingBlocking)
local networkingChatModule = require(appChat.Http.NetworkingChat)
local changedParticipantsModule = require(appChat.Conversations.Actions.ChangedParticipants)
local conversationModerationTypeChangedModule = require(appChat.Conversations.Actions.ConversationModerationTypeChanged)
local friendConversationCreatedModule = require(appChat.Conversations.Actions.FriendConversationCreated)
local friendshipDestroyedModule = require(appChat.Actions.FriendshipDestroyed)
local hasUnreadMessagesModule = require(appChat.Conversations.Actions.HasUnreadMessages)
local readConversationModule = require(appChat.Conversations.Actions.ReadConversation)
local receivedChannelsMigrationConflictModule = require(appChat.Conversations.Actions.ReceivedChannelsMigrationConflict)
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local receivedLatestMessagesModule = require(appChat.Conversations.Actions.ReceivedLatestMessages)
local receivedOldestConversationModule = require(appChat.Conversations.Actions.ReceivedOldestConversation)
local receivedPageConversationsModule = require(appChat.Conversations.Actions.ReceivedPageConversations)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local renamedGroupConversationModule = require(appChat.Conversations.Actions.RenamedGroupConversation)
local requestLatestMessagesModule = require(appChat.Conversations.Actions.RequestLatestMessages)
local requestPageConversationsModule = require(appChat.Conversations.Actions.RequestPageConversations)
local receivedMessages = conversationsModule.Actions.ReceivedMessages
local setConversationLoadingStatusModule = require(appChat.Conversations.Actions.SetConversationLoadingStatus)
local setPinnedGameForConversationModule = require(appChat.Conversations.Actions.SetPinnedGameForConversation)
local setUserLeavingConversationModule = require(appChat.Conversations.Actions.SetUserLeavingConversation)
local setUserTypingModule = require(appChat.Conversations.Actions.SetUserTyping)
local fFlagAppChatConversationStoreModule = require(appChat.Flags.FFlagAppChatConversationStore)
local t = {
	[constantsModule.OptInVariant.OsaContextCard] = {
		field = "osaAcknowledgementStatus",
		value = conversationChannelsModule.OsaAcknowledgementStatus.Acknowledged
	},
	[constantsModule.OptInVariant.ChatOptInInfoCard] = {
		field = "userOptedIntoChatMessages",
		value = conversationChannelsModule.UserOptedIntoChatMessagesStatus.OptedIn
	}
}

local function _(p1, p2)
	-- upvalues: conversationChannelsModule (ref)
	if p2 == nil or p2.status == "failed" then
		return
	end
	p1.upsertConversation(conversationChannelsModule.fromChannelsApi(p2))
end

local _ = function(p1, p2)
	-- upvalues: conversationChannelsModule (ref)
	if p2 == nil or p2.conversations == nil then return end
	for i, v in p2.conversations do
		if v ~= nil and v.status ~= "failed" then
			p1.upsertConversation(conversationChannelsModule.fromChannelsApi(v))
		end
	end
end

local _ = function(p3, p4, p5)
	-- upvalues: cryoModule (ref)
	if p4 == nil then return end
	local conversation = p3.getConversation(p4, false)
	
	if conversation == nil then
		return
	end
	p3.upsertConversation(cryoModule.Dictionary.join(conversation, p5), false)
end

local _ = function(p3)
	return if p3 == nil then nil elseif typeof(p3) == "DateTime" then p3.UnixTimestamp elseif type(p3) == "table" and p3.GetUnixTimestamp ~= nil then p3:GetUnixTimestamp() else nil
end

local _ = function(p3)
	if type(p3) ~= "string" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: p3 (ref)
		return DateTime.fromIsoDate(p3)
	end)
	
	return if ok then status else nil
end

local _ = function(p3)
	if p3.sent == nil then
		local createdAt = p3.created_at or p3.createdAt
		
		if type(createdAt) ~= "string" then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: createdAt (ref)
			return DateTime.fromIsoDate(createdAt)
		end)
		
		return if ok then status else nil
	elseif type(p3.sent) == "string" then
		local sent = p3.sent
		
		if type(sent) ~= "string" then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: sent (ref)
			return DateTime.fromIsoDate(sent)
		end)
		
		return if ok then status else nil
	else
		return p3.sent
	end
end

local function messagesFromWebResponse(p3, p4)
	-- upvalues: messageModelModule (ref)
	if p4 == nil then
		return {}
	end
	local id = nil
	local t = {}
	
	for i = #p4, 1, -1 do
		local var1 = p4[i]
		local var2 = messageModelModule.fromWeb(var1, p3, id)
		
		if var2 ~= nil then
			var2.isPreviewable = var1.is_previewable
			var2.isBadgeable = var1.is_badgeable
			id = var2.id
			table.insert(t, 1, var2)
		end
	end
	return t
end

local _ = function(p5)
	return if p5.isPreviewable == nil then if p5.is_previewable == nil then false else p5.is_previewable else p5.isPreviewable
end

local function getNewestMessageUnixTime(p5)
	-- upvalues: getConversationMessageViewModelStoreModule (ref)
	if p5 == nil then
		return 0
	end
	local var3 = getConversationMessageViewModelStoreModule(false)
	local var4 = var3.conversationMessageListStore.getOrderedIds(p5, false)[1]
	local var5 = var4 and var3.conversationMessageStore.getMessage(var4, false)
	local var6 = var5
	
	if var6 then
		if var5.sent == nil then
			local createdAt = var5.created_at or var5.createdAt
			
			if type(createdAt) == "string" then
				local ok, status = pcall(function()
					-- upvalues: createdAt (ref)
					return DateTime.fromIsoDate(createdAt)
				end)
				var6 = if ok then status else nil
			else
				var6 = nil
			end
		elseif type(var5.sent) == "string" then
			local sent = var5.sent
			
			if type(sent) == "string" then
				local ok, status = pcall(function()
					-- upvalues: sent (ref)
					return DateTime.fromIsoDate(sent)
				end)
				var6 = if ok then status else nil
			else
				var6 = nil
			end
		else
			var6 = var5.sent
		end
	end
	return (if var6 == nil then nil elseif typeof(var6) == "DateTime" then var6.UnixTimestamp elseif type(var6) == "table" and var6.GetUnixTimestamp ~= nil then var6:GetUnixTimestamp() else nil) or 0
end

local function shouldMarkConversationUnreadFromMessages(p5, p6)
	-- upvalues: getNewestMessageUnixTime (ref), playersService (ref)
	if p6 == nil then
		return false
	end
	local var3 = getNewestMessageUnixTime(p5)
	local var4 = tostring(playersService.LocalPlayer.UserId)
	
	for i, v in p6 do
		local var5
		if v.sent == nil then
			local createdAt = v.created_at or v.createdAt
			
			if type(createdAt) == "string" then
				local ok, status = pcall(function()
					-- upvalues: createdAt (ref)
					return DateTime.fromIsoDate(createdAt)
				end)
				var5 = if ok then status else nil
			else
				var5 = nil
			end
		elseif type(v.sent) == "string" then
			local sent = v.sent
			
			if type(sent) == "string" then
				local ok, status = pcall(function()
					-- upvalues: sent (ref)
					return DateTime.fromIsoDate(sent)
				end)
				var5 = if ok then status else nil
			else
				var5 = nil
			end
		else
			var5 = v.sent
		end
		local var6 = if var5 == nil then nil elseif typeof(var5) == "DateTime" then var5.UnixTimestamp elseif type(var5) == "table" and var5.GetUnixTimestamp ~= nil then var5:GetUnixTimestamp() else nil
		var5 = v.sender_user_id or v.senderTargetId
		
		if var6 ~= nil and var3 < var6 and (var5 ~= nil and tostring(var5) ~= var4) and v.is_badgeable == true then
			return true
		end
	end
	return false
end

local _ = function(p7)
	-- upvalues: getConversationMessageViewModelStoreModule (ref)
	if p7.previewMessageId == nil then
		return 0
	end
	local message = getConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(p7.previewMessageId, false)
	local var7 = message
	
	if var7 then
		if message.sent == nil then
			local createdAt = message.created_at or message.createdAt
			
			if type(createdAt) == "string" then
				local ok, status = pcall(function()
					-- upvalues: createdAt (ref)
					return DateTime.fromIsoDate(createdAt)
				end)
				var7 = if ok then status else nil
			else
				var7 = nil
			end
		elseif type(message.sent) == "string" then
			local sent = message.sent
			
			if type(sent) == "string" then
				local ok, status = pcall(function()
					-- upvalues: sent (ref)
					return DateTime.fromIsoDate(sent)
				end)
				var7 = if ok then status else nil
			else
				var7 = nil
			end
		else
			var7 = message.sent
		end
	end
	return (if var7 == nil then nil elseif typeof(var7) == "DateTime" then var7.UnixTimestamp elseif type(var7) == "table" and var7.GetUnixTimestamp ~= nil then var7:GetUnixTimestamp() else nil) or 0
end

local function updateConversationLastUpdatedFromMessages(p7, p8, p9, p10)
	-- upvalues: getConversationMessageViewModelStoreModule (ref), cryoModule (ref)
	if p8 == nil or p9 == nil then return end
	local conversation = p7.getConversation(p8, false)
	
	if conversation == nil then return end
	local var7, var8
	local var9 = nil
	local id = nil
	
	if conversation.previewMessageId == nil then
		var7 = 0
	else
		local message = getConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(conversation.previewMessageId, false)
		var8 = message
		
		if var8 then
			if message.sent == nil then
				local createdAt = message.created_at or message.createdAt
				
				if type(createdAt) == "string" then
					local ok, status = pcall(function()
						-- upvalues: createdAt (ref)
						return DateTime.fromIsoDate(createdAt)
					end)
					var8 = if ok then status else nil
				else
					var8 = nil
				end
			elseif type(message.sent) == "string" then
				local sent = message.sent
				
				if type(sent) == "string" then
					local ok, status = pcall(function()
						-- upvalues: sent (ref)
						return DateTime.fromIsoDate(sent)
					end)
					var8 = if ok then status else nil
				else
					var8 = nil
				end
			else
				var8 = message.sent
			end
		end
		var7 = (if var8 == nil then nil elseif typeof(var8) == "DateTime" then var8.UnixTimestamp elseif type(var8) == "table" and var8.GetUnixTimestamp ~= nil then var8:GetUnixTimestamp() else nil) or 0
	end
	var8 = conversation.lastUpdated
	local var10 = (if var8 == nil then nil elseif typeof(var8) == "DateTime" then var8.UnixTimestamp elseif type(var8) == "table" and var8.GetUnixTimestamp ~= nil then var8:GetUnixTimestamp() else nil) or 0
	
	for i, v in p9 do
		if v ~= nil and (if v.isPreviewable ~= nil then if v.is_previewable ~= nil then false else v.is_previewable else v.isPreviewable) then
			local var11
			if v.sent == nil then
				local createdAt = v.created_at or v.createdAt
				
				if type(createdAt) == "string" then
					local ok, status = pcall(function()
						-- upvalues: createdAt (ref)
						return DateTime.fromIsoDate(createdAt)
					end)
					var11 = if ok then status else nil
				else
					var11 = nil
				end
			elseif type(v.sent) == "string" then
				local sent = v.sent
				
				if type(sent) == "string" then
					local ok, status = pcall(function()
						-- upvalues: sent (ref)
						return DateTime.fromIsoDate(sent)
					end)
					var11 = if ok then status else nil
				else
					var11 = nil
				end
			else
				var11 = v.sent
			end
			local var12 = if var11 == nil then nil elseif typeof(var11) == "DateTime" then var11.UnixTimestamp elseif type(var11) == "table" and var11.GetUnixTimestamp ~= nil then var11:GetUnixTimestamp() else nil
			
			if var12 ~= nil and var7 < var12 then
				var7 = var12
				var9 = var11
				id = v.id
			end
		end
	end
	if var9 == nil then
		if p10 then
			local t = { hasUnreadMessages = true }
			
			if p8 == nil then return end
			var8 = p7.getConversation(p8, false)
			
			if var8 == nil then return end
			p7.upsertConversation(cryoModule.Dictionary.join(var8, t), false)
		end
		return
	else
		local t = { previewMessageId = id }
		
		if var10 < var7 then
			t.lastUpdated = var9
		end
		if p10 then
			t.hasUnreadMessages = true
		end
		if p8 == nil then return end
		var8 = p7.getConversation(p8, false)
		
		if var8 == nil then
			return
		end
		p7.upsertConversation(cryoModule.Dictionary.join(var8, t), false)
	end
end

local function handleCreateConversationSucceeded(p11, p12)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p11.responseBody
	local var13 = responseBody and (responseBody.conversations and responseBody.conversations[1])
	
	if var13 ~= nil then
		if var13.status == "failed" then return end
		p12.upsertConversation(conversationChannelsModule.fromChannelsApi(var13))
	end
end

local function handleDuplicateConversationSucceeded(p11, p12)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p11.responseBody
	local var13 = responseBody and (responseBody.conversations and responseBody.conversations[1])
	
	if var13 ~= nil then
		if var13.status == "failed" then return end
		p12.upsertConversation(conversationChannelsModule.fromChannelsApi(var13))
	end
end

local function handleGetUserConversationsSucceeded(p11, p12)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p11.responseBody
	
	if responseBody ~= nil and responseBody.conversations ~= nil then
		for i, v in responseBody.conversations do
			if v ~= nil and v.status ~= "failed" then
				p12.upsertConversation(conversationChannelsModule.fromChannelsApi(v))
			end
		end
	end
	local nextCursor = p11.responseBody and p11.responseBody.next_cursor
	local t = { isFetchingConversations = false }
	
	if nextCursor == nil or nextCursor == "" then
		t.oldestConversationIsFetched = true
	end
	p12.setListStatus(t)
end

local function handleGetUserConversationsFailed(_, p13)
	p13.setListStatus({ isFetchingConversations = false })
end

local function handleGetConversationDetailsSucceeded(p13, p14)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p13.responseBody
	
	if responseBody ~= nil then
		if responseBody.conversations == nil then return end
		for i, v in responseBody.conversations do
			if v ~= nil and v.status ~= "failed" then
				p14.upsertConversation(conversationChannelsModule.fromChannelsApi(v))
			end
		end
	end
end

local function handleLegacyGetUserConversationsSucceeded(p15, p16)
	-- upvalues: conversationModule (ref)
	local responseBody = p15.responseBody
	
	if responseBody == nil then return end
	for i, v in ipairs(responseBody) do
		p16.upsertConversation(conversationModule.fromWeb(v))
	end
	p16.setListStatus({ isFetchingConversations = false })
	local pageSize = p15.queryArgs and p15.queryArgs.pageSize
	
	if pageSize ~= nil and #responseBody < pageSize then
		p16.setListStatus({ oldestConversationIsFetched = true })
	end
end

local t_1 = {
	[appChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = handleCreateConversationSucceeded,
	[appChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = handleDuplicateConversationSucceeded,
	[appChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = handleGetUserConversationsSucceeded,
	[appChatNetworkingModule.rodux.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[appChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[appChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[appChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p17, p18)
		-- upvalues: cryoModule (ref)
		local conversationIds = p17.postBody and p17.postBody.conversation_ids
		
		if conversationIds == nil then return end
		for i, v in conversationIds do
			local t = { hasUnreadMessages = false }
			
			if v ~= nil then
				local conversation = p18.getConversation(v, false)
				
				if conversation ~= nil then
					p18.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
				end
			end
		end
	end,
	[appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p19, p20)
		local responseBody = p19.responseBody
		
		if responseBody == nil or responseBody.conversation_participants_metadata == nil then return end
		for i, v in responseBody.conversation_participants_metadata do
			local t = {}
			
			for i_1, v_1 in v.participants_metadata do
				t[i_1] = {
					isPending = v_1.is_pending,
					isBlocked = v_1.is_blocked,
					isInviter = v_1.is_inviter,
					isInvited = v_1.is_invited
				}
			end
			p20.setParticipantMetadata(i, t)
		end
	end,
	[appChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p21, p22)
		-- upvalues: constantsModule (ref), t (ref), conversationChannelsModule (ref), cryoModule (ref)
		local postBody = p21.postBody
		
		if postBody == nil or postBody.action_type ~= constantsModule.ModalAction.Accept then return end
		local modalVariant = t[postBody.modal_variant]
		
		if modalVariant == nil then return end
		local conversationId = postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ postBody.friend_id })
		local t_1 = { [modalVariant.field] = modalVariant.value }
		
		if conversationId == nil then return end
		local conversation = p22.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p22.upsertConversation(cryoModule.Dictionary.join(conversation, t_1), false)
	end,
	[networkingChatModule.GetUserConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[networkingChatModule.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[networkingChatModule.GetConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[networkingChatModule.GetConversations.Failed.name] = handleGetUserConversationsFailed,
	[networkingChatModule.GetLatestMessages.Succeeded.name] = function(p21, p22)
		-- upvalues: updateConversationLastUpdatedFromMessages (ref), messagesFromWebResponse (ref)
		local responseBody = p21.responseBody
		
		if responseBody == nil then return end
		for i, v in ipairs(responseBody) do
			local var13 = tostring(v.conversationId)
			updateConversationLastUpdatedFromMessages(p22, var13, messagesFromWebResponse(var13, v.chatMessages))
		end
	end,
	[networkingChatModule.MarkAsRead.Succeeded.name] = function(p23, p24)
		-- upvalues: cryoModule (ref)
		local conversationId = p23.postBody and p23.postBody.conversationId
		local t = { hasUnreadMessages = false }
		
		if conversationId == nil then return end
		local conversation = p24.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p24.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[networkingBlockingModule.BlockUserById.Succeeded.name] = function(p23, p24)
		-- upvalues: conversationChannelsModule (ref)
		local users = p23.namedIds and p23.namedIds.users
		
		if users == nil then return end
		local var14 = tostring(users)
		
		for i, v in p24.getConversations(false) do
			if v.type == conversationChannelsModule.Type.OneToOne and table.find(v.participants or {}, var14) then
				p24.removeConversation(v.id)
			end
		end
		p24.removeConversation(conversationChannelsModule.getFriendConversationId({ var14 }))
	end,
	[receivedConversationModule.name] = function(p25, p26)
		p26.upsertConversation(p25.conversation)
	end,
	[receivedMessages.name] = function(p25, p26)
		-- upvalues: updateConversationLastUpdatedFromMessages (ref)
		updateConversationLastUpdatedFromMessages(p26, p25.conversationId, p25.messages, p25.shouldMarkConversationUnread)
	end,
	[removedConversationModule.name] = function(p25, p26)
		if p25.conversationId then
			p26.removeConversation(p25.conversationId)
		end
	end,
	[renamedGroupConversationModule.name] = function(p25, p26)
		-- upvalues: cryoModule (ref)
		local conversationId = p25.conversationId
		local t = {
			lastUpdated = p25.lastUpdated,
			title = p25.title,
			isDefaultTitle = p25.isDefaultTitle
		}
		
		if conversationId == nil then return end
		local conversation = p26.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p26.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[changedParticipantsModule.name] = function(p25, p26)
		-- upvalues: cryoModule (ref)
		local conversationId = p25.conversationId
		local t = {
			participants = p25.participants,
			lastUpdated = p25.lastUpdated,
			title = p25.title
		}
		
		if conversationId == nil then return end
		local conversation = p26.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p26.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[hasUnreadMessagesModule.name] = function(p25, p26)
		-- upvalues: cryoModule (ref)
		local id = p25.conversation and p25.conversation.id
		local t = { hasUnreadMessages = true }
		
		if id == nil then return end
		local conversation = p26.getConversation(id, false)
		
		if conversation == nil then
			return
		end
		p26.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[readConversationModule.name] = function(p25, p26)
		-- upvalues: cryoModule (ref)
		local conversationId = p25.conversationId
		local t = { hasUnreadMessages = false }
		
		if conversationId == nil then return end
		local conversation = p26.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p26.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[setUserTypingModule.name] = function(value, p25)
		local conversationId = value.conversationId and p25.getConversation(value.conversationId, false)
		
		if conversationId == nil then
			return
		end
		local cloned = table.clone(conversationId.usersTyping or {})
		cloned[value.userId] = value.value
		p25.setUsersTyping(value.conversationId, cloned)
	end,
	[setConversationLoadingStatusModule.name] = function(value, p25)
		-- upvalues: cryoModule (ref)
		local conversationId = value.conversationId
		local t = { initialLoadingStatus = value.value }
		
		if conversationId == nil then return end
		local conversation = p25.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p25.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[setUserLeavingConversationModule.name] = function(value, p25)
		-- upvalues: cryoModule (ref)
		local id = value.id
		local t = { isUserLeaving = value.isLeaving }
		
		if id == nil then return end
		local conversation = p25.getConversation(id, false)
		
		if conversation == nil then
			return
		end
		p25.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[setPinnedGameForConversationModule.name] = function(value, p25)
		-- upvalues: cryoModule (ref)
		local conversationId = value.conversationId
		local t = {
			pinnedGame = {
				rootPlaceId = value.rootPlaceId,
				universeId = value.universeId
			}
		}
		
		if conversationId == nil then return end
		local conversation = p25.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p25.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[conversationModerationTypeChangedModule.name] = function(p25, p26)
		-- upvalues: cryoModule (ref)
		local conversationId = p25.conversationId
		local t = { moderationType = p25.moderationType }
		
		if conversationId == nil then return end
		local conversation = p26.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p26.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[friendConversationCreatedModule.name] = function(p25, p26)
		if p25.oldFriendConversationId then
			p26.removeConversation(p25.oldFriendConversationId)
		end
	end,
	[friendshipDestroyedModule.name] = function(p25, p26)
		-- upvalues: conversationChannelsModule (ref)
		local var15 = if p25.userId1 ~= "localUserId" then if p25.userId2 ~= "localUserId" then nil else p25.userId2 else p25.userId1
		
		if var15 == nil then
			return
		end
		p26.removeConversation(conversationChannelsModule.getFriendConversationId({ var15 }))
	end,
	[requestPageConversationsModule.name] = function(_, p25)
		p25.setListStatus({ isFetchingConversations = true })
	end,
	[receivedPageConversationsModule.name] = function(_, p25)
		p25.setListStatus({ isFetchingConversations = false })
	end,
	[requestLatestMessagesModule.name] = function(_, _)
		-- upvalues: getConversationListStoreModule (ref)
		getConversationListStoreModule(false).setLatestMessagesFetching(true)
	end,
	[receivedLatestMessagesModule.name] = function(_, _)
		-- upvalues: getConversationListStoreModule (ref)
		getConversationListStoreModule(false).setLatestMessagesFetching(false)
	end,
	[appChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p25, p26)
		-- upvalues: updateConversationLastUpdatedFromMessages (ref), shouldMarkConversationUnreadFromMessages (ref)
		local conversationId = p25.queryArgs and p25.queryArgs.conversation_id
		local responseBody = p25.responseBody
		local messages = responseBody and responseBody.messages
		updateConversationLastUpdatedFromMessages(p26, conversationId, messages, shouldMarkConversationUnreadFromMessages(conversationId, messages))
	end,
	[receivedOldestConversationModule.name] = function(_, p25)
		p25.setListStatus({ oldestConversationIsFetched = true })
	end,
	[receivedChannelsMigrationConflictModule.name] = function(_, p25)
		-- upvalues: getConversationListStoreModule (ref)
		p25.clear()
		getConversationListStoreModule(false).setLatestMessagesFetching(false)
	end
}

return function(value, _)
	-- upvalues: fFlagAppChatConversationStoreModule (ref), t_1 (ref), getConversationStoreModule (ref)
	return function(p25)
		-- upvalues: value (ref), fFlagAppChatConversationStoreModule (copy), t_1 (copy), getConversationStoreModule (copy)
		local var15 = value(p25)
		
		if not fFlagAppChatConversationStoreModule then
			return var15
		end
		local type = t_1[p25.type]
		
		if type then
			type(p25, getConversationStoreModule(false))
		end
		return var15
	end
end