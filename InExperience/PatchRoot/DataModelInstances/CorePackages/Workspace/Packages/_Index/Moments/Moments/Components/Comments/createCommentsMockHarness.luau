local Parent = script:FindFirstAncestor("Moments").Parent
local MomentsCommentsModule = require(Parent.DataHydration.MomentsComments)
local MomentsCreateCommentsMockNetworkModule = require(Parent.DataHydration.MomentsCreateCommentsMockNetwork)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local CreateCommentCollectionStoreModule = require(script.Parent.GetCommentCollectionStore.createCommentCollectionStore)
local CreateCommentSessionFiltersStoreModule = require(script.Parent.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)

return function(p1) --[[ Line: 35 | Named "createCommentsMockHarness" ]]
	-- upvalues: MomentsCreateCommentsMockNetworkModule (copy), MomentsCommentsModule (copy), CreateCommentSessionFiltersStoreModule (copy), CreateCommentCollectionStoreModule (copy)
	local MomentsCreateCommentsMockNetworkModuleResult = MomentsCreateCommentsMockNetworkModule({
		latencySeconds = if p1 == nil then nil else p1.latencySeconds,
		postOutcome = if p1 == nil then nil else p1.postOutcome
	})
	local MomentsCommentsStore = MomentsCommentsModule.createMomentsCommentsStore({ network = MomentsCreateCommentsMockNetworkModuleResult })
	local CommentSessionFiltersStoreModule = CreateCommentSessionFiltersStoreModule()
	local CommentCollectionStoreModule = CreateCommentCollectionStoreModule({ sessionFilters = CommentSessionFiltersStoreModule })
	CommentCollectionStoreModule.selectFeed("feed-1", MomentsCommentsStore.getOwnerGeneration(false))
	local Flag = false
	
	return {
		network = MomentsCreateCommentsMockNetworkModuleResult,
		commentsEntityStore = MomentsCommentsStore,
		collectionStore = CommentCollectionStoreModule,
		sessionFilters = CommentSessionFiltersStoreModule,
		dispose = function() --[[ Line: 50 ]]
			-- upvalues: Flag (ref), CommentCollectionStoreModule (copy), MomentsCommentsStore (copy)
			if not Flag then
				Flag = true
				CommentCollectionStoreModule.dispose()
				MomentsCommentsStore.dispose()
				
				return
			end
		end
	}
end