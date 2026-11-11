local CreateUniverseConfigurationStoreModule = require(script.Parent.createUniverseConfigurationStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateUniverseConfigurationStoreModule (copy)
	return CreateUniverseConfigurationStoreModule()
end)