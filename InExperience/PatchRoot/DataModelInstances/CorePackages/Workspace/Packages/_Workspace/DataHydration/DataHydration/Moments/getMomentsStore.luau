local createMomentsStoreModule = require(script.Parent.createMomentsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsStoreModule (ref)
	return createMomentsStoreModule()
end)