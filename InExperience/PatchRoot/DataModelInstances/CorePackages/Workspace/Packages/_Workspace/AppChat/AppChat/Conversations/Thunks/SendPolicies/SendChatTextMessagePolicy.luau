local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local sharedFlagsModule = require(parent.SharedFlags)
local chatAiAgentMessageTransformModule = require(appChat.Utils.ChatAiAgentMessageTransform)
local name = require(appChat.Logger):new(script.Name)
local fFlagChatAiAgentToggle = sharedFlagsModule.FFlagChatAiAgentToggle
local messageModelModule = require(appChat.Models.MessageModel)
local sendChatMessagePolicyModule = require(script.Parent.SendChatMessagePolicy)
local tbl = setmetatable({}, sendChatMessagePolicyModule)
tbl.__index = tbl

function tbl.new(p0, p1, p2, p3, p4) --[[ line: 17 ]]
	-- upvalues: name (ref), sendChatMessagePolicyModule (ref)
	name:info("New policy constructed for conversationId: {} messageText: {}, replyingToId: {}", p1, p2, if p3 then p3.id else nil)
	local var8 = sendChatMessagePolicyModule:new(p1, p3)
	setmetatable(var8, p0)
	var8.messageText = p2
	var8.decorators = p4
	
	return var8
end

function tbl:sendMessage(_) --[[ line: 35 ]]
	-- upvalues: name (ref), appChatNetworkingModule (ref), fFlagChatAiAgentToggle (ref), chatAiAgentMessageTransformModule (ref)
	name:info("sendMessage - conversationId: {} messageText: {}, replyingToId: {}", self.conversationId, self.messageText, if self.replyingToMessage then self.replyingToMessage.id else nil)
	
	return appChatNetworkingModule.http.SendChatTextMessage(nil, self.conversationId, if fFlagChatAiAgentToggle then chatAiAgentMessageTransformModule.prependUserSendPrefixForApi(self.messageText) else self.messageText, if self.replyingToMessage then self.replyingToMessage.id else nil)
end

function tbl:sendingMessagePayload() --[[ line: 53 ]]
	-- upvalues: messageModelModule (ref)
	return {
		messageType = messageModelModule.MessageTypes.PlainText,
		content = self.messageText
	}
end

return tbl