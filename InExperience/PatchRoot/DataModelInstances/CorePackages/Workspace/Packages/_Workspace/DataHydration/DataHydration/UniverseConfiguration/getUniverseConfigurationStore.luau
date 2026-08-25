local createUniverseConfigurationStoreModule = require(script.Parent.createUniverseConfigurationStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createUniverseConfigurationStoreModule (ref)
	return createUniverseConfigurationStoreModule()
end)