local AppChat = script:FindFirstAncestor("AppChat")
local SendTextMessageModule = require(AppChat.Conversations.Thunks.SendTextMessage)
local NewResult = require(AppChat.Logger):new(script.Name)

return function(...)
	-- upvalues: NewResult (copy), SendTextMessageModule (copy)
	NewResult:info("Sending text message")
	
	return SendTextMessageModule(...)
end