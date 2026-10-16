local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local NewResult = require(AppChat.Logger):new(script.Name)
local MessageModelModule = require(AppChat.Models.MessageModel)
local SendChatMessagePolicyModule = require(script.Parent.SendChatMessagePolicy)
local self = setmetatable({}, SendChatMessagePolicyModule)
self.__index = self

function self.new(p1, p2, MessageText, MessageText1, Decorators) --[[ Line: 13 ]]
	-- upvalues: NewResult (copy), SendChatMessagePolicyModule (copy)
	NewResult:info("New policy constructed for conversationId: {} messageText: {}, replyingToId: {}", p2, MessageText, if MessageText1 then MessageText1.id else nil)
	local NewResult1 = SendChatMessagePolicyModule:new(p2, MessageText1)
	setmetatable(NewResult1, p1)
	NewResult1.messageText = MessageText
	NewResult1.decorators = Decorators
	
	return NewResult1
end

function self:sendMessage(_) --[[ Line: 31 ]]
	-- upvalues: NewResult (copy), AppChatNetworkingModule (copy)
	NewResult:info("sendMessage - conversationId: {} messageText: {}, replyingToId: {}", self.conversationId, self.messageText, if self.replyingToMessage then self.replyingToMessage.id else nil)
	
	return AppChatNetworkingModule.http.SendChatTextMessage(nil, self.conversationId, self.messageText, if self.replyingToMessage then self.replyingToMessage.id else nil)
end

function self:sendingMessagePayload() --[[ Line: 47 ]]
	-- upvalues: MessageModelModule (copy)
	return {
		messageType = MessageModelModule.MessageTypes.PlainText,
		content = self.messageText
	}
end

return self