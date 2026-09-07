local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local orderedMap = require(parent.AppCommonLib).OrderedMap
local constantsModule = require(appChat.Constants)
local conversationModule = require(script.Parent.Conversation)
local dateTime = require(parent.Time).DateTime
local fFlagAppChatNilGuardMessageSortModule = require(appChat.Flags.FFlagAppChatNilGuardMessageSort)

local function getMessageId(p1)
	return p1.id
end

local function messageSortPredicate(p1, p2)
	-- upvalues: fFlagAppChatNilGuardMessageSortModule (ref)
	if fFlagAppChatNilGuardMessageSortModule then
		local sent = p1 and p1.sent
		local sent_1 = p2 and p2.sent
		
		if not sent and not sent_1 then
			return (if p2 then p2.id else "") < (if p1 then p1.id else "")
		elseif not sent then
			return false
		elseif not sent_1 then
			return true
		end
	end
	local unixTimestamp = p1.sent:GetUnixTimestamp()
	local unixTimestamp_1 = p2.sent:GetUnixTimestamp()
	
	return if unixTimestamp == unixTimestamp_1 then p2.id < p1.id else unixTimestamp < unixTimestamp_1
end

local function sendingMessageSortPredicate(p1, p2)
	return p1.order < p2.order
end

local function _(p1, p2)
	-- upvalues: conversationModule (ref)
	return if p2 == "friends" then conversationModule.Type.ONE_TO_ONE_CONVERSATION elseif p1 == "group" then conversationModule.Type.MULTI_USER_CONVERSATION elseif p1 == "one_to_one" then conversationModule.Type.ONE_TO_ONE_CONVERSATION else conversationModule.Type.ONE_TO_ONE_CONVERSATION
end

local function getFriendId(p1)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		for i, v in p1.participant_user_ids do
			if tostring(v) ~= tostring(localPlayer.UserId) then
				return "friends:" .. tostring(v)
			end
		end
	end
	return "friends:unknown-id"
end

local t = {
	ModerationType = {
		TrustedComms = "trusted_comms",
		Moderated = "moderated",
		Invalid = "invalid",
		UnknownType = "unknown_type"
	},
	UserPendingStatus = {
		Invalid = "invalid",
		Pending = "pending",
		NotPending = "not_pending"
	},
	OsaAcknowledgementStatus = appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse,
	UserOptedIntoChatMessagesStatus = appChatNetworkingModule.Constants.UserOptedIntoChatMessagesStatusResponse,
	Source = {
		Friends = "friends",
		Channels = "channels",
		Chat = "chat"
	},
	Type = { Group = "group", OneToOne = "one_to_one" },
	getEmptyMessages = function()
		-- upvalues: orderedMap (ref), getMessageId (ref), messageSortPredicate (ref)
		return orderedMap.new(getMessageId, messageSortPredicate)
	end,
	getEmptySendingMessages = function()
		-- upvalues: orderedMap (ref), getMessageId (ref), sendingMessageSortPredicate (ref)
		return orderedMap.new(getMessageId, sendingMessageSortPredicate)
	end
}

function t.mockBase()
	-- upvalues: t (ref), conversationModule (ref), constantsModule (ref), dateTime (ref)
	return {
		source = "channels",
		type = "one_to_one",
		createdAt = nil,
		id = "1-2-3",
		clientId = "1-2-3",
		initiator = "1",
		hasUnreadMessages = false,
		hasGroupUp = false,
		isUserLeaving = false,
		fetchingOlderMessages = false,
		previewMessageId = nil,
		previewContent = nil,
		title = "test",
		titleForViewer = "test",
		isDefaultTitle = false,
		previousCursor = nil,
		nextCursor = nil,
		fetchedOldestMessage = nil,
		messages = t.getEmptyMessages(),
		sendingMessages = t.getEmptySendingMessages(),
		conversationType = conversationModule.Type.ONE_TO_ONE_CONVERSATION,
		usersTyping = {},
		serverState = constantsModule.ServerState.CREATED,
		pinnedGame = {},
		moderationType = t.ModerationType.TrustedComms,
		userPendingStatus = t.UserPendingStatus.NotPending,
		participantPendingStatus = t.UserPendingStatus.NotPending,
		lastUpdated = dateTime.now(),
		participants = { "1" },
		osaAcknowledgementStatus = t.OsaAcknowledgementStatus.NotApplicable,
		userOptedIntoChatMessages = t.UserOptedIntoChatMessagesStatus.NotApplicable
	}
