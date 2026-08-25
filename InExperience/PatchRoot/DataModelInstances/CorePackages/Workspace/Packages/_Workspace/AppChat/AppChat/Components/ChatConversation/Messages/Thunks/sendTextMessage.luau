local appChat = script:FindFirstAncestor("AppChat")
local sendTextMessageModule = require(appChat.Conversations.Thunks.SendTextMessage)
local name = require(appChat.Logger):new(script.Name)

return function(...)
	-- upvalues: name (ref), sendTextMessageModule (ref)
	name:info("Sending text message")
	
	return sendTextMessageModule(...)
end