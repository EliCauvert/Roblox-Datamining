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

local function _(p0, p1)
	-- upvalues: conversationChannelsModule (ref)
	if p1 == nil or p1.status == "failed" then
		return
	end
	p0.upsertConversation(conversationChannelsModule.fromChannelsApi(p1))
end

local _ = function(p2, p3)
	-- upvalues: conversationChannelsModule (ref)
	if p3 == nil or p3.conversations == nil then return end
	for i, v in p3.conversations do
		if v ~= nil and v.status ~= "failed" then
			p2.upsertConversation(conversationChannelsModule.fromChannelsApi(v))
		end
	end
end

local _ = function(p4, p5, p6)
	-- upvalues: cryoModule (ref)
	if p5 == nil then return end
	local conversation = p4.getConversation(p5, false)
	
	if conversation == nil then
		return
	end
	p4.upsertConversation(cryoModule.Dictionary.join(conversation, p6), false)
end

local _ = function(p7)
	return if p7 == nil then nil elseif typeof(p7) == "DateTime" then p7.UnixTimestamp elseif type(p7) == "table" and p7.GetUnixTimestamp ~= nil then p7:GetUnixTimestamp() else nil
end

local _ = function(p8)
	if type(p8) ~= "string" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: p8 (ref)
		return DateTime.fromIsoDate(p8)
	end)
	
	return if ok then status else nil
end

local _ = function(p9)
	if p9.sent == nil then
		local createdAt = p9.created_at or p9.createdAt
		
		if type(createdAt) ~= "string" then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: createdAt (ref)
			return DateTime.fromIsoDate(createdAt)
		end)
		
		return if ok then status else nil
	elseif type(p9.sent) == "string" then
		local sent = p9.sent
		
		if type(sent) ~= "string" then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: sent (ref)
			return DateTime.fromIsoDate(sent)
		end)
		
		return if ok then status else nil
	else
		return p9.sent
	end
end

local function messagesFromWebResponse(p10, p11)
	-- upvalues: messageModelModule (ref)
	if p11 == nil then
		return {}
	end
	local id = nil
	local t = {}
	
	for i = #p11, 1, -1 do
		local var49 = p11[i]
		local var50 = messageModelModule.fromWeb(var49, p10, id)
		
		if var50 ~= nil then
			var50.isPreviewable = var49.is_previewable
			var50.isBadgeable = var49.is_badgeable
			id = var50.id
			table.insert(t, 1, var50)
		end
	end
	return t
end

local _ = function(p12)
	return if p12.isPreviewable == nil then if p12.is_previewable == nil then false else p12.is_previewable else p12.isPreviewable
end

local function getNewestMessageUnixTime(p13)
	-- upvalues: getConversationMessageViewModelStoreModule (ref)
	if p13 == nil then
		return 0
	end
	local var51 = getConversationMessageViewModelStoreModule(false)
	local var52 = var51.conversationMessageListStore.getOrderedIds(p13, false)[1]
	local var53 = var52 and var51.conversationMessageStore.getMessage(var52, false)
	local var54 = var53
	
	if var54 then
		if var53.sent == nil then
			local createdAt = var53.created_at or var53.createdAt
			
			if type(createdAt) == "string" then
				local ok, status = pcall(function()
					-- upvalues: createdAt (ref)
					return DateTime.fromIsoDate(createdAt)
				end)
				var54 = if ok then status else nil
			else
				var54 = nil
			end
		elseif type(var53.sent) == "string" then
			local sent = var53.sent
			
			if type(sent) == "string" then
				local ok, status = pcall(function()
					-- upvalues: sent (ref)
					return DateTime.fromIsoDate(sent)
				end)
				var54 = if ok then status else nil
			else
				var54 = nil
			end
		else
			var54 = var53.sent
		end
	end
	return (if var54 == nil then nil elseif typeof(var54) == "DateTime" then var54.UnixTimestamp elseif type(var54) == "table" and var54.GetUnixTimestamp ~= nil then var54:GetUnixTimestamp() else nil) or 0
end

