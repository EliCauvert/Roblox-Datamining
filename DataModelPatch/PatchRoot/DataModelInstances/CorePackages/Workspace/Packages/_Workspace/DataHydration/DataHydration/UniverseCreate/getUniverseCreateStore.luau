local CreateUniverseCreateStoreModule = require(script.Parent.createUniverseCreateStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateUniverseCreateStoreModule (copy)
	return CreateUniverseCreateStoreModule()
end)