local createUniverseSearchStoreModule = require(script.Parent.createUniverseSearchStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createUniverseSearchStoreModule (ref)
	return createUniverseSearchStoreModule()
end)