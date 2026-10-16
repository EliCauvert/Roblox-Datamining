local CreateUniverseSearchStoreModule = require(script.Parent.createUniverseSearchStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateUniverseSearchStoreModule (copy)
	return CreateUniverseSearchStoreModule()
end)