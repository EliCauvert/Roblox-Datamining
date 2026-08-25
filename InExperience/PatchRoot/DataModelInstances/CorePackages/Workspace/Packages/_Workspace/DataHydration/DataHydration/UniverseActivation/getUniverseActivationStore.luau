local createUniverseActivationStoreModule = require(script.Parent.createUniverseActivationStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createUniverseActivationStoreModule (ref)
	return createUniverseActivationStoreModule()
end)