local CreateMomentsReactionsStoreModule = require(script.Parent.createMomentsReactionsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsReactionsStoreModule (copy)
	return CreateMomentsReactionsStoreModule()
end)