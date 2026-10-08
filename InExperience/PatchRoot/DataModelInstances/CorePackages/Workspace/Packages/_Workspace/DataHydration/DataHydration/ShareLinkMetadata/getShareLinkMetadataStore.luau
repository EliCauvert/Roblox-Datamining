local createShareLinkMetadataStoreModule = require(script.Parent.createShareLinkMetadataStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createShareLinkMetadataStoreModule (ref)
	return createShareLinkMetadataStoreModule()
end)