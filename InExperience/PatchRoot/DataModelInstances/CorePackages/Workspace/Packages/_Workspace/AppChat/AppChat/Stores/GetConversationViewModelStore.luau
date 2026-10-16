local AppChat = script:FindFirstAncestor("AppChat")
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationMessageStoreModule = require(AppChat.Stores.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(AppChat.Stores.GetConversationMessageListStore)
local CreateConversationViewModelStoreModule = require(script.createConversationViewModelStore)

return require(AppChat.Parent.Signals).createComputed(function() --[[ Line: 13 ]]
	-- upvalues: GetConversationStoreModule (copy), GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), CreateConversationViewModelStoreModule (copy)
	return CreateConversationViewModelStoreModule(GetConversationStoreModule(false), GetConversationMessageStoreModule(false), (GetConversationMessageListStoreModule(false)))
end)