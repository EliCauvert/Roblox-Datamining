local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local name = require(appChat.Logger):new(script.Name)
local messageModelModule = require(appChat.Models.MessageModel)
local sendChatMessagePolicyModule = require(script.Parent.SendChatMessagePolicy)
local tbl = setmetatable({}, sendChatMessagePolicyModule)
tbl.__index = tbl

function tbl.new(p0, p1, p2, p3, p4)
	-- upvalues: name (ref), sendChatMessagePolicyModule (ref)
	name:info("New policy constructed for conversationId: {} messageText: {}, replyingToId: {}", p1, p2, if p3 then p3.id else nil)
	local var6 = sendChatMessagePolicyModule:new(p1, p3)
	setmetatable(var6, p0)
	var6.messageText = p2
	var6.decorators = p4
	
	return var6
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