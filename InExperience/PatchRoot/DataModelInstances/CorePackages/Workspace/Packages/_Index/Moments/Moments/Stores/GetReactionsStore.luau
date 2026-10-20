local CreateReactionsStoreModule = require(script.createReactionsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: CreateReactionsStoreModule (copy)
	return CreateReactionsStoreModule()
end)