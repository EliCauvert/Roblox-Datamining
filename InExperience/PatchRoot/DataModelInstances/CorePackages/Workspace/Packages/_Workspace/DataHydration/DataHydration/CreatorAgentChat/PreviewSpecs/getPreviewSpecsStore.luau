local createPreviewSpecsStoreModule = require(script.Parent.createPreviewSpecsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createPreviewSpecsStoreModule (ref)
	return createPreviewSpecsStoreModule()
end)