local GetMessagesStoreModule = require(script:FindFirstAncestor("ExpChat").Stores.GetMessagesStore)

return function(p1, p2)
	-- upvalues: GetMessagesStoreModule (copy)
	GetMessagesStoreModule(false).handleLegacyBubbleTextUpdated(p1, p2)
end