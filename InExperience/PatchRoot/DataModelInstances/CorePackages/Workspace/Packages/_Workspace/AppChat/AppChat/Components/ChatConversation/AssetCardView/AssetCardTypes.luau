local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Parent.React)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)

return table.freeze({
	Status = table.freeze({ Loading = "Loading", Ready = "Ready", Error = "Error" })
})