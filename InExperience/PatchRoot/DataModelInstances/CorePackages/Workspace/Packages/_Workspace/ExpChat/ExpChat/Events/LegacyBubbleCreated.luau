local GetMessagesStoreModule = require(script:FindFirstAncestor("ExpChat").Stores.GetMessagesStore)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: GetMessagesStoreModule (copy)
	GetMessagesStoreModule(false).handleLegacyBubbleCreated(p1)
end