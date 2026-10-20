local CreatePreviewSpecsStoreModule = require(script.Parent.createPreviewSpecsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreatePreviewSpecsStoreModule (copy)
	return CreatePreviewSpecsStoreModule()
end)