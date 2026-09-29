local createPostAssetStoreModule = require(script.Parent.createPostAssetStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createPostAssetStoreModule (ref)
	return createPostAssetStoreModule()
end)