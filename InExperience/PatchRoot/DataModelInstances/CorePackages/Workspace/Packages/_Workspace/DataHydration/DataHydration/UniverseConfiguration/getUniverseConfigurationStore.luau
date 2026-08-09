local createUniverseConfigurationStoreModule = require(script.Parent.createUniverseConfigurationStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createUniverseConfigurationStoreModule (ref)
	return createUniverseConfigurationStoreModule()
end)