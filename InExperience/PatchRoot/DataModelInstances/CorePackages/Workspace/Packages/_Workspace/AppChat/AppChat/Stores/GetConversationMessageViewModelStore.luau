local AppChat = script:FindFirstAncestor("AppChat")
local GetConversationMessageStoreModule = require(AppChat.Stores.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(AppChat.Stores.GetConversationMessageListStore)
local CreateConversationMessageViewModelStoreModule = require(script.createConversationMessageViewModelStore)

return require(AppChat.Parent.Signals).createComputed(function() --[[ Line: 12 ]]
	-- upvalues: GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), CreateConversationMessageViewModelStoreModule (copy)
	return CreateConversationMessageViewModelStoreModule(GetConversationMessageStoreModule(false), (GetConversationMessageListStoreModule(false)))
end)