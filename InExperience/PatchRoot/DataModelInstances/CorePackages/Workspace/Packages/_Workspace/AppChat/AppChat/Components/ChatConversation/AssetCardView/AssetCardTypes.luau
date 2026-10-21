local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.React)
local _ = require(Parent.Foundation).Enums.ButtonVariant
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)

return table.freeze({
	Status = table.freeze({ Loading = "Loading", Ready = "Ready", Error = "Error" })
})