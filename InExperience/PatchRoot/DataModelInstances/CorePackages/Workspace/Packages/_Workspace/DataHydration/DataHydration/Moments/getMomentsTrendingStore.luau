local createMomentsTrendingStoreModule = require(script.Parent.createMomentsTrendingStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ line: 8 ]]
	-- upvalues: createMomentsTrendingStoreModule (ref)
	return createMomentsTrendingStoreModule()
end)