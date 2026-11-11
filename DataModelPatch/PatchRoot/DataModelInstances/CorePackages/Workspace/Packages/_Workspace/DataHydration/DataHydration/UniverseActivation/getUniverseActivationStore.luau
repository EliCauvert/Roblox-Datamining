local CreateUniverseActivationStoreModule = require(script.Parent.createUniverseActivationStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateUniverseActivationStoreModule (copy)
	return CreateUniverseActivationStoreModule()
end)