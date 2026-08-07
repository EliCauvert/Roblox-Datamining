local createMomentsReactionsStoreModule = require(script.Parent.createMomentsReactionsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ line: 9 ]]
	-- upvalues: createMomentsReactionsStoreModule (ref)
	return createMomentsReactionsStoreModule()
end)