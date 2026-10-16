local AppChat = script:FindFirstAncestor("AppChat")
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationViewModelStoreModule = require(AppChat.Stores.GetConversationViewModelStore)
local CreateConversationListStoreModule = require(script.createConversationListStore)

return require(AppChat.Parent.Signals).createComputed(function() --[[ Line: 14 ]]
	-- upvalues: CreateConversationListStoreModule (copy), GetConversationStoreModule (copy), GetConversationViewModelStoreModule (copy)
	return CreateConversationListStoreModule(GetConversationStoreModule(false), GetConversationViewModelStoreModule(false))
end)