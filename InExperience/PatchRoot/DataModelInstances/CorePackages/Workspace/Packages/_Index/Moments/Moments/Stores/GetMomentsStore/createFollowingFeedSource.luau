local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Moments.Components.Feed)
local Analytics = MomentsCommonModule.Analytics
local RecommendationSource = MomentsCommonModule.Analytics.RecommendationSource
local MomentsGetMomentsFollowingStoreModule = require(Parent.DataHydration.MomentsGetMomentsFollowingStore)
local MomentsGetPostAssetStoreModule = require(Parent.DataHydration.MomentsGetPostAssetStore)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local HydrateAvatarMomentFeedItemsModule = require(script.Parent.hydrateAvatarMomentFeedItems)
local ShouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local ReportUnavailableFeedItemModule = require(script.Parent.reportUnavailableFeedItem)
local GetReactionsStoreModule = require(Moments.Stores.GetReactionsStore)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsRenderAvatarPostsInFeed = SharedFlagsModule.FFlagMomentsRenderAvatarPostsInFeed
local MomentsGetMomentsCommentsStoreModule = if FFlagMomentsComments then require(Parent.DataHydration.MomentsGetMomentsCommentsStore) else nil

return function(p1)
	-- upvalues: MomentsGetMomentsFollowingStoreModule (copy), FFlagMomentsComments (copy), MomentsGetMomentsCommentsStoreModule (copy), RecommendationSource (copy), GetReactionsStoreModule (copy), GetShareCountsStoreModule (copy), Analytics (copy), ShouldShowMomentInFeedModule (copy), ReportUnavailableFeedItemModule (copy), FFlagMomentsRenderAvatarPostsInFeed (copy), HydrateAvatarMomentFeedItemsModule (copy), MomentsGetPostAssetStoreModule (copy)
	local P0 = p1 or {}
	local MomentsGetMomentsFollowingStoreModuleResult = if P0.followingStore == nil then MomentsGetMomentsFollowingStoreModule(false) else P0.followingStore
	local CommentsStore = nil
	
	if FFlagMomentsComments then
		CommentsStore = P0.commentsStore
		
		if CommentsStore == nil and MomentsGetMomentsCommentsStoreModule ~= nil then
			CommentsStore = MomentsGetMomentsCommentsStoreModule(false)
		end
	end
	return {
		id = "following",
		endsWithCaughtUp = true,
		recommendationSource = RecommendationSource.Following,
		fetchAsync = function(p2)
			-- upvalues: CommentsStore (ref), MomentsGetMomentsFollowingStoreModuleResult (copy), GetReactionsStoreModule (upval), GetShareCountsStoreModule (upval), Analytics (upval), RecommendationSource (upval), ShouldShowMomentInFeedModule (upval), ReportUnavailableFeedItemModule (upval), FFlagMomentsRenderAvatarPostsInFeed (upval), HydrateAvatarMomentFeedItemsModule (upval), P0 (copy), MomentsGetPostAssetStoreModule (upval), FFlagMomentsComments (upval)
			local OwnerGeneration = if CommentsStore == nil then nil else CommentsStore.getOwnerGeneration(false)
			local v1, v2 = MomentsGetMomentsFollowingStoreModuleResult.getFollowing(p2):await()
			
			if not v1 then
				error(v2)
			end
			GetReactionsStoreModule(false).setBatchReactionCounts(v2.reactionsByMomentId or {})
			GetShareCountsStoreModule(false).setBatchShareCounts(v2.shareInfoByMomentId or {})
			local Items = {}
			
			for _, moment in v2.moments do
				Analytics.reportMomentsFeedItemsReceived(RecommendationSource.Following)
				
				if ShouldShowMomentInFeedModule(moment) then
					table.insert(Items, { kind = "moment", moment = moment })
				else
					ReportUnavailableFeedItemModule(moment, RecommendationSource.Following)
				end
			end
			if FFlagMomentsRenderAvatarPostsInFeed then
				Items = HydrateAvatarMomentFeedItemsModule(Items, P0.postAssetStore or MomentsGetPostAssetStoreModule(false))
			end
			local OnAccepted: (() -> ())? = nil
			local CommentsByFeedItemId = v2.commentsByFeedItemId
			
			if FFlagMomentsComments and CommentsStore ~= nil and OwnerGeneration ~= nil and CommentsByFeedItemId ~= nil then
				local CommentsStore1 = CommentsStore
				
				OnAccepted = function()
					-- upvalues: CommentsStore1 (copy), CommentsByFeedItemId (copy), OwnerGeneration (copy)
					CommentsStore1.upsertMomentComments(CommentsByFeedItemId, OwnerGeneration)
				end
			end
			return {
				items = Items,
				nextCursor = v2.nextCursor,
				onAccepted = OnAccepted
			}
		end
	}
end