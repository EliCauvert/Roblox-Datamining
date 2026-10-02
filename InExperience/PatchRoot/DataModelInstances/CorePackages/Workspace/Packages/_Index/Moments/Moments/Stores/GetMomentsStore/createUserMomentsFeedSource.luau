local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(moments.Components.Feed)
local analytics = momentsCommonModule.Analytics
local recommendationSource = momentsCommonModule.Analytics.RecommendationSource
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local createPendingFeedGetterModule = require(script.Parent.createPendingFeedGetter)
local shouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local reportUnavailableFeedItemModule = require(script.Parent.reportUnavailableFeedItem)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local getDeletedMomentsStoreModule = require(moments.Stores.GetDeletedMomentsStore)
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagProfileMomentsOrderingAndReactions = sharedFlagsModule.FFlagProfileMomentsOrderingAndReactions
local fFlagMomentsRemoveDeletedFromProfile = sharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local var1 = if fFlagMomentsComments then require(parent.DataHydration.MomentsGetMomentsCommentsStore) else nil

return function(p1, p2)
	-- upvalues: momentsGetMomentsUserStoreModule (ref), fFlagMomentsComments (ref), var1 (ref), fFlagMomentsOptimisticProfilePending (ref), createPendingFeedGetterModule (ref), recommendationSource (ref), fFlagProfileMomentsOrderingAndReactions (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), shouldShowMomentInFeedModule (ref), reportUnavailableFeedItemModule (ref)
	p2 = p2 or {}
	local var2 = if p2.userStore ~= nil then momentsGetMomentsUserStoreModule(false) else p2.userStore
	local var3 = nil
	
	if fFlagMomentsComments then
		var3 = p2.commentsStore
		
		if var3 == nil and var1 ~= nil then
			var3 = var1(false)
		end
	end
	local initialIndex = p2.initialIndex
	
	return {
		id = `profile:{p1}`,
		initialMomentId = if fFlagMomentsOptimisticProfilePending then p2.initialMomentId else nil,
		getPendingItems = if fFlagMomentsOptimisticProfilePending then createPendingFeedGetterModule(p1, var2) else nil,
		recommendationSource = recommendationSource.Profile,
		fetchAsync = function(p3)
			-- upvalues: var3 (write), var2 (ref), p1 (ref), fFlagProfileMomentsOrderingAndReactions (copy), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), fFlagMomentsRemoveDeletedFromProfile (copy), fFlagMomentsOptimisticProfilePending (copy), getDeletedMomentsStoreModule (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), shouldShowMomentInFeedModule (copy), reportUnavailableFeedItemModule (copy), initialIndex (ref), fFlagMomentsComments (copy)
			local var4 = if var3 ~= nil then nil else var3.getOwnerGeneration(false)
			local var5 = nil
			local t = {}
			local var6 = p3
			local var7 = p3 == nil
			local var8
			-- [0.000s] <RUNTIME-ERROR> : Error block 7 analysis at pc 0 (54)
		end
	}
end