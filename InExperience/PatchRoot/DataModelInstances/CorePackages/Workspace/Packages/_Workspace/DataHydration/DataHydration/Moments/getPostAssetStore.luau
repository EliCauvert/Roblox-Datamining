local CreatePostAssetStoreModule = require(script.Parent.createPostAssetStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ Line: 8 ]]
	-- upvalues: CreatePostAssetStoreModule (copy)
	return CreatePostAssetStoreModule()
end)