local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Moments.Components.Feed)
local Analytics = MomentsCommonModule.Analytics
local RecommendationSource = MomentsCommonModule.Analytics.RecommendationSource
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local CreatePendingFeedGetterModule = require(script.Parent.createPendingFeedGetter)
local ShouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local ReportUnavailableFeedItemModule = require(script.Parent.reportUnavailableFeedItem)
local GetReactionsStoreModule = require(Moments.Stores.GetReactionsStore)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local GetDeletedMomentsStoreModule = require(Moments.Stores.GetDeletedMomentsStore)
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsRemoveDeletedFromProfile = SharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local MomentsGetMomentsCommentsStoreModule = if FFlagMomentsComments then require(Parent.DataHydration.MomentsGetMomentsCommentsStore) else nil

return function(p1, p2)
	-- upvalues: MomentsGetMomentsUserStoreModule (copy), FFlagMomentsComments (copy), MomentsGetMomentsCommentsStoreModule (copy), FFlagMomentsOptimisticProfilePending (copy), CreatePendingFeedGetterModule (copy), RecommendationSource (copy), GetReactionsStoreModule (copy), GetShareCountsStoreModule (copy), FFlagMomentsRemoveDeletedFromProfile (copy), GetDeletedMomentsStoreModule (copy), Analytics (copy), ShouldShowMomentInFeedModule (copy), ReportUnavailableFeedItemModule (copy)
	local P1 = p2 or {}
	local MomentsGetMomentsUserStoreModuleResult = if P1.userStore == nil then MomentsGetMomentsUserStoreModule(false) else P1.userStore
	local CommentsStore = nil
	
	if FFlagMomentsComments then
		CommentsStore = P1.commentsStore
		
		if CommentsStore == nil and MomentsGetMomentsCommentsStoreModule ~= nil then
			CommentsStore = MomentsGetMomentsCommentsStoreModule(false)
		end
	end
	local InitialIndex = P1.initialIndex
	
	return {
		id = `profile:{p1}`,
		initialMomentId = if FFlagMomentsOptimisticProfilePending then P1.initialMomentId else nil,
		getPendingItems = if FFlagMomentsOptimisticProfilePending then CreatePendingFeedGetterModule(p1, MomentsGetMomentsUserStoreModuleResult) else nil,
		recommendationSource = RecommendationSource.Profile,
		fetchAsync = function(NextCursor)
			-- upvalues: CommentsStore (ref), MomentsGetMomentsUserStoreModuleResult (copy), p1 (copy), GetReactionsStoreModule (upval), GetShareCountsStoreModule (upval), FFlagMomentsRemoveDeletedFromProfile (upval), FFlagMomentsOptimisticProfilePending (upval), GetDeletedMomentsStoreModule (upval), Analytics (upval), RecommendationSource (upval), ShouldShowMomentInFeedModule (upval), ReportUnavailableFeedItemModule (upval), InitialIndex (copy), FFlagMomentsComments (upval)
			local OwnerGeneration = if CommentsStore == nil then nil else CommentsStore.getOwnerGeneration(false)
			local v1 = nil
			local Items = {}
			local NextCursor1 = NextCursor
			local NoNextCursor = NextCursor == nil
			repeat
				local v2, v3 = MomentsGetMomentsUserStoreModuleResult.getUserMoments(p1, NextCursor1):await()
				if not v2 then
					error(v3)
				end
				if v3.commentsByFeedItemId ~= nil then
					v1 = v1 or {}
					
					for i, value in v3.commentsByFeedItemId do
						v1[i] = value
					end
				end
				GetReactionsStoreModule(false).setBatchReactionCounts(v3.reactionsByMomentId or {})
				GetShareCountsStoreModule(false).setBatchShareCounts(v3.shareInfoByMomentId or {})
				local DeletedIds = if FFlagMomentsRemoveDeletedFromProfile or FFlagMomentsOptimisticProfilePending then GetDeletedMomentsStoreModule(false).getDeletedIds(false) else nil
				for _, moment in v3.moments do
					Analytics.reportMomentsFeedItemsReceived(RecommendationSource.Profile)
					local HasFoundIndex: boolean = DeletedIds ~= nil and table.find(DeletedIds, moment.momentId) ~= nil
					local ShouldShowMomentInFeedModule1 = ShouldShowMomentInFeedModule(moment)
					
					if not HasFoundIndex and ShouldShowMomentInFeedModule1 then
						table.insert(Items, { kind = "moment", moment = moment })
						continue
					end
					if HasFoundIndex then
						Analytics.reportMomentsFeedItemFiltered("deleted", RecommendationSource.Profile)
					else
						ReportUnavailableFeedItemModule(moment, RecommendationSource.Profile)
					end
				end
				NextCursor1 = v3.nextCursor
			until not NoNextCursor or (InitialIndex == nil or (#Items >= InitialIndex or NextCursor1 == nil))
			local OnAccepted: (() -> ())? = nil
			
			if FFlagMomentsComments and CommentsStore ~= nil and OwnerGeneration ~= nil and v1 ~= nil then
				local CommentsStore1 = CommentsStore
				
				OnAccepted = function()
					-- upvalues: CommentsStore1 (copy), v1 (copy), OwnerGeneration (copy)
					CommentsStore1.upsertMomentComments(v1, OwnerGeneration)
				end
			end
			return {
				items = Items,
				nextCursor = NextCursor1,
				onAccepted = OnAccepted
			}
		end
	}
end