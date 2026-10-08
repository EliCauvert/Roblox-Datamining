local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.Parent.React)
local _ = require(appChat.Components.ChatConversation.Grouping.MessageGroupShape)

return table.freeze({
	Status = table.freeze({ Loading = "Loading", Ready = "Ready", Error = "Error" })
})