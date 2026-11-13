local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local GetMessageReactionsStoreModule = require(AppChat.Stores.GetMessageReactionsStore)
local CreateMessageReactionsViewModelStoreModule = require(script.createMessageReactionsViewModelStore)

return SignalsModule.createComputed(function()
	-- upvalues: CreateMessageReactionsViewModelStoreModule (copy), GetMessageReactionsStoreModule (copy)
	return CreateMessageReactionsViewModelStoreModule(GetMessageReactionsStoreModule(false))
end)