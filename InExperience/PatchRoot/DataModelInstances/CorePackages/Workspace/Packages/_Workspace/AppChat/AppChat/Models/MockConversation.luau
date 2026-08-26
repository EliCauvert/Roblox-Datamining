local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local orderedMap = require(parent.AppCommonLib).OrderedMap
local constantsModule = require(appChat.Constants)
local dateTime = require(parent.Time).DateTime
local conversationModule = require(script.Parent.Conversation)

local function getMessageId(p1)
	return p1.id
end

local function messageSortPredicate(p1, p2)
	return p1.sent:GetUnixTimestamp() < p2.sent:GetUnixTimestamp()
end

local function sendingMessageSortPredicate(p1, p2)
	return p1.order < p2.order
end

local t = {}
t.__index = t

function t.mock(p1)
	-- upvalues: conversationModule (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), generateStringId (ref), constantsModule (ref), dateTime (ref)
	local var1 = conversationModule.new()
	var1.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var1.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var1.id = generateStringId()
	var1.clientId = generateStringId()
	var1.title = ""
	var1.initiator = generateStringId()
	var1.hasUnreadMessages = false
	var1.conversationType = conversationModule.Type.MULTI_USER_CONVERSATION
	var1.participants = {}
	var1.usersTyping = {}
	var1.isUserLeaving = false
	var1.fetchingOlderMessages = false
	var1.fetchedOldestMessage = false
	var1.serverState = constantsModule.ServerState.NONE
	var1.pinnedGame = {}
	var1.pinnedGame.universeId = generateStringId()
	var1.pinnedGame.rootPlaceId = generateStringId()
	var1.lastUpdated = dateTime.now()
	var1.titleForViewer = "title"
	var1.isDefaultTitle = true
	
	if p1 ~= nil then
		for i, v in pairs(p1) do
			var1[i] = v
		end
	end
	setmetatable(var1, { __index = conversationModule })
	
	return var1
end

return t