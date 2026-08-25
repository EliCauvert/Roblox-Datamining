local createMomentsReactionsStoreModule = require(script.Parent.createMomentsReactionsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsReactionsStoreModule (ref)
	return createMomentsReactionsStoreModule()
end)