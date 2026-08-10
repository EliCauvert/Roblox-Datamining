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

local function getMessageId(p0) --[[ line: 15 ]]
	return p0.id
end

local function messageSortPredicate(p1, p2) --[[ line: 19 ]]
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

local function sendingMessageSortPredicate(p3, p4) --[[ line: 44 ]]
	return p3.order < p4.order
end

local function _(p5, p6) --[[ line: 50 | named "convertToLegacyConversationType" ]]
	-- upvalues: conversationModule (ref)
	return if p6 == "friends" then conversationModule.Type.ONE_TO_ONE_CONVERSATION elseif p5 == "group" then conversationModule.Type.MULTI_USER_CONVERSATION elseif p5 == "one_to_one" then conversationModule.Type.ONE_TO_ONE_CONVERSATION else conversationModule.Type.ONE_TO_ONE_CONVERSATION
end

local function getFriendId(p7) --[[ line: 63 ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		for i, v in p7.participant_user_ids do
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
	getEmptyMessages = function() --[[ line: 107 ]]
		-- upvalues: orderedMap (ref), getMessageId (ref), messageSortPredicate (ref)
		return orderedMap.new(getMessageId, messageSortPredicate)
	end,
	getEmptySendingMessages = function() --[[ line: 110 ]]
		-- upvalues: orderedMap (ref), getMessageId (ref), sendingMessageSortPredicate (ref)
		return orderedMap.new(getMessageId, sendingMessageSortPredicate)
	end
}

function t.mockBase() --[[ line: 114 ]]
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

function t.mock(p8) --[[ line: 161 ]]
	-- upvalues: cryoModule (ref), t (ref)
	return cryoModule.Dictionary.join(t.mockBase(), p8 or {})
end

function t.response(p9) --[[ line: 165 ]]
	return {
		source = if p9.source then p9.source else "channels",
		type = if p9.type then p9.type else "one_to_one",
		created_at = if p9.created_at then p9.created_at else "2021-01-01T00:00:00Z",
		created_by = if p9.created_by then p9.created_by else 1,
		id = if p9.id then p9.id else "1-2-3",
		name = if p9.name then p9.name else "test",
		participant_user_ids = if p9.participant_user_ids then p9.participant_user_ids else { 1 },
		unread_message_count = if p9.unread_message_count then p9.unread_message_count else 0,
		updated_at = if p9.updated_at then p9.updated_at else "2021-01-01T00:00:00Z",
		messages = if p9.messages then p9.messages else {},
		moderation_type = if p9.moderation_type then p9.moderation_type else "trusted_comms",
		user_pending_status = if p9.user_pending_status then p9.user_pending_status else "not_pending",
		participant_pending_status = if p9.participant_pending_status then p9.participant_pending_status else "not_pending",
		success = if p9.success then p9.success else nil,
		preview_message = if p9.preview_message then p9.preview_message else nil,
		hasGroupUp = if p9.hasGroupUp then p9.hasGroupUp else false,
		osa_acknowledgement_status = if p9.osa_acknowledgement_status then p9.osa_acknowledgement_status else nil,
		user_opted_into_chat_messages = if p9.user_opted_into_chat_messages then p9.user_opted_into_chat_messages else nil
	}
end

function t.fromChannelsApi(p10) --[[ line: 214 ]]
	-- upvalues: t (ref), getFriendId (ref), conversationModule (ref), constantsModule (ref), dateTime (ref)
	local t_1 = {
		source = p10.source,
		type = p10.type,
		createdAt = p10.created_at,
		messages = t.getEmptyMessages(),
		sendingMessages = t.getEmptySendingMessages(),
		id = if p10.source == "friends" then getFriendId(p10) else tostring(p10.id),
		clientId = "",
		initiator = tostring(p10.created_by),
		hasUnreadMessages = p10.unread_message_count > 0
	}
	local type = p10.type
	t_1.conversationType = if p10.source == "friends" then conversationModule.Type.ONE_TO_ONE_CONVERSATION elseif type == "group" then conversationModule.Type.MULTI_USER_CONVERSATION elseif type == "one_to_one" then conversationModule.Type.ONE_TO_ONE_CONVERSATION else conversationModule.Type.ONE_TO_ONE_CONVERSATION
	t_1.usersTyping = {}
	t_1.isUserLeaving = false
	t_1.fetchingOlderMessages = false
	t_1.serverState = if p10.source == "friends" then constantsModule.ServerState.NONE else constantsModule.ServerState.CREATED
	t_1.pinnedGame = {}
	t_1.moderationType = p10.moderation_type
	t_1.userPendingStatus = p10.user_pending_status
	t_1.participantPendingStatus = p10.participant_pending_status
	local previewMessage = p10.preview_message
	
	if previewMessage then
		if previewMessage.is_previewable then
			t_1.previewMessageId = previewMessage.id
		end
		t_1.previewContent = previewMessage.content or previewMessage.preview_content
	end
	t_1.hasGroupUp = if p10.has_group_up then p10.has_group_up else false
	t_1.lastUpdated = dateTime.fromIsoDate(p10.updated_at)
	t_1.title = p10.name
	t_1.titleForViewer = ""
	t_1.isDefaultTitle = p10.name == nil
	t_1.participants = {}
	
	if p10.participant_user_ids then
		for i, v in p10.participant_user_ids do
			table.insert(t_1.participants, tostring(v))
		end
	end
	if p10.osa_acknowledgement_status then
		t_1.osaAcknowledgementStatus = p10.osa_acknowledgement_status
	end
	if p10.user_opted_into_chat_messages then
		t_1.userOptedIntoChatMessages = p10.user_opted_into_chat_messages
	end
	return t_1
end

function t.getFriendConversationId(p11) --[[ line: 272 ]]
	-- upvalues: getFriendId (ref)
	return getFriendId({ participant_user_ids = p11 })
end

return t