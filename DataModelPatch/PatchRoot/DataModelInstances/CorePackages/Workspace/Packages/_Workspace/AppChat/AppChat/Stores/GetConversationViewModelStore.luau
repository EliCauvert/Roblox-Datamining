local AppChat = script:FindFirstAncestor("AppChat")
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationMessageStoreModule = require(AppChat.Stores.GetConversationMessageStore)
local CreateConversationViewModelStoreModule = require(script.createConversationViewModelStore)

return require(AppChat.Parent.Signals).createComputed(function()
	-- upvalues: GetConversationStoreModule (copy), GetConversationMessageStoreModule (copy), CreateConversationViewModelStoreModule (copy)
	return CreateConversationViewModelStoreModule(GetConversationStoreModule(false), (GetConversationMessageStoreModule(false)))
end)