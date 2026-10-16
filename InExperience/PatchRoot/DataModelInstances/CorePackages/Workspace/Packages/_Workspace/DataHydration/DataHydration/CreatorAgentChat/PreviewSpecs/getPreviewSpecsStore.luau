local CreatePreviewSpecsStoreModule = require(script.Parent.createPreviewSpecsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreatePreviewSpecsStoreModule (copy)
	return CreatePreviewSpecsStoreModule()
end)