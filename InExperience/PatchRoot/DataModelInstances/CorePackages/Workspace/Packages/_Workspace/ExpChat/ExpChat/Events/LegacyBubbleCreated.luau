local getMessagesStoreModule = require(script:FindFirstAncestor("ExpChat").Stores.GetMessagesStore)

return function(p1)
	-- upvalues: getMessagesStoreModule (ref)
	getMessagesStoreModule(false).handleLegacyBubbleCreated(p1)
end