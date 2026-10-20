local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local OrderedMap = require(Parent.AppCommonLib).OrderedMap
local ConstantsModule = require(AppChat.Constants)
local ConversationModule = require(script.Parent.Conversation)
local _DateTime = require(Parent.Time).DateTime
local FFlagAppChatNilGuardMessageSortModule = require(AppChat.Flags.FFlagAppChatNilGuardMessageSort)

local function getMessageId(p1)
	return p1.id
end

local function messageSortPredicate(p1, p2): boolean
	-- upvalues: FFlagAppChatNilGuardMessageSortModule (copy)
	if FFlagAppChatNilGuardMessageSortModule then
		local Sent = p1 and p1.sent
		local Sent1 = p2 and p2.sent
		
		if not Sent and not Sent1 then
			return (p2 and p2.id or "") < (p1 and p1.id or "")
		elseif not Sent then
			return false
		elseif not Sent1 then
			return true
		end
	end
	local UnixTimestamp = p1.sent:GetUnixTimestamp()
	local UnixTimestamp1 = p2.sent:GetUnixTimestamp()
	
	return if UnixTimestamp == UnixTimestamp1 then p2.id < p1.id else UnixTimestamp < UnixTimestamp1
end

local function sendingMessageSortPredicate(p1, p2): boolean
	return p1.order < p2.order
end

local function _(p1, p2)
	-- upvalues: ConversationModule (copy)
	return if p2 == "friends" then ConversationModule.Type.ONE_TO_ONE_CONVERSATION elseif p1 == "group" then ConversationModule.Type.MULTI_USER_CONVERSATION elseif p1 == "one_to_one" then ConversationModule.Type.ONE_TO_ONE_CONVERSATION else ConversationModule.Type.ONE_TO_ONE_CONVERSATION
end

local function getFriendId(p1): string
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		for _, participantUserId in p1.participant_user_ids do
			if tostring(participantUserId) ~= tostring(LocalPlayer.UserId) then
				return "friends:" .. tostring(participantUserId)
			end
		end
	end
	return "friends:unknown-id"
end

local ConversationChannelsModule = {
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
	OsaAcknowledgementStatus = AppChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse,
	UserOptedIntoChatMessagesStatus = AppChatNetworkingModule.Constants.UserOptedIntoChatMessagesStatusResponse,
	Source = {
		Friends = "friends",
		Channels = "channels",
		Chat = "chat"
	},
	Type = { Group = "group", OneToOne = "one_to_one" },
	getEmptyMessages = function()
		-- upvalues: OrderedMap (copy), getMessageId (copy), messageSortPredicate (copy)
		return OrderedMap.new(getMessageId, messageSortPredicate)
	end,
	getEmptySendingMessages = function()
		-- upvalues: OrderedMap (copy), getMessageId (copy), sendingMessageSortPredicate (copy)
		return OrderedMap.new(getMessageId, sendingMessageSortPredicate)
	end
}

function ConversationChannelsModule.mockBase()
	-- upvalues: ConversationChannelsModule (copy), ConversationModule (copy), ConstantsModule (copy), _DateTime (copy)
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
		messages = ConversationChannelsModule.getEmptyMessages(),
		sendingMessages = ConversationChannelsModule.getEmptySendingMessages(),
		conversationType = ConversationModule.Type.ONE_TO_ONE_CONVERSATION,
		usersTyping = {},
		serverState = ConstantsModule.ServerState.CREATED,
		pinnedGame = {},
		moderationType = ConversationChannelsModule.ModerationType.TrustedComms,
		userPendingStatus = ConversationChannelsModule.UserPendingStatus.NotPending,
		participantPendingStatus = ConversationChannelsModule.UserPendingStatus.NotPending,
		lastUpdated = _DateTime.now(),
		participants = { "1" },
		osaAcknowledgementStatus = ConversationChannelsModule.OsaAcknowledgementStatus.NotApplicable,
		userOptedIntoChatMessages = ConversationChannelsModule.UserOptedIntoChatMessagesStatus.NotApplicable
	}
end

function ConversationChannelsModule.mock(p2)
	-- upvalues: CryoModule (copy), ConversationChannelsModule (copy)
	return CryoModule.Dictionary.join(ConversationChannelsModule.mockBase(), p2 or {})
end

function ConversationChannelsModule.response(p2)
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

function ConversationChannelsModule.fromChannelsApi(p2)
	-- upvalues: ConversationChannelsModule (copy), getFriendId (copy), ConversationModule (copy), ConstantsModule (copy), _DateTime (copy)
	local Type = p2.type
	local config = {
		source = p2.source,
		type = p2.type,
		createdAt = p2.created_at,
		messages = ConversationChannelsModule.getEmptyMessages(),
		sendingMessages = ConversationChannelsModule.getEmptySendingMessages(),
		id = if p2.source == "friends" then getFriendId(p2) else tostring(p2.id),
		clientId = "",
		initiator = tostring(p2.created_by),
		hasUnreadMessages = p2.unread_message_count > 0,
		conversationType = if p2.source == "friends" then ConversationModule.Type.ONE_TO_ONE_CONVERSATION elseif Type == "group" then ConversationModule.Type.MULTI_USER_CONVERSATION elseif Type == "one_to_one" then ConversationModule.Type.ONE_TO_ONE_CONVERSATION else ConversationModule.Type.ONE_TO_ONE_CONVERSATION,
		usersTyping = {},
		isUserLeaving = false,
		fetchingOlderMessages = false,
		serverState = if p2.source == "friends" then ConstantsModule.ServerState.NONE else ConstantsModule.ServerState.CREATED,
		pinnedGame = {},
		moderationType = p2.moderation_type,
		userPendingStatus = p2.user_pending_status,
		participantPendingStatus = p2.participant_pending_status
	}
	local PreviewMessage = p2.preview_message
	
	if PreviewMessage then
		if PreviewMessage.is_previewable then
			config.previewMessageId = PreviewMessage.id
		end
		config.previewContent = PreviewMessage.content or PreviewMessage.preview_content
	end
	config.hasGroupUp = if p2.has_group_up then p2.has_group_up else false
	config.lastUpdated = _DateTime.fromIsoDate(p2.updated_at)
	config.title = p2.name
	config.titleForViewer = ""
	config.isDefaultTitle = p2.name == nil
	config.participants = {}
	
	if p2.participant_user_ids then
		for _, participantUserId in p2.participant_user_ids do
			table.insert(config.participants, (tostring(participantUserId)))
		end
	end
	if p2.osa_acknowledgement_status then
		config.osaAcknowledgementStatus = p2.osa_acknowledgement_status
	end
	if p2.user_opted_into_chat_messages then
		config.userOptedIntoChatMessages = p2.user_opted_into_chat_messages
	end
	return config
end

function ConversationChannelsModule.getFriendConversationId(Participant_user_ids)
	-- upvalues: getFriendId (copy)
	return (getFriendId({ participant_user_ids = Participant_user_ids }))
end

return ConversationChannelsModule