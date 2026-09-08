local createCommentSessionFiltersStoreModule = require(script.createCommentSessionFiltersStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: createCommentSessionFiltersStoreModule (ref)
	return createCommentSessionFiltersStoreModule()
end)