local function shouldMarkConversationUnreadFromMessages(p14, p15)
	-- upvalues: getNewestMessageUnixTime (ref), playersService (ref)
	if p15 == nil then
		return false
	end
	local var56 = getNewestMessageUnixTime(p14)
	local var57 = tostring(playersService.LocalPlayer.UserId)
	
	for i, v in p15 do
		local var58
		if v.sent == nil then
			local createdAt = v.created_at or v.createdAt
			
			if type(createdAt) == "string" then
				local ok, status = pcall(function()
					-- upvalues: createdAt (ref)
					return DateTime.fromIsoDate(createdAt)
				end)
				var58 = if ok then status else nil
			else
				var58 = nil
			end
		elseif type(v.sent) == "string" then
			local sent = v.sent
			
			if type(sent) == "string" then
				local ok, status = pcall(function()
					-- upvalues: sent (ref)
					return DateTime.fromIsoDate(sent)
				end)
				var58 = if ok then status else nil
			else
				var58 = nil
			end
		else
			var58 = v.sent
		end
		local var60 = if var58 == nil then nil elseif typeof(var58) == "DateTime" then var58.UnixTimestamp elseif type(var58) == "table" and var58.GetUnixTimestamp ~= nil then var58:GetUnixTimestamp() else nil
		var58 = v.sender_user_id or v.senderTargetId
		
		if var60 ~= nil and var56 < var60 and (var58 ~= nil and tostring(var58) ~= var57) and v.is_badgeable == true then
			return true
		end
	end
	return false
end

local _ = function(p16)
	-- upvalues: getConversationMessageViewModelStoreModule (ref)
	if p16.previewMessageId == nil then
		return 0
	end
	local message = getConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(p16.previewMessageId, false)
	local var62 = message
	
	if var62 then
		if message.sent == nil then
			local createdAt = message.created_at or message.createdAt
			
			if type(createdAt) == "string" then
				local ok, status = pcall(function()
					-- upvalues: createdAt (ref)
					return DateTime.fromIsoDate(createdAt)
				end)
				var62 = if ok then status else nil
			else
				var62 = nil
			end
		elseif type(message.sent) == "string" then
			local sent = message.sent
			
			if type(sent) == "string" then
				local ok, status = pcall(function()
					-- upvalues: sent (ref)
					return DateTime.fromIsoDate(sent)
				end)
				var62 = if ok then status else nil
			else
				var62 = nil
			end
		else
			var62 = message.sent
		end
	end
	return (if var62 == nil then nil elseif typeof(var62) == "DateTime" then var62.UnixTimestamp elseif type(var62) == "table" and var62.GetUnixTimestamp ~= nil then var62:GetUnixTimestamp() else nil) or 0
end

local function updateConversationLastUpdatedFromMessages(p17, p18, p19, p20)
	-- upvalues: getConversationMessageViewModelStoreModule (ref), cryoModule (ref)
	if p18 == nil or p19 == nil then return end
	local conversation = p17.getConversation(p18, false)
	
	if conversation == nil then return end
	local var66, var68
	local var65 = nil
	local id = nil
	
	if conversation.previewMessageId == nil then
		var66 = 0
	else
		local message = getConversationMessageViewModelStoreModule(false).conversationMessageStore.getMessage(conversation.previewMessageId, false)
		var68 = message
		
		if var68 then
			if message.sent == nil then
				local createdAt = message.created_at or message.createdAt
				
				if type(createdAt) == "string" then
					local ok, status = pcall(function()
						-- upvalues: createdAt (ref)
						return DateTime.fromIsoDate(createdAt)
					end)
					var68 = if ok then status else nil
				else
					var68 = nil
				end
			elseif type(message.sent) == "string" then
				local sent = message.sent
				
				if type(sent) == "string" then
					local ok, status = pcall(function()
						-- upvalues: sent (ref)
						return DateTime.fromIsoDate(sent)
					end)
					var68 = if ok then status else nil
				else
					var68 = nil
				end
			else
				var68 = message.sent
			end
		end
		var66 = (if var68 == nil then nil elseif typeof(var68) == "DateTime" then var68.UnixTimestamp elseif type(var68) == "table" and var68.GetUnixTimestamp ~= nil then var68:GetUnixTimestamp() else nil) or 0
	end
	var68 = conversation.lastUpdated
	local var70 = (if var68 == nil then nil elseif typeof(var68) == "DateTime" then var68.UnixTimestamp elseif type(var68) == "table" and var68.GetUnixTimestamp ~= nil then var68:GetUnixTimestamp() else nil) or 0
	
	for i, v in p19 do
		if v ~= nil and (if v.isPreviewable ~= nil then if v.is_previewable ~= nil then false else v.is_previewable else v.isPreviewable) then
			local var73
			if v.sent == nil then
				local createdAt = v.created_at or v.createdAt
				
				if type(createdAt) == "string" then
					local ok, status = pcall(function()
						-- upvalues: createdAt (ref)
						return DateTime.fromIsoDate(createdAt)
					end)
					var73 = if ok then status else nil
				else
					var73 = nil
				end
			elseif type(v.sent) == "string" then
				local sent = v.sent
				
				if type(sent) == "string" then
					local ok, status = pcall(function()
						-- upvalues: sent (ref)
						return DateTime.fromIsoDate(sent)
					end)
					var73 = if ok then status else nil
				else
					var73 = nil
				end
			else
				var73 = v.sent
			end
			local var75 = if var73 == nil then nil elseif typeof(var73) == "DateTime" then var73.UnixTimestamp elseif type(var73) == "table" and var73.GetUnixTimestamp ~= nil then var73:GetUnixTimestamp() else nil
			
			if var75 ~= nil and var66 < var75 then
				var66 = var75
				var65 = var73
				id = v.id
			end
		end
	end
	if var65 == nil then
		if p20 then
			local t = { hasUnreadMessages = true }
			
			if p18 == nil then return end
			var68 = p17.getConversation(p18, false)
			
			if var68 == nil then return end
			p17.upsertConversation(cryoModule.Dictionary.join(var68, t), false)
		end
		return
	else
		local t = { previewMessageId = id }
		
		if var70 < var66 then
			t.lastUpdated = var65
		end
		if p20 then
			t.hasUnreadMessages = true
		end
		if p18 == nil then return end
		var68 = p17.getConversation(p18, false)
		
		if var68 == nil then
			return
		end
		p17.upsertConversation(cryoModule.Dictionary.join(var68, t), false)
	end
