local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local orderedMap = require(parent.AppCommonLib).OrderedMap
local constantsModule = require(appChat.Constants)
local dateTime = require(parent.Time).DateTime
local conversationModule = require(script.Parent.Conversation)

local function getMessageId(p0) --[[ line: 11 ]]
	return p0.id
end

local function messageSortPredicate(p1, p2) --[[ line: 15 ]]
	return p1.sent:GetUnixTimestamp() < p2.sent:GetUnixTimestamp()
end

local function sendingMessageSortPredicate(p3, p4) --[[ line: 22 ]]
	return p3.order < p4.order
end

local t = {}
t.__index = t

function t.mock(p5) --[[ line: 29 ]]
	-- upvalues: conversationModule (ref), orderedMap (ref), getMessageId (ref), messageSortPredicate (ref), sendingMessageSortPredicate (ref), generateStringId (ref), constantsModule (ref), dateTime (ref)
	local var7 = conversationModule.new()
	var7.messages = orderedMap.new(getMessageId, messageSortPredicate)
	var7.sendingMessages = orderedMap.new(getMessageId, sendingMessageSortPredicate)
	var7.id = generateStringId()
	var7.clientId = generateStringId()
	var7.title = ""
	var7.initiator = generateStringId()
	var7.hasUnreadMessages = false
	var7.conversationType = conversationModule.Type.MULTI_USER_CONVERSATION
	var7.participants = {}
	var7.usersTyping = {}
	var7.isUserLeaving = false
	var7.fetchingOlderMessages = false
	var7.fetchedOldestMessage = false
	var7.serverState = constantsModule.ServerState.NONE
	var7.pinnedGame = {}
	var7.pinnedGame.universeId = generateStringId()
	var7.pinnedGame.rootPlaceId = generateStringId()
	var7.lastUpdated = dateTime.now()
	var7.titleForViewer = "title"
	var7.isDefaultTitle = true
	
	if p5 ~= nil then
		for i, v in pairs(p5) do
			var7[i] = v
		end
	end
	setmetatable(var7, { __index = conversationModule })
	
	return var7
end

return t