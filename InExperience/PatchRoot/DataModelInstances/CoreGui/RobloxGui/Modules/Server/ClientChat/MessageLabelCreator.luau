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

function mergeProps(p1, p2)
	if not p1 then return end
	for i, v in pairs(p1) do
		p2[i] = v
	end
end

function ReturnToObjectPoolRecursive(p3, p4)
	local children = p3:GetChildren()
	
	for i = 1, #children do
		ReturnToObjectPoolRecursive(children[i], p4)
	end
	p3.Parent = nil
	p4:ReturnInstance(p3)
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

function t_1.WrapIntoMessageObject(p5, p6, p7)
	-- upvalues: utilModule (ref)
	return {
		ID = p6.ID,
		BaseFrame = p7[utilModule.KEY_BASE_FRAME],
		BaseMessage = if utilModule.KEY_BASE_MESSAGE then p7[utilModule.KEY_BASE_MESSAGE] else nil,
		UpdateTextFunction = p7[utilModule.KEY_UPDATE_TEXT_FUNC] or function()
			warn("NO MESSAGE RESIZE FUNCTION")
		end,
		GetHeightFunction = p7[utilModule.KEY_GET_HEIGHT],
		FadeInFunction = p7[utilModule.KEY_FADE_IN],
		FadeOutFunction = p7[utilModule.KEY_FADE_OUT],
		UpdateAnimFunction = p7[utilModule.KEY_UPDATE_ANIMATION],
		ObjectPool = p5.ObjectPool,
		Destroyed = false,
		Destroy = function(p8)
			ReturnToObjectPoolRecursive(p8.BaseFrame, p8.ObjectPool)
			p8.Destroyed = true
		end
	}
end

function t_1.CreateMessageLabel_Chat(p5, p6, p7, p8)
	-- upvalues: chatService (ref)
	p6.Channel = p7
	local var1 = nil
	pcall(function()
		-- upvalues: var1 (write), chatService (copy), p6 (ref)
		var1 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p6)
	end)
	p6.ExtraData = p6.ExtraData or {}
	mergeProps(var1, p6.ExtraData)
	local messageType = p6.MessageType
	
	if p5.MessageCreators[messageType] then
		local var2 = p5.MessageCreators[messageType](p6, p7, p8)
		
		if var2 then
			return p5:WrapIntoMessageObject(p6, var2)
		end
	elseif p5.DefaultCreatorType then
		local var3 = p5.MessageCreators[p5.DefaultCreatorType](p6, p7, p8)
		
		if var3 then
			return p5:WrapIntoMessageObject(p6, var3)
		end
	else
		error("No message creator available for message type: " .. messageType)
	end
end

function t_1.CreateMessageLabel(p5, p6, p7)
	-- upvalues: chatService (ref)
	p6.Channel = p7
	local var1 = nil
	pcall(function()
		-- upvalues: var1 (write), chatService (copy), p6 (ref)
		var1 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p6)
	end)
	p6.ExtraData = p6.ExtraData or {}
	mergeProps(var1, p6.ExtraData)
	local messageType = p6.MessageType
	
	if p5.MessageCreators[messageType] then
		local var2 = p5.MessageCreators[messageType](p6, p7)
		
		if var2 then
			return p5:WrapIntoMessageObject(p6, var2)
		end
	elseif p5.DefaultCreatorType then
		local var3 = p5.MessageCreators[p5.DefaultCreatorType](p6, p7)
		
		if var3 then
			return p5:WrapIntoMessageObject(p6, var3)
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

function t.GetStringTextBounds(_, p5, p6, p7, p8)
	-- upvalues: utilModule (ref)
	return utilModule:GetStringTextBounds(p5, p6, p7, p8)
end

return t