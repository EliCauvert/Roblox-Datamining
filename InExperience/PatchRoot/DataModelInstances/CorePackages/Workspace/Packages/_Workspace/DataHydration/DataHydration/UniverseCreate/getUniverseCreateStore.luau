local CreateUniverseCreateStoreModule = require(script.Parent.createUniverseCreateStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateUniverseCreateStoreModule (copy)
	return CreateUniverseCreateStoreModule()
end)