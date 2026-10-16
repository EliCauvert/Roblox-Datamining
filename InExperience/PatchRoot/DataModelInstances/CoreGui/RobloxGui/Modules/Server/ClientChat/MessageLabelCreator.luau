local Chat = game:GetService("Chat")
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local MessageCreatorModules = ClientChatModules:WaitForChild("MessageCreatorModules")
local UtilModule = require(MessageCreatorModules:WaitForChild("Util"))
local Parent = script.Parent
local _ = require(ClientChatModules:WaitForChild("ChatSettings"))
local ObjectPoolModule = require(Parent:WaitForChild("ObjectPool"))
local _ = require(Parent:WaitForChild("MessageSender"))
local Module = {}
Module.__index = Module

function mergeProps(List, p1) --[[ Line: 26 ]]
	if not List then return end
	for i, value in pairs(List) do
		p1[i] = value
	end
end

function ReturnToObjectPoolRecursive(Object, p2) --[[ Line: 33 ]]
	local Children = Object:GetChildren()
	
	for i = 1, #Children do
		ReturnToObjectPoolRecursive(Children[i], p2)
	end
	Object.Parent = nil
	p2:ReturnInstance(Object)
end

function GetMessageCreators() --[[ Line: 42 ]]
	-- upvalues: MessageCreatorModules (copy), UtilModule (copy)
	local t = {}
	local Children = MessageCreatorModules:GetChildren()
	
	for i = 1, #Children do
		if Children[i]:IsA("ModuleScript") and Children[i].Name ~= "Util" then
			local Module = require(Children[i])
			t[Module[UtilModule.KEY_MESSAGE_TYPE]] = Module[UtilModule.KEY_CREATOR_FUNCTION]
		end
	end
	return t
end

function Module.WrapIntoMessageObject(p3, p4, p5) --[[ Line: 56 ]]
	-- upvalues: UtilModule (copy)
	return {
		ID = p4.ID,
		BaseFrame = p5[UtilModule.KEY_BASE_FRAME],
		BaseMessage = if UtilModule.KEY_BASE_MESSAGE then p5[UtilModule.KEY_BASE_MESSAGE] else nil,
		UpdateTextFunction = p5[UtilModule.KEY_UPDATE_TEXT_FUNC] or function() --[[ Line: 73 ]]
			warn("NO MESSAGE RESIZE FUNCTION")
		end,
		GetHeightFunction = p5[UtilModule.KEY_GET_HEIGHT],
		FadeInFunction = p5[UtilModule.KEY_FADE_IN],
		FadeOutFunction = p5[UtilModule.KEY_FADE_OUT],
		UpdateAnimFunction = p5[UtilModule.KEY_UPDATE_ANIMATION],
		ObjectPool = p3.ObjectPool,
		Destroyed = false,
		Destroy = function(p6) --[[ Line: 81 ]]
			ReturnToObjectPoolRecursive(p6.BaseFrame, p6.ObjectPool)
			p6.Destroyed = true
		end
	}
end

function Module.CreateMessageLabel_Chat(p3, p4, Channel, p5) --[[ Line: 89 ]]
	-- upvalues: Chat (copy)
	p4.Channel = Channel
	local InvokeChatResult = nil
	pcall(function() --[[ Line: 92 ]]
		-- upvalues: InvokeChatResult (ref), Chat (upval), p4 (copy)
		InvokeChatResult = Chat:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p4)
	end)
	p4.ExtraData = p4.ExtraData or {}
	mergeProps(InvokeChatResult, p4.ExtraData)
	local MessageType = p4.MessageType
	
	if p3.MessageCreators[MessageType] then
		local v1 = p3.MessageCreators[MessageType](p4, Channel, p5)
		
		if v1 then
			return p3:WrapIntoMessageObject(p4, v1)
		end
	elseif p3.DefaultCreatorType then
		local v2 = p3.MessageCreators[p3.DefaultCreatorType](p4, Channel, p5)
		
		if v2 then
			return p3:WrapIntoMessageObject(p4, v2)
		end
	else
		error("No message creator available for message type: " .. MessageType)
	end
end

function Module.CreateMessageLabel(p3, p4, Channel) --[[ Line: 114 ]]
	-- upvalues: Chat (copy)
	p4.Channel = Channel
	local InvokeChatResult = nil
	pcall(function() --[[ Line: 118 ]]
		-- upvalues: InvokeChatResult (ref), Chat (upval), p4 (copy)
		InvokeChatResult = Chat:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p4)
	end)
	p4.ExtraData = p4.ExtraData or {}
	mergeProps(InvokeChatResult, p4.ExtraData)
	local MessageType = p4.MessageType
	
	if p3.MessageCreators[MessageType] then
		local v1 = p3.MessageCreators[MessageType](p4, Channel)
		
		if v1 then
			return p3:WrapIntoMessageObject(p4, v1)
		end
	elseif p3.DefaultCreatorType then
		local v2 = p3.MessageCreators[p3.DefaultCreatorType](p4, Channel)
		
		if v2 then
			return p3:WrapIntoMessageObject(p4, v2)
		end
	else
		error("No message creator available for message type: " .. MessageType)
	end
end

return {
	new = function() --[[ Line: 143 ]]
		-- upvalues: Module (copy), ObjectPoolModule (copy), UtilModule (copy)
		local self = setmetatable({}, Module)
		self.ObjectPool = ObjectPoolModule.new(50)
		self.MessageCreators = GetMessageCreators()
		self.DefaultCreatorType = UtilModule.DEFAULT_MESSAGE_CREATOR
		UtilModule:RegisterObjectPool(self.ObjectPool)
		
		return self
	end,
	GetStringTextBounds = function(_, p3, p4, p5, p6) --[[ Line: 155 ]]
		-- upvalues: UtilModule (copy)
		return UtilModule:GetStringTextBounds(p3, p4, p5, p6)
	end
}