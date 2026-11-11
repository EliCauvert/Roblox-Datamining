local EventModule = require(script.Parent.event)
local ExpChat = script:FindFirstAncestor("ExpChat")
local LegacyBubbleTextUpdatedModule = require(ExpChat.Actions.LegacyBubbleTextUpdated)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)

return if require(ExpChat.Parent.SharedFlags).FFlagExpChatUseMessagesStore then function(p1, p2)
	-- upvalues: GetMessagesStoreModule (copy)
	GetMessagesStoreModule(false).handleLegacyBubbleTextUpdated(p1, p2)
end else EventModule(LegacyBubbleTextUpdatedModule)