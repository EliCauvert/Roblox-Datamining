local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local GenerateStringIdFunction = require(Parent.AppCommonLib).GenerateStringId
local OrderedMap = require(Parent.AppCommonLib).OrderedMap
local ConstantsModule = require(AppChat.Constants)
local _DateTime = require(Parent.Time).DateTime
local ConversationModule = require(script.Parent.Conversation)

local function getMessageId(p1) --[[ Line: 11 ]]
	return p1.id
end

local function messageSortPredicate(p1, p2): boolean --[[ Line: 15 ]]
	return p1.sent:GetUnixTimestamp() < p2.sent:GetUnixTimestamp()
end

local function sendingMessageSortPredicate(p1, p2): boolean --[[ Line: 22 ]]
	return p1.order < p2.order
end

local MockConversationModule = {}
MockConversationModule.__index = MockConversationModule

function MockConversationModule.mock(List) --[[ Line: 29 ]]
	-- upvalues: ConversationModule (copy), OrderedMap (copy), getMessageId (copy), messageSortPredicate (copy), sendingMessageSortPredicate (copy), GenerateStringIdFunction (copy), ConstantsModule (copy), _DateTime (copy)
	local NewConversation = ConversationModule.new()
	NewConversation.messages = OrderedMap.new(getMessageId, messageSortPredicate)
	NewConversation.sendingMessages = OrderedMap.new(getMessageId, sendingMessageSortPredicate)
	NewConversation.id = GenerateStringIdFunction()
	NewConversation.clientId = GenerateStringIdFunction()
	NewConversation.title = ""
	NewConversation.initiator = GenerateStringIdFunction()
	NewConversation.hasUnreadMessages = false
	NewConversation.conversationType = ConversationModule.Type.MULTI_USER_CONVERSATION
	NewConversation.participants = {}
	NewConversation.usersTyping = {}
	NewConversation.isUserLeaving = false
	NewConversation.fetchingOlderMessages = false
	NewConversation.fetchedOldestMessage = false
	NewConversation.serverState = ConstantsModule.ServerState.NONE
	NewConversation.pinnedGame = {}
	NewConversation.pinnedGame.universeId = GenerateStringIdFunction()
	NewConversation.pinnedGame.rootPlaceId = GenerateStringIdFunction()
	NewConversation.lastUpdated = _DateTime.now()
	NewConversation.titleForViewer = "title"
	NewConversation.isDefaultTitle = true
	
	if List ~= nil then
		for i, value in pairs(List) do
			NewConversation[i] = value
		end
	end
	setmetatable(NewConversation, { __index = ConversationModule })
	
	return NewConversation
end

return MockConversationModule