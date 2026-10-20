local AppChat = script:FindFirstAncestor("AppChat")
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local CreateConversationListStoreModule = require(script.createConversationListStore)

return require(AppChat.Parent.Signals).createComputed(function()
	-- upvalues: CreateConversationListStoreModule (copy), GetConversationStoreModule (copy)
	return CreateConversationListStoreModule(GetConversationStoreModule(false))
end)