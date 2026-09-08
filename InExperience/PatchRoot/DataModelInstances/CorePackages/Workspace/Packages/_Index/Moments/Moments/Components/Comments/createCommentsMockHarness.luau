local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommentsModule = require(parent.DataHydration.MomentsComments)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local createCommentCollectionStoreModule = require(script.Parent.GetCommentCollectionStore.createCommentCollectionStore)
local createCommentSessionFiltersStoreModule = require(script.Parent.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)

return function(p1)
	-- upvalues: momentsCommentsModule (ref), createCommentSessionFiltersStoreModule (ref), createCommentCollectionStoreModule (ref)
	local var1 = momentsCommentsModule.createCommentsMockNetwork(p1)
	local var2 = momentsCommentsModule.createMomentsCommentsStore({ network = var1 })
	local var3 = createCommentSessionFiltersStoreModule()
	
	return {
		network = var1,
		commentsEntityStore = var2,
		collectionStore = createCommentCollectionStoreModule({
			commentsStore = var2,
			sessionFilters = var3,
			network = var1
		}),
		sessionFilters = var3
	}
end