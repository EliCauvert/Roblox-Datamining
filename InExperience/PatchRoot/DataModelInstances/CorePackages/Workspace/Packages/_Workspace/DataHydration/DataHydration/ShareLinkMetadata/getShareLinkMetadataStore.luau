local CreateShareLinkMetadataStoreModule = require(script.Parent.createShareLinkMetadataStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateShareLinkMetadataStoreModule (copy)
	return CreateShareLinkMetadataStoreModule()
end)