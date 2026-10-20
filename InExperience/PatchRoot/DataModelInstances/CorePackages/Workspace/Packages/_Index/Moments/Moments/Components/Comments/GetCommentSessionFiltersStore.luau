local CreateCommentSessionFiltersStoreModule = require(script.createCommentSessionFiltersStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateCommentSessionFiltersStoreModule (copy)
	return CreateCommentSessionFiltersStoreModule()
end)