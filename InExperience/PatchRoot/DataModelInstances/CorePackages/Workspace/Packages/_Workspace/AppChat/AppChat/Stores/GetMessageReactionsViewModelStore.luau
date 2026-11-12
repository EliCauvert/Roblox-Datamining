local AppChat = script:FindFirstAncestor("AppChat")
local GetMessageReactionsStoreModule = require(AppChat.Stores.GetMessageReactionsStore)
local CreateMessageReactionsViewModelStoreModule = require(script.createMessageReactionsViewModelStore)

return require(AppChat.Parent.Signals).createComputed(function()
	-- upvalues: CreateMessageReactionsViewModelStoreModule (copy), GetMessageReactionsStoreModule (copy)
	return CreateMessageReactionsViewModelStoreModule(GetMessageReactionsStoreModule(false))
end)