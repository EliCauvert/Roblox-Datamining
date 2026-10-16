local Parent = script:FindFirstAncestor("AppChat").Parent
local _DateTime = require(Parent.Time).DateTime
local GenerateStringIdFunction = require(Parent.AppCommonLib).GenerateStringId
local MessageModelModule = require(script.Parent.MessageModel)
local MockMessageModelModule = {
	mock = function(List) --[[ Line: 11 ]]
		-- upvalues: MessageModelModule (copy), GenerateStringIdFunction (copy), _DateTime (copy)
		local NewMessageModel = MessageModelModule.new()
		NewMessageModel.id = GenerateStringIdFunction()
		NewMessageModel.senderTargetId = GenerateStringIdFunction()
		NewMessageModel.conversationId = GenerateStringIdFunction()
		NewMessageModel.senderType = MessageModelModule.SenderTypes.User
		NewMessageModel.content = "MESSAGE CONTENT"
		NewMessageModel.messageType = MessageModelModule.MessageTypes.PlainText
		NewMessageModel.read = false
		NewMessageModel.sent = _DateTime.now()
		NewMessageModel.previousMessageId = nil
		NewMessageModel.filteredForReceivers = false
		
		if List ~= nil then
			for i, value in pairs(List) do
				NewMessageModel[i] = value
			end
		end
		return NewMessageModel
	end
}
setmetatable(MockMessageModelModule, { __index = MessageModelModule })

return MockMessageModelModule