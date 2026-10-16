local CreateUniverseActivationStoreModule = require(script.Parent.createUniverseActivationStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateUniverseActivationStoreModule (copy)
	return CreateUniverseActivationStoreModule()
end)