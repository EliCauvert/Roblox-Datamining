local createUniverseCreateStoreModule = require(script.Parent.createUniverseCreateStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createUniverseCreateStoreModule (ref)
	return createUniverseCreateStoreModule()
end)