end

function t.mock(p2)
	-- upvalues: cryoModule (ref), t (ref)
	return cryoModule.Dictionary.join(t.mockBase(), p2 or {})
end

function t.response(p2)
	return {
		source = if p2.source then p2.source else "channels",
		type = if p2.type then p2.type else "one_to_one",
		created_at = if p2.created_at then p2.created_at else "2021-01-01T00:00:00Z",
		created_by = if p2.created_by then p2.created_by else 1,
		id = if p2.id then p2.id else "1-2-3",
		name = if p2.name then p2.name else "test",
		participant_user_ids = if p2.participant_user_ids then p2.participant_user_ids else { 1 },
		unread_message_count = if p2.unread_message_count then p2.unread_message_count else 0,
		updated_at = if p2.updated_at then p2.updated_at else "2021-01-01T00:00:00Z",
		messages = if p2.messages then p2.messages else {},
		moderation_type = if p2.moderation_type then p2.moderation_type else "trusted_comms",
		user_pending_status = if p2.user_pending_status then p2.user_pending_status else "not_pending",
		participant_pending_status = if p2.participant_pending_status then p2.participant_pending_status else "not_pending",
		success = if p2.success then p2.success else nil,
		preview_message = if p2.preview_message then p2.preview_message else nil,
		hasGroupUp = if p2.hasGroupUp then p2.hasGroupUp else false,
		osa_acknowledgement_status = if p2.osa_acknowledgement_status then p2.osa_acknowledgement_status else nil,
		user_opted_into_chat_messages = if p2.user_opted_into_chat_messages then p2.user_opted_into_chat_messages else nil
	}
end

function t.fromChannelsApi(p2)
	-- upvalues: t (ref), getFriendId (ref), conversationModule (ref), constantsModule (ref), dateTime (ref)
	local t_1 = {
		source = p2.source,
		type = p2.type,
		createdAt = p2.created_at,
		messages = t.getEmptyMessages(),
		sendingMessages = t.getEmptySendingMessages(),
		id = if p2.source == "friends" then getFriendId(p2) else tostring(p2.id),
		clientId = "",
		initiator = tostring(p2.created_by),
		hasUnreadMessages = p2.unread_message_count > 0
	}
	local type = p2.type
	t_1.conversationType = if p2.source == "friends" then conversationModule.Type.ONE_TO_ONE_CONVERSATION elseif type == "group" then conversationModule.Type.MULTI_USER_CONVERSATION elseif type == "one_to_one" then conversationModule.Type.ONE_TO_ONE_CONVERSATION else conversationModule.Type.ONE_TO_ONE_CONVERSATION
	t_1.usersTyping = {}
	t_1.isUserLeaving = false
	t_1.fetchingOlderMessages = false
	t_1.serverState = if p2.source == "friends" then constantsModule.ServerState.NONE else constantsModule.ServerState.CREATED
	t_1.pinnedGame = {}
	t_1.moderationType = p2.moderation_type
	t_1.userPendingStatus = p2.user_pending_status
	t_1.participantPendingStatus = p2.participant_pending_status
	local previewMessage = p2.preview_message
	
	if previewMessage then
		if previewMessage.is_previewable then
			t_1.previewMessageId = previewMessage.id
		end
		t_1.previewContent = previewMessage.content or previewMessage.preview_content
	end
	t_1.hasGroupUp = if p2.has_group_up then p2.has_group_up else false
	t_1.lastUpdated = dateTime.fromIsoDate(p2.updated_at)
	t_1.title = p2.name
	t_1.titleForViewer = ""
	t_1.isDefaultTitle = p2.name == nil
	t_1.participants = {}
	
	if p2.participant_user_ids then
		for i, v in p2.participant_user_ids do
			table.insert(t_1.participants, tostring(v))
		end
	end
	if p2.osa_acknowledgement_status then
		t_1.osaAcknowledgementStatus = p2.osa_acknowledgement_status
	end
	if p2.user_opted_into_chat_messages then
		t_1.userOptedIntoChatMessages = p2.user_opted_into_chat_messages
	end
	return t_1
end

function t.getFriendConversationId(p3)
	-- upvalues: getFriendId (ref)
	return getFriendId({ participant_user_ids = p3 })
end

return t