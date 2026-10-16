local CreateMomentsReactionsStoreModule = require(script.Parent.createMomentsReactionsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ Line: 9 ]]
	-- upvalues: CreateMomentsReactionsStoreModule (copy)
	return CreateMomentsReactionsStoreModule()
end)