local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)
local getCommentSessionFiltersStoreModule = require(script.Parent.GetCommentSessionFiltersStore)
local createCommentCollectionStoreModule = require(script.createCommentCollectionStore)

return signalsModule.createComputed(function(_)
	-- upvalues: createCommentCollectionStoreModule (ref), getCommentSessionFiltersStoreModule (ref)
	return createCommentCollectionStoreModule({
		sessionFilters = getCommentSessionFiltersStoreModule(false)
	})
end)