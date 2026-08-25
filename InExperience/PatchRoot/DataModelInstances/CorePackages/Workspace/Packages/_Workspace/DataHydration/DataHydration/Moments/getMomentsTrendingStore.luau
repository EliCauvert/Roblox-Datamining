local createMomentsTrendingStoreModule = require(script.Parent.createMomentsTrendingStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsTrendingStoreModule (ref)
	return createMomentsTrendingStoreModule()
end)