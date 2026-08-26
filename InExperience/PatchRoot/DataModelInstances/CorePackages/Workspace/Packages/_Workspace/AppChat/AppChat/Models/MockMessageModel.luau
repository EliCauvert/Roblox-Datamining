local parent = script:FindFirstAncestor("AppChat").Parent
local dateTime = require(parent.Time).DateTime
local generateStringId = require(parent.AppCommonLib).GenerateStringId
local messageModelModule = require(script.Parent.MessageModel)
local t = {
	mock = function(p1)
		-- upvalues: messageModelModule (ref), generateStringId (ref), dateTime (ref)
		local var1 = messageModelModule.new()
		var1.id = generateStringId()
		var1.senderTargetId = generateStringId()
		var1.conversationId = generateStringId()
		var1.senderType = messageModelModule.SenderTypes.User
		var1.content = "MESSAGE CONTENT"
		var1.messageType = messageModelModule.MessageTypes.PlainText
		var1.read = false
		var1.sent = dateTime.now()
		var1.previousMessageId = nil
		var1.filteredForReceivers = false
		
		if p1 ~= nil then
			for i, v in pairs(p1) do
				var1[i] = v
			end
		end
		return var1
	end
}
setmetatable(t, { __index = messageModelModule })

return t