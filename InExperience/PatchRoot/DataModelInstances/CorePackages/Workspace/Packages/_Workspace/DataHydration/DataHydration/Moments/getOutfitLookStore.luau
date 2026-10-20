local CreateOutfitLookStoreModule = require(script.Parent.createOutfitLookStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateOutfitLookStoreModule (copy)
	return CreateOutfitLookStoreModule()
end)