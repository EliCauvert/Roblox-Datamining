local CreateOutfitLookStoreModule = require(script.Parent.createOutfitLookStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ Line: 10 ]]
	-- upvalues: CreateOutfitLookStoreModule (copy)
	return CreateOutfitLookStoreModule()
end)