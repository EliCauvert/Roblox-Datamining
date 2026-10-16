local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local GenerateStringIdFunction = require(Parent.AppCommonLib).GenerateStringId
local OrderedMap = require(Parent.AppCommonLib).OrderedMap
local ConstantsModule = require(AppChat.Constants)
local _DateTime = require(Parent.Time).DateTime
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local Players = game:GetService("Players")

local function getMessageId(p1) --[[ Line: 13 ]]
	return p1.id
end

local function messageSortPredicate(p1, p2): boolean --[[ Line: 17 ]]
	return p1.sent:GetUnixTimestamp() < p2.sent:GetUnixTimestamp()
end

local function sendingMessageSortPredicate(p1, p2): boolean --[[ Line: 24 ]]
	return p1.order < p2.order
end

local ConversationModule = {
	Type = {
		MULTI_USER_CONVERSATION = "MultiUserConversation",
		ONE_TO_ONE_CONVERSATION = "OneToOneConversation"
	},
	OsaAcknowledgementStatus = AppChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse,
	UserOptedIntoChatMessagesStatus = AppChatNetworkingModule.Constants.UserOptedIntoChatMessagesStatusResponse
}

function ConversationModule.IdForFakeOneOnOne(List) --[[ Line: 38 ]]
	-- upvalues: ConversationModule (copy)
	local ONETOONECONVERSATION = ConversationModule.Type.ONE_TO_ONE_CONVERSATION
	table.sort(List)
	
	for _, value in ipairs(List) do
		ONETOONECONVERSATION ..= "-" .. tostring(value)
	end
	return ONETOONECONVERSATION
end

function ConversationModule.new() --[[ Line: 50 ]]
	return {}
end

function ConversationModule.fromUser(p1) --[[ Line: 56 ]]
	-- upvalues: ConversationModule (copy), OrderedMap (copy), getMessageId (copy), messageSortPredicate (copy), sendingMessageSortPredicate (copy), GenerateStringIdFunction (copy), Players (copy), ConstantsModule (copy)
	local NewConversation = ConversationModule.new()
	NewConversation.messages = OrderedMap.new(getMessageId, messageSortPredicate)
	NewConversation.sendingMessages = OrderedMap.new(getMessageId, sendingMessageSortPredicate)
	NewConversation.clientId = GenerateStringIdFunction()
	NewConversation.initiator = nil
	NewConversation.hasUnreadMessages = false
	NewConversation.conversationType = ConversationModule.Type.ONE_TO_ONE_CONVERSATION
	NewConversation.participants = { tostring(Players.LocalPlayer.UserId), p1.id }
	NewConversation.usersTyping = {}
	NewConversation.isUserLeaving = false
	NewConversation.fetchingOlderMessages = false
	NewConversation.fetchedOldestMessage = false
	NewConversation.serverState = ConstantsModule.ServerState.NONE
	NewConversation.id = ConversationModule.IdForFakeOneOnOne(NewConversation.participants)
	NewConversation.lastUpdated = nil
	NewConversation.isDefaultTitle = true
	NewConversation.title = p1.displayName or p1.name
	
	return NewConversation
end

function ConversationModule.empty(List) --[[ Line: 82 ]]
	-- upvalues: ConversationModule (copy), OrderedMap (copy), getMessageId (copy), messageSortPredicate (copy), sendingMessageSortPredicate (copy), ConstantsModule (copy), _DateTime (copy)
	local NewConversation = ConversationModule.new()
	NewConversation.id = "-1"
	NewConversation.messages = OrderedMap.new(getMessageId, messageSortPredicate)
	NewConversation.sendingMessages = OrderedMap.new(getMessageId, sendingMessageSortPredicate)
	NewConversation.title = ""
	NewConversation.initiator = "0"
	NewConversation.hasUnreadMessages = false
	NewConversation.conversationType = ConversationModule.Type.MULTI_USER_CONVERSATION
	NewConversation.participants = {}
	NewConversation.usersTyping = {}
	NewConversation.isUserLeaving = false
	NewConversation.fetchingOlderMessages = false
	NewConversation.serverState = ConstantsModule.ServerState.NONE
	NewConversation.pinnedGame = {}
	NewConversation.lastUpdated = _DateTime.now()
	NewConversation.isDefaultTitle = true
	NewConversation.osaAcknowledgementStatus = ConversationModule.OsaAcknowledgementStatus.NotApplicable
	NewConversation.userOptedIntoChatMessages = ConversationModule.UserOptedIntoChatMessagesStatus.NotApplicable
	
	if List ~= nil then
		for i, value in pairs(List) do
			NewConversation[i] = value
		end
	end
	return NewConversation
end

function ConversationModule.fromWeb(p1, p2) --[[ Line: 116 ]]
	-- upvalues: ConversationModule (copy), OrderedMap (copy), getMessageId (copy), messageSortPredicate (copy), sendingMessageSortPredicate (copy), GenerateStringIdFunction (copy), ConstantsModule (copy), _DateTime (copy)
	local NewConversation = ConversationModule.new()
	NewConversation.messages = OrderedMap.new(getMessageId, messageSortPredicate)
	NewConversation.sendingMessages = OrderedMap.new(getMessageId, sendingMessageSortPredicate)
	NewConversation.id = tostring(p1.id)
	NewConversation.clientId = p2 or GenerateStringIdFunction()
	NewConversation.title = p1.title
	NewConversation.initiator = tostring(p1.initiator.targetId)
	NewConversation.hasUnreadMessages = p1.hasUnreadMessages
	NewConversation.conversationType = p1.conversationType
	NewConversation.participants = {}
	NewConversation.usersTyping = {}
	NewConversation.isUserLeaving = false
	NewConversation.fetchingOlderMessages = false
	NewConversation.serverState = ConstantsModule.ServerState.CREATED
	NewConversation.pinnedGame = {}
	
	if p1.conversationUniverse ~= nil then
		NewConversation.pinnedGame.universeId = tostring(p1.conversationUniverse.universeId)
		NewConversation.pinnedGame.rootPlaceId = tostring(p1.conversationUniverse.rootPlaceId)
	end
	NewConversation.lastUpdated = _DateTime.fromIsoDate(p1.lastUpdated)
	NewConversation.titleForViewer = p1.conversationTitle.titleForViewer
	NewConversation.isDefaultTitle = p1.conversationTitle.isDefaultTitle
	
	for _, participant in ipairs(p1.participants) do
		table.insert(NewConversation.participants, (tostring(participant.targetId)))
	end
	return NewConversation
end

return ConversationModule