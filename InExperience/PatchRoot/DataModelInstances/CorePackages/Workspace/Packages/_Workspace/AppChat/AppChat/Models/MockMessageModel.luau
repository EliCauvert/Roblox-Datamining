local parent = script:FindFirstAncestor("AppChat").Parent
local dateTime = require(parent.Time).DateTime
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local messageModelModule = require(script.Parent.MessageModel)
local t = {
	mock = function(p0)
		-- upvalues: messageModelModule (ref), generateStringId (ref), dateTime (ref)
		local var2 = messageModelModule.new()
		var2.id = generateStringId()
		var2.senderTargetId = generateStringId()
		var2.conversationId = generateStringId()
		var2.senderType = messageModelModule.SenderTypes.User
		var2.content = "MESSAGE CONTENT"
		var2.messageType = messageModelModule.MessageTypes.PlainText
		var2.read = false
		var2.sent = dateTime.now()
		var2.previousMessageId = nil
		var2.filteredForReceivers = false
		
		if p0 ~= nil then
			for i, v in pairs(p0) do
				var2[i] = v
			end
		end
		return var2
	end
}
setmetatable(t, { __index = messageModelModule })

return t