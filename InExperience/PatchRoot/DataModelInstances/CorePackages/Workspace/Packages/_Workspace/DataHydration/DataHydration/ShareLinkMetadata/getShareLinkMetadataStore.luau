local CreateShareLinkMetadataStoreModule = require(script.Parent.createShareLinkMetadataStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateShareLinkMetadataStoreModule (copy)
	return CreateShareLinkMetadataStoreModule()
end)