end

local function handleCreateConversationSucceeded(p21, p22)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p21.responseBody
	local var76 = responseBody and (responseBody.conversations and responseBody.conversations[1])
	
	if var76 ~= nil then
		if var76.status == "failed" then return end
		p22.upsertConversation(conversationChannelsModule.fromChannelsApi(var76))
	end
end

local function handleDuplicateConversationSucceeded(p23, p24)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p23.responseBody
	local var77 = responseBody and (responseBody.conversations and responseBody.conversations[1])
	
	if var77 ~= nil then
		if var77.status == "failed" then return end
		p24.upsertConversation(conversationChannelsModule.fromChannelsApi(var77))
	end
end

local function handleGetUserConversationsSucceeded(p25, p26)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p25.responseBody
	
	if responseBody ~= nil and responseBody.conversations ~= nil then
		for i, v in responseBody.conversations do
			if v ~= nil and v.status ~= "failed" then
				p26.upsertConversation(conversationChannelsModule.fromChannelsApi(v))
			end
		end
	end
	local nextCursor = p25.responseBody and p25.responseBody.next_cursor
	local t = { isFetchingConversations = false }
	
	if nextCursor == nil or nextCursor == "" then
		t.oldestConversationIsFetched = true
	end
	p26.setListStatus(t)
end

local function handleGetUserConversationsFailed(_, p27)
	p27.setListStatus({ isFetchingConversations = false })
end

local function handleGetConversationDetailsSucceeded(p28, p29)
	-- upvalues: conversationChannelsModule (ref)
	local responseBody = p28.responseBody
	
	if responseBody ~= nil then
		if responseBody.conversations == nil then return end
		for i, v in responseBody.conversations do
			if v ~= nil and v.status ~= "failed" then
				p29.upsertConversation(conversationChannelsModule.fromChannelsApi(v))
			end
		end
	end
end

local function handleLegacyGetUserConversationsSucceeded(p30, p31)
	-- upvalues: conversationModule (ref)
	local responseBody = p30.responseBody
	
	if responseBody == nil then return end
	for i, v in ipairs(responseBody) do
		p31.upsertConversation(conversationModule.fromWeb(v))
	end
	p31.setListStatus({ isFetchingConversations = false })
	local pageSize = p30.queryArgs and p30.queryArgs.pageSize
	
	if pageSize ~= nil and #responseBody < pageSize then
		p31.setListStatus({ oldestConversationIsFetched = true })
	end
end

