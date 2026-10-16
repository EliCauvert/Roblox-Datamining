local CreateCommentSessionFiltersStoreModule = require(script.createCommentSessionFiltersStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_) --[[ Line: 6 ]]
	-- upvalues: CreateCommentSessionFiltersStoreModule (copy)
	return CreateCommentSessionFiltersStoreModule()
end)