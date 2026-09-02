local createCommentCollectionStoreModule = require(script.createCommentCollectionStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: createCommentCollectionStoreModule (ref)
	return createCommentCollectionStoreModule()
end)