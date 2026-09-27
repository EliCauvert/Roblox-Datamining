local getMessagesStoreModule = require(script:FindFirstAncestor("ExpChat").Stores.GetMessagesStore)

return function(p1, p2)
	-- upvalues: getMessagesStoreModule (ref)
	getMessagesStoreModule(false).handleLegacyBubbleTextUpdated(p1, p2)
end