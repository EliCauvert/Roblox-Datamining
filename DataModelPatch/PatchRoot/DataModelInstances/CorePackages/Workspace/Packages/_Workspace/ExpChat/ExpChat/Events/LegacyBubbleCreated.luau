local EventModule = require(script.Parent.event)
local ExpChat = script:FindFirstAncestor("ExpChat")
local LegacyBubbleCreatedModule = require(ExpChat.Actions.LegacyBubbleCreated)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)

return if require(ExpChat.Parent.SharedFlags).FFlagExpChatUseMessagesStore then function(p1)
	-- upvalues: GetMessagesStoreModule (copy)
	GetMessagesStoreModule(false).handleLegacyBubbleCreated(p1)
end else EventModule(LegacyBubbleCreatedModule)