local CreateMomentsTrendingStoreModule = require(script.Parent.createMomentsTrendingStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsTrendingStoreModule (copy)
	return CreateMomentsTrendingStoreModule()
end)