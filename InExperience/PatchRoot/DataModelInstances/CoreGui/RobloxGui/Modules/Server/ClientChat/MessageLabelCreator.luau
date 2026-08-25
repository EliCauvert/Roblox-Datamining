local t = {}
local chatService = game:GetService("Chat")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local messageCreatorModules = clientChatModules:WaitForChild("MessageCreatorModules")
local utilModule = require(messageCreatorModules:WaitForChild("Util"))
local parent = script.Parent
local _ = require(clientChatModules:WaitForChild("ChatSettings"))
local objectPoolModule = require(parent:WaitForChild("ObjectPool"))
local _ = require(parent:WaitForChild("MessageSender"))
local t_1 = {}
t_1.__index = t_1

function mergeProps(p0, p1)
	if not p0 then return end
	for i, v in pairs(p0) do
		p1[i] = v
	end
end

function ReturnToObjectPoolRecursive(p2, p3)
	local children = p2:GetChildren()
	
	for i = 1, #children do
		ReturnToObjectPoolRecursive(children[i], p3)
	end
	p2.Parent = nil
	p3:ReturnInstance(p2)
end

function GetMessageCreators()
	-- upvalues: messageCreatorModules (ref), utilModule (ref)
	local t = {}
	local children = messageCreatorModules:GetChildren()
	
	for i = 1, #children do
		if children[i]:IsA("ModuleScript") and children[i].Name ~= "Util" then
			local unknownModule = require(children[i])
			t[unknownModule[utilModule.KEY_MESSAGE_TYPE]] = unknownModule[utilModule.KEY_CREATOR_FUNCTION]
		end
	end
	return t
end

function t_1.WrapIntoMessageObject(p4, p5, p6)
	-- upvalues: utilModule (ref)
	return {
		ID = p5.ID,
		BaseFrame = p6[utilModule.KEY_BASE_FRAME],
		BaseMessage = if utilModule.KEY_BASE_MESSAGE then p6[utilModule.KEY_BASE_MESSAGE] else nil,
		UpdateTextFunction = p6[utilModule.KEY_UPDATE_TEXT_FUNC] or function()
			warn("NO MESSAGE RESIZE FUNCTION")
		end,
		GetHeightFunction = p6[utilModule.KEY_GET_HEIGHT],
		FadeInFunction = p6[utilModule.KEY_FADE_IN],
		FadeOutFunction = p6[utilModule.KEY_FADE_OUT],
		UpdateAnimFunction = p6[utilModule.KEY_UPDATE_ANIMATION],
		ObjectPool = p4.ObjectPool,
		Destroyed = false,
		Destroy = function(p7)
			ReturnToObjectPoolRecursive(p7.BaseFrame, p7.ObjectPool)
			p7.Destroyed = true
		end
	}
end

function t_1.CreateMessageLabel_Chat(p8, p9, p10, p11)
	-- upvalues: chatService (ref)
	p9.Channel = p10
	local var11 = nil
	pcall(function()
		-- upvalues: var11 (write), chatService (copy), p9 (ref)
		var11 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p9)
	end)
	p9.ExtraData = p9.ExtraData or {}
	mergeProps(var11, p9.ExtraData)
	local messageType = p9.MessageType
	
	if p8.MessageCreators[messageType] then
		local var13 = p8.MessageCreators[messageType](p9, p10, p11)
		
		if var13 then
			return p8:WrapIntoMessageObject(p9, var13)
		end
	elseif p8.DefaultCreatorType then
		local var12 = p8.MessageCreators[p8.DefaultCreatorType](p9, p10, p11)
		
		if var12 then
			return p8:WrapIntoMessageObject(p9, var12)
		end
	else
		error("No message creator available for message type: " .. messageType)
	end
end

function t_1.CreateMessageLabel(p12, p13, p14)
	-- upvalues: chatService (ref)
	p13.Channel = p14
	local var14 = nil
	pcall(function()
		-- upvalues: var14 (write), chatService (copy), p13 (ref)
		var14 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p13)
	end)
	p13.ExtraData = p13.ExtraData or {}
	mergeProps(var14, p13.ExtraData)
	local messageType = p13.MessageType
	
	if p12.MessageCreators[messageType] then
		local var16 = p12.MessageCreators[messageType](p13, p14)
		
		if var16 then
			return p12:WrapIntoMessageObject(p13, var16)
		end
	elseif p12.DefaultCreatorType then
		local var15 = p12.MessageCreators[p12.DefaultCreatorType](p13, p14)
		
		if var15 then
			return p12:WrapIntoMessageObject(p13, var15)
		end
	else
		error("No message creator available for message type: " .. messageType)
	end
end

function t.new()
	-- upvalues: t_1 (ref), objectPoolModule (ref), utilModule (ref)
	local tbl = setmetatable({}, t_1)
	tbl.ObjectPool = objectPoolModule.new(50)
	tbl.MessageCreators = GetMessageCreators()
	tbl.DefaultCreatorType = utilModule.DEFAULT_MESSAGE_CREATOR
	utilModule:RegisterObjectPool(tbl.ObjectPool)
	
	return tbl
end

function t.GetStringTextBounds(_, p15, p16, p17, p18)
	-- upvalues: utilModule (ref)
	return utilModule:GetStringTextBounds(p15, p16, p17, p18)
end

return t