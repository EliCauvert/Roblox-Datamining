local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommentsModule = require(parent.DataHydration.MomentsComments)
local momentsCreateCommentsMockNetworkModule = require(parent.DataHydration.MomentsCreateCommentsMockNetwork)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local createCommentCollectionStoreModule = require(script.Parent.GetCommentCollectionStore.createCommentCollectionStore)
local createCommentSessionFiltersStoreModule = require(script.Parent.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)

return function(p1)
	-- upvalues: momentsCreateCommentsMockNetworkModule (ref), momentsCommentsModule (ref), createCommentSessionFiltersStoreModule (ref), createCommentCollectionStoreModule (ref)
	local var1 = momentsCreateCommentsMockNetworkModule({
		latencySeconds = if p1 ~= nil then nil else p1.latencySeconds,
		postOutcome = if p1 ~= nil then nil else p1.postOutcome
	})
	local var2 = momentsCommentsModule.createMomentsCommentsStore({ network = var1 })
	local var3 = createCommentSessionFiltersStoreModule()
	local var4 = createCommentCollectionStoreModule({ sessionFilters = var3 })
	var4.selectFeed("feed-1", var2.getOwnerGeneration(false))
	local var5 = false
	
	return {
		network = var1,
		commentsEntityStore = var2,
		collectionStore = var4,
		sessionFilters = var3,
		dispose = function()
			-- upvalues: var5 (write), var4 (ref), var2 (ref)
			if var5 then
				return
			end
			var5 = true
			var4.dispose()
			var2.dispose()
		end
	}
end