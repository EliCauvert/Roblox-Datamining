local GetCommentSessionFiltersStoreModule = require(script.Parent.GetCommentSessionFiltersStore)
local CreateCommentCollectionStoreModule = require(script.createCommentCollectionStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateCommentCollectionStoreModule (copy), GetCommentSessionFiltersStoreModule (copy)
	return CreateCommentCollectionStoreModule({
		sessionFilters = GetCommentSessionFiltersStoreModule(false)
	})
end)