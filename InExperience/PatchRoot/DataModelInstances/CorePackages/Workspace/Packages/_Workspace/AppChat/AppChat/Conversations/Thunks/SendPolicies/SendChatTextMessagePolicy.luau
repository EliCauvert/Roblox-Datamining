local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local name = require(appChat.Logger):new(script.Name)
local messageModelModule = require(appChat.Models.MessageModel)
local sendChatMessagePolicyModule = require(script.Parent.SendChatMessagePolicy)
local tbl = setmetatable({}, sendChatMessagePolicyModule)
tbl.__index = tbl

function tbl.new(p1, p2, p3, p4, p5)
	-- upvalues: name (ref), sendChatMessagePolicyModule (ref)
	name:info("New policy constructed for conversationId: {} messageText: {}, replyingToId: {}", p2, p3, if p4 then p4.id else nil)
	local var1 = sendChatMessagePolicyModule:new(p2, p4)
	setmetatable(var1, p1)
	var1.messageText = p3
	var1.decorators = p5
	
	return var1
end

function tbl:sendMessage(_)
	-- upvalues: name (ref), appChatNetworkingModule (ref)
	name:info("sendMessage - conversationId: {} messageText: {}, replyingToId: {}", self.conversationId, self.messageText, if self.replyingToMessage then self.replyingToMessage.id else nil)
	
	return appChatNetworkingModule.http.SendChatTextMessage(nil, self.conversationId, self.messageText, if self.replyingToMessage then self.replyingToMessage.id else nil)
end

function tbl:sendingMessagePayload()
	-- upvalues: messageModelModule (ref)
	return {
		messageType = messageModelModule.MessageTypes.PlainText,
		content = self.messageText
	}
end

return tbl