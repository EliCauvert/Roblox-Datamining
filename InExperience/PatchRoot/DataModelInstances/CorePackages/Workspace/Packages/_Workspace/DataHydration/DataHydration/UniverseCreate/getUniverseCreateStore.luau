local createUniverseCreateStoreModule = require(script.Parent.createUniverseCreateStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createUniverseCreateStoreModule (ref)
	return createUniverseCreateStoreModule()
end)