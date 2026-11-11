local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsTypes)
local _ = require(Moments.Components.Feed)
local RecommendationSource = require(Parent.MomentsCommon).Analytics.RecommendationSource
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ShouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local GetReactionsStoreModule = require(Moments.Stores.GetReactionsStore)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local GetDeletedMomentsStoreModule = require(Moments.Stores.GetDeletedMomentsStore)
local FFlagProfileMomentsOrderingAndReactions = require(Parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions
local FFlagMomentsRemoveDeletedFromProfile = require(Parent.SharedFlags).FFlagMomentsRemoveDeletedFromProfile
local GetFFlagMomentsFilterUnavailableFeedItemsModule = require(Moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)

return function(p1, p2)
	-- upvalues: MomentsGetMomentsUserStoreModule (copy), RecommendationSource (copy), FFlagProfileMomentsOrderingAndReactions (copy), GetReactionsStoreModule (copy), GetShareCountsStoreModule (copy), FFlagMomentsRemoveDeletedFromProfile (copy), GetDeletedMomentsStoreModule (copy), GetFFlagMomentsFilterUnavailableFeedItemsModule (copy), ShouldShowMomentInFeedModule (copy)
	local P1 = p2 or {}
	local MomentsGetMomentsUserStoreModuleResult = if P1.userStore == nil then MomentsGetMomentsUserStoreModule(false) else P1.userStore
	local InitialIndex = P1.initialIndex
	
	return {
		id = `profile:{p1}`,
		recommendationSource = RecommendationSource.Profile,
		fetchAsync = function(NextCursor)
			-- upvalues: MomentsGetMomentsUserStoreModuleResult (copy), p1 (copy), FFlagProfileMomentsOrderingAndReactions (upval), GetReactionsStoreModule (upval), GetShareCountsStoreModule (upval), FFlagMomentsRemoveDeletedFromProfile (upval), GetDeletedMomentsStoreModule (upval), GetFFlagMomentsFilterUnavailableFeedItemsModule (upval), ShouldShowMomentInFeedModule (upval), InitialIndex (copy)
			local Items = {}
			local NextCursor1 = NextCursor
			local NoNextCursor = NextCursor == nil
			repeat
				local v1, v2 = MomentsGetMomentsUserStoreModuleResult.getUserMoments(p1, NextCursor1):await()
				if not v1 then
					error(v2)
				end
				if FFlagProfileMomentsOrderingAndReactions then
					GetReactionsStoreModule(false).setBatchReactionCounts(v2.reactionsByMomentId or {})
					GetShareCountsStoreModule(false).setBatchShareCounts(v2.shareInfoByMomentId or {})
				end
				local DeletedIds = if FFlagMomentsRemoveDeletedFromProfile then GetDeletedMomentsStoreModule(false).getDeletedIds(false) else nil
				for _, moment in v2.moments do
					if (DeletedIds == nil or table.find(DeletedIds, moment.momentId) == nil) and (not GetFFlagMomentsFilterUnavailableFeedItemsModule() or ShouldShowMomentInFeedModule(moment)) then
						table.insert(Items, { kind = "moment", moment = moment })
					end
				end
				NextCursor1 = v2.nextCursor
			until not NoNextCursor or (InitialIndex == nil or (#Items >= InitialIndex or NextCursor1 == nil))
			return { items = Items, nextCursor = NextCursor1 }
		end
	}
end