local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local orderedMap = require(parent.AppCommonLib).OrderedMap
local constantsModule = require(appChat.Constants)
local dateTime = require(parent.Time).DateTime
local appChatNetworkingModule = require(parent.AppChatNetworking)
local playersService = game:GetService("Players")

local function getMessageId(p1)
	return p1.id
end

local function messageSortPredicate(p1, p2)
	return p1.sent:GetUnixTimestamp() < p2.sent:GetUnixTimestamp()
end

local function sendingMessageSortPredicate(p1, p2)
	return p1.order < p2.order
end

local t = {
	Type = {
		MULTI_USER_CONVERSATION = "MultiUserConversation",
		ONE_TO_ONE_CONVERSATION = "OneToOneConversation"
	},
	OsaAcknowledgementStatus = appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse,
	UserOptedIntoChatMessagesStatus = appChatNetworkingModule.Constants.UserOptedIntoChatMessagesStatusResponse
}

function t.IdForFakeOneOnOne(p1)
	-- upvalues: t (ref)
	local ONE_TO_ONE_CONVERSATION = t.Type.ONE_TO_ONE_CONVERSATION
	table.sort(p1)
	
	for i, v in ipairs(p1) do
		ONE_TO_ONE_CONVERSATION ..= "-" .. tostring(v)
	end
	return ONE_TO_ONE_CONVERSATION
end

function t.new()
	return {}
end

function t.fromUser(p2)
	-- upvalues: t (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), generateStringId (ref), playersService (ref), constantsModule (ref)
	local var1 = t.new()
	var1.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var1.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var1.clientId = generateStringId()
	var1.initiator = nil
	var1.hasUnreadMessages = false
	var1.conversationType = t.Type.ONE_TO_ONE_CONVERSATION
	var1.participants = { tostring(playersService.LocalPlayer.UserId), p2.id }
	var1.usersTyping = {}
	var1.isUserLeaving = false
	var1.fetchingOlderMessages = false
	var1.fetchedOldestMessage = false
	var1.serverState = constantsModule.ServerState.NONE
	var1.id = t.IdForFakeOneOnOne(var1.participants)
	var1.lastUpdated = nil
	var1.isDefaultTitle = true
	var1.title = p2.displayName or p2.name
	
	return var1
end

function t.empty(p2)
	-- upvalues: t (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), constantsModule (ref), dateTime (ref)
	local var1 = t.new()
	var1.id = "-1"
	var1.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var1.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var1.title = ""
	var1.initiator = "0"
	var1.hasUnreadMessages = false
	var1.conversationType = t.Type.MULTI_USER_CONVERSATION
	var1.participants = {}
	var1.usersTyping = {}
	var1.isUserLeaving = false
	var1.fetchingOlderMessages = false
	var1.serverState = constantsModule.ServerState.NONE
	var1.pinnedGame = {}
	var1.lastUpdated = dateTime.now()
	var1.isDefaultTitle = true
	var1.osaAcknowledgementStatus = t.OsaAcknowledgementStatus.NotApplicable
	var1.userOptedIntoChatMessages = t.UserOptedIntoChatMessagesStatus.NotApplicable
	
	if p2 ~= nil then
		for i, v in pairs(p2) do
			var1[i] = v
		end
	end
	return var1
end

function t.fromWeb(p3, p4)
	-- upvalues: t (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), generateStringId (ref), constantsModule (ref), dateTime (ref)
	local var2 = t.new()
	var2.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var2.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var2.id = tostring(p3.id)
	var2.clientId = p4 or generateStringId()
	var2.title = p3.title
	var2.initiator = tostring(p3.initiator.targetId)
	var2.hasUnreadMessages = p3.hasUnreadMessages
	var2.conversationType = p3.conversationType
	var2.participants = {}
	var2.usersTyping = {}
	var2.isUserLeaving = false
	var2.fetchingOlderMessages = false
	var2.serverState = constantsModule.ServerState.CREATED
	var2.pinnedGame = {}
	
	if p3.conversationUniverse ~= nil then
		var2.pinnedGame.universeId = tostring(p3.conversationUniverse.universeId)
		var2.pinnedGame.rootPlaceId = tostring(p3.conversationUniverse.rootPlaceId)
	end
	var2.lastUpdated = dateTime.fromIsoDate(p3.lastUpdated)
	var2.titleForViewer = p3.conversationTitle.titleForViewer
	var2.isDefaultTitle = p3.conversationTitle.isDefaultTitle
	
	for i, v in ipairs(p3.participants) do
		table.insert(var2.participants, tostring(v.targetId))
	end
	return var2
end

return t