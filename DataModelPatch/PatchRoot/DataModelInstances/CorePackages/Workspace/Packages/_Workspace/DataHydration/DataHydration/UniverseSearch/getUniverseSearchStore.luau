local CreateUniverseSearchStoreModule = require(script.Parent.createUniverseSearchStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateUniverseSearchStoreModule (copy)
	return CreateUniverseSearchStoreModule()
end)