local CreateMessageReactionsStoreModule = require(script.createMessageReactionsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMessageReactionsStoreModule (copy)
	return CreateMessageReactionsStoreModule()
end)