local createReactionsStoreModule = require(script.createReactionsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: createReactionsStoreModule (ref)
	return createReactionsStoreModule()
end)