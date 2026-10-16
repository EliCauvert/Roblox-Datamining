local CreateUniverseConfigurationStoreModule = require(script.Parent.createUniverseConfigurationStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateUniverseConfigurationStoreModule (copy)
	return CreateUniverseConfigurationStoreModule()
end)