local t_1 = {
	[appChatNetworkingModule.rodux.CreateConversation.Succeeded.name] = handleCreateConversationSucceeded,
	[appChatNetworkingModule.rodux.DuplicateConversation.Succeeded.name] = handleDuplicateConversationSucceeded,
	[appChatNetworkingModule.rodux.GetUserConversations.Succeeded.name] = handleGetUserConversationsSucceeded,
	[appChatNetworkingModule.rodux.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[appChatNetworkingModule.rodux.GetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[appChatNetworkingModule.rodux.MultiGetConversationDetails.Succeeded.name] = handleGetConversationDetailsSucceeded,
	[appChatNetworkingModule.rodux.MarkConversation.Succeeded.name] = function(p32, p33)
		-- upvalues: cryoModule (ref)
		local conversationIds = p32.postBody and p32.postBody.conversation_ids
		
		if conversationIds == nil then return end
		for i, v in conversationIds do
			local t = { hasUnreadMessages = false }
			
			if v ~= nil then
				local conversation = p33.getConversation(v, false)
				
				if conversation ~= nil then
					p33.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
				end
			end
		end
	end,
	[appChatNetworkingModule.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p34, p35)
		local responseBody = p34.responseBody
		
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
			p35.setParticipantMetadata(i, t)
		end
	end,
	[appChatNetworkingModule.rodux.RecordModalSequenceResponse.Succeeded.name] = function(p36, p37)
		-- upvalues: constantsModule (ref), t (ref), conversationChannelsModule (ref), cryoModule (ref)
		local postBody = p36.postBody
		
		if postBody == nil or postBody.action_type ~= constantsModule.ModalAction.Accept then return end
		local modalVariant = t[postBody.modal_variant]
		
		if modalVariant == nil then return end
		local conversationId = postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ postBody.friend_id })
		local t_1 = { [modalVariant.field] = modalVariant.value }
		
		if conversationId == nil then return end
		local conversation = p37.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p37.upsertConversation(cryoModule.Dictionary.join(conversation, t_1), false)
	end,
	[networkingChatModule.GetUserConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[networkingChatModule.GetUserConversations.Failed.name] = handleGetUserConversationsFailed,
	[networkingChatModule.GetConversations.Succeeded.name] = handleLegacyGetUserConversationsSucceeded,
	[networkingChatModule.GetConversations.Failed.name] = handleGetUserConversationsFailed,
	[networkingChatModule.GetLatestMessages.Succeeded.name] = function(p38, p39)
		-- upvalues: updateConversationLastUpdatedFromMessages (ref), messagesFromWebResponse (ref)
		local responseBody = p38.responseBody
		
		if responseBody == nil then return end
		for i, v in ipairs(responseBody) do
			local var88 = tostring(v.conversationId)
			updateConversationLastUpdatedFromMessages(p39, var88, messagesFromWebResponse(var88, v.chatMessages))
		end
	end,
	[networkingChatModule.MarkAsRead.Succeeded.name] = function(p40, p41)
		-- upvalues: cryoModule (ref)
		local conversationId = p40.postBody and p40.postBody.conversationId
		local t = { hasUnreadMessages = false }
		
		if conversationId == nil then return end
		local conversation = p41.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p41.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[networkingBlockingModule.BlockUserById.Succeeded.name] = function(p42, p43)
		-- upvalues: conversationChannelsModule (ref)
		local users = p42.namedIds and p42.namedIds.users
		
		if users == nil then return end
		local var93 = tostring(users)
		
		for i, v in p43.getConversations(false) do
			if v.type == conversationChannelsModule.Type.OneToOne and table.find(v.participants or {}, var93) then
				p43.removeConversation(v.id)
			end
		end
		p43.removeConversation(conversationChannelsModule.getFriendConversationId({ var93 }))
	end,
	[receivedConversationModule.name] = function(p44, p45)
		p45.upsertConversation(p44.conversation)
	end,
	[receivedMessages.name] = function(p46, p47)
		-- upvalues: updateConversationLastUpdatedFromMessages (ref)
		updateConversationLastUpdatedFromMessages(p47, p46.conversationId, p46.messages, p46.shouldMarkConversationUnread)
	end,
	[removedConversationModule.name] = function(p48, p49)
		if p48.conversationId then
			p49.removeConversation(p48.conversationId)
		end
	end,
	[renamedGroupConversationModule.name] = function(p50, p51)
		-- upvalues: cryoModule (ref)
		local conversationId = p50.conversationId
		local t = {
			lastUpdated = p50.lastUpdated,
			title = p50.title,
			isDefaultTitle = p50.isDefaultTitle
		}
		
		if conversationId == nil then return end
		local conversation = p51.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p51.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[changedParticipantsModule.name] = function(p52, p53)
		-- upvalues: cryoModule (ref)
		local conversationId = p52.conversationId
		local t = {
			participants = p52.participants,
			lastUpdated = p52.lastUpdated,
			title = p52.title
		}
		
		if conversationId == nil then return end
		local conversation = p53.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p53.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[hasUnreadMessagesModule.name] = function(p54, p55)
		-- upvalues: cryoModule (ref)
		local id = p54.conversation and p54.conversation.id
		local t = { hasUnreadMessages = true }
		
		if id == nil then return end
		local conversation = p55.getConversation(id, false)
		
		if conversation == nil then
			return
		end
		p55.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[readConversationModule.name] = function(p56, p57)
		-- upvalues: cryoModule (ref)
		local conversationId = p56.conversationId
		local t = { hasUnreadMessages = false }
		
		if conversationId == nil then return end
		local conversation = p57.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p57.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[setUserTypingModule.name] = function(value, p58)
		local conversationId = value.conversationId and p58.getConversation(value.conversationId, false)
		
		if conversationId == nil then
			return
		end
		local cloned = table.clone(conversationId.usersTyping or {})
		cloned[value.userId] = value.value
		p58.setUsersTyping(value.conversationId, cloned)
	end,
	[setConversationLoadingStatusModule.name] = function(value, p59)
		-- upvalues: cryoModule (ref)
		local conversationId = value.conversationId
		local t = { initialLoadingStatus = value.value }
		
		if conversationId == nil then return end
		local conversation = p59.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p59.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[setUserLeavingConversationModule.name] = function(value, p60)
		-- upvalues: cryoModule (ref)
		local id = value.id
		local t = { isUserLeaving = value.isLeaving }
		
		if id == nil then return end
		local conversation = p60.getConversation(id, false)
		
		if conversation == nil then
			return
		end
		p60.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[setPinnedGameForConversationModule.name] = function(value, p61)
		-- upvalues: cryoModule (ref)
		local conversationId = value.conversationId
		local t = {
			pinnedGame = {
				rootPlaceId = value.rootPlaceId,
				universeId = value.universeId
			}
		}
		
		if conversationId == nil then return end
		local conversation = p61.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p61.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[conversationModerationTypeChangedModule.name] = function(p62, p63)
		-- upvalues: cryoModule (ref)
		local conversationId = p62.conversationId
		local t = { moderationType = p62.moderationType }
		
		if conversationId == nil then return end
		local conversation = p63.getConversation(conversationId, false)
		
		if conversation == nil then
			return
		end
		p63.upsertConversation(cryoModule.Dictionary.join(conversation, t), false)
	end,
	[friendConversationCreatedModule.name] = function(p64, p65)
		if p64.oldFriendConversationId then
			p65.removeConversation(p64.oldFriendConversationId)
		end
	end,
	[friendshipDestroyedModule.name] = function(p66, p67)
		-- upvalues: conversationChannelsModule (ref)
		local var113 = if p66.userId1 ~= "localUserId" then if p66.userId2 ~= "localUserId" then nil else p66.userId2 else p66.userId1
		
		if var113 == nil then
			return
		end
		p67.removeConversation(conversationChannelsModule.getFriendConversationId({ var113 }))
	end,
	[requestPageConversationsModule.name] = function(_, p68)
		p68.setListStatus({ isFetchingConversations = true })
	end,
	[receivedPageConversationsModule.name] = function(_, p69)
		p69.setListStatus({ isFetchingConversations = false })
	end,
	[requestLatestMessagesModule.name] = function(_, _)
		-- upvalues: getConversationListStoreModule (ref)
		getConversationListStoreModule(false).setLatestMessagesFetching(true)
	end,
	[receivedLatestMessagesModule.name] = function(_, _)
		-- upvalues: getConversationListStoreModule (ref)
		getConversationListStoreModule(false).setLatestMessagesFetching(false)
	end,
	[appChatNetworkingModule.rodux.GetNewerMessages.Succeeded.name] = function(p70, p71)
		-- upvalues: updateConversationLastUpdatedFromMessages (ref), shouldMarkConversationUnreadFromMessages (ref)
		local conversationId = p70.queryArgs and p70.queryArgs.conversation_id
		local responseBody = p70.responseBody
		local messages = responseBody and responseBody.messages
		updateConversationLastUpdatedFromMessages(p71, conversationId, messages, shouldMarkConversationUnreadFromMessages(conversationId, messages))
	end,
	[receivedOldestConversationModule.name] = function(_, p72)
		p72.setListStatus({ oldestConversationIsFetched = true })
	end,
	[receivedChannelsMigrationConflictModule.name] = function(_, p73)
		-- upvalues: getConversationListStoreModule (ref)
		p73.clear()
		getConversationListStoreModule(false).setLatestMessagesFetching(false)
	end
}

return function(value, _)
	-- upvalues: fFlagAppChatConversationStoreModule (ref), t_1 (ref), getConversationStoreModule (ref)
	return function(p74)
		-- upvalues: value (ref), fFlagAppChatConversationStoreModule (copy), t_1 (copy), getConversationStoreModule (copy)
		local var116 = value(p74)
		
		if not fFlagAppChatConversationStoreModule then
			return var116
		end
		local type = t_1[p74.type]
		
		if type then
			type(p74, getConversationStoreModule(false))
		end
		return var116
	end
end