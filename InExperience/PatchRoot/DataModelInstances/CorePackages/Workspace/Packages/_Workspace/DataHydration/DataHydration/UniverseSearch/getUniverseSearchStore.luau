local createUniverseSearchStoreModule = require(script.Parent.createUniverseSearchStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createUniverseSearchStoreModule (ref)
	return createUniverseSearchStoreModule()
end)