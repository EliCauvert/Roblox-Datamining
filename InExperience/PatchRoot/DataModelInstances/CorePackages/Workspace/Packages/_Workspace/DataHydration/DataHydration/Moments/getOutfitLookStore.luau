local createOutfitLookStoreModule = require(script.Parent.createOutfitLookStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createOutfitLookStoreModule (ref)
	return createOutfitLookStoreModule()
end)