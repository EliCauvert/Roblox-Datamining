local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local orderedMap = require(parent.AppCommonLib).OrderedMap
local constantsModule = require(appChat.Constants)
local dateTime = require(parent.Time).DateTime
local appChatNetworkingModule = require(parent.AppChatNetworking)
local playersService = game:GetService("Players")

local function getMessageId(p0)
	return p0.id
end

local function messageSortPredicate(p1, p2)
	return p1.sent:GetUnixTimestamp() < p2.sent:GetUnixTimestamp()
end

local function sendingMessageSortPredicate(p3, p4)
	return p3.order < p4.order
end

local t = {
	Type = {
		MULTI_USER_CONVERSATION = "MultiUserConversation",
		ONE_TO_ONE_CONVERSATION = "OneToOneConversation"
	},
	OsaAcknowledgementStatus = appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse,
	UserOptedIntoChatMessagesStatus = appChatNetworkingModule.Constants.UserOptedIntoChatMessagesStatusResponse
}

function t.IdForFakeOneOnOne(p5)
	-- upvalues: t (ref)
	local ONE_TO_ONE_CONVERSATION = t.Type.ONE_TO_ONE_CONVERSATION
	table.sort(p5)
	
	for i, v in ipairs(p5) do
		ONE_TO_ONE_CONVERSATION ..= "-" .. tostring(v)
	end
	return ONE_TO_ONE_CONVERSATION
end

function t.new()
	return {}
end

function t.fromUser(p6)
	-- upvalues: t (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), generateStringId (ref), playersService (ref), constantsModule (ref)
	local var8 = t.new()
	var8.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var8.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var8.clientId = generateStringId()
	var8.initiator = nil
	var8.hasUnreadMessages = false
	var8.conversationType = t.Type.ONE_TO_ONE_CONVERSATION
	var8.participants = { tostring(playersService.LocalPlayer.UserId), p6.id }
	var8.usersTyping = {}
	var8.isUserLeaving = false
	var8.fetchingOlderMessages = false
	var8.fetchedOldestMessage = false
	var8.serverState = constantsModule.ServerState.NONE
	var8.id = t.IdForFakeOneOnOne(var8.participants)
	var8.lastUpdated = nil
	var8.isDefaultTitle = true
	var8.title = p6.displayName or p6.name
	
	return var8
end

function t.empty(p7)
	-- upvalues: t (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), constantsModule (ref), dateTime (ref)
	local var9 = t.new()
	var9.id = "-1"
	var9.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var9.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var9.title = ""
	var9.initiator = "0"
	var9.hasUnreadMessages = false
	var9.conversationType = t.Type.MULTI_USER_CONVERSATION
	var9.participants = {}
	var9.usersTyping = {}
	var9.isUserLeaving = false
	var9.fetchingOlderMessages = false
	var9.serverState = constantsModule.ServerState.NONE
	var9.pinnedGame = {}
	var9.lastUpdated = dateTime.now()
	var9.isDefaultTitle = true
	var9.osaAcknowledgementStatus = t.OsaAcknowledgementStatus.NotApplicable
	var9.userOptedIntoChatMessages = t.UserOptedIntoChatMessagesStatus.NotApplicable
	
	if p7 ~= nil then
		for i, v in pairs(p7) do
			var9[i] = v
		end
	end
	return var9
end

function t.fromWeb(p8, p9)
	-- upvalues: t (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), generateStringId (ref), constantsModule (ref), dateTime (ref)
	local var10 = t.new()
	var10.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var10.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var10.id = tostring(p8.id)
	var10.clientId = p9 or generateStringId()
	var10.title = p8.title
	var10.initiator = tostring(p8.initiator.targetId)
	var10.hasUnreadMessages = p8.hasUnreadMessages
	var10.conversationType = p8.conversationType
	var10.participants = {}
	var10.usersTyping = {}
	var10.isUserLeaving = false
	var10.fetchingOlderMessages = false
	var10.serverState = constantsModule.ServerState.CREATED
	var10.pinnedGame = {}
	
	if p8.conversationUniverse ~= nil then
		var10.pinnedGame.universeId = tostring(p8.conversationUniverse.universeId)
		var10.pinnedGame.rootPlaceId = tostring(p8.conversationUniverse.rootPlaceId)
	end
	var10.lastUpdated = dateTime.fromIsoDate(p8.lastUpdated)
	var10.titleForViewer = p8.conversationTitle.titleForViewer
	var10.isDefaultTitle = p8.conversationTitle.isDefaultTitle
	
	for i, v in ipairs(p8.participants) do
		table.insert(var10.participants, tostring(v.targetId))
	end
	return var10
end

return t