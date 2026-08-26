local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local _ = require(moments.Components.Feed)
local analytics = momentsCommonModule.Analytics
local recommendationSource = momentsCommonModule.Analytics.RecommendationSource
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local shouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local reportUnavailableFeedItemModule = require(script.Parent.reportUnavailableFeedItem)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local getDeletedMomentsStoreModule = require(moments.Stores.GetDeletedMomentsStore)
local fFlagProfileMomentsOrderingAndReactions = require(parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions
local fFlagMomentsRemoveDeletedFromProfile = require(parent.SharedFlags).FFlagMomentsRemoveDeletedFromProfile
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)

return function(p1, p2)
	-- upvalues: momentsGetMomentsUserStoreModule (ref), recommendationSource (ref), fFlagProfileMomentsOrderingAndReactions (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), shouldShowMomentInFeedModule (ref), reportUnavailableFeedItemModule (ref)
	p2 = p2 or {}
	local var1 = if p2.userStore ~= nil then momentsGetMomentsUserStoreModule(false) else p2.userStore
	local initialIndex = p2.initialIndex
	
	return {
		id = `profile:{p1}`,
		recommendationSource = recommendationSource.Profile,
		fetchAsync = function(p3)
			-- upvalues: var1 (ref), p1 (ref), fFlagProfileMomentsOrderingAndReactions (copy), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), shouldShowMomentInFeedModule (copy), reportUnavailableFeedItemModule (copy), initialIndex (ref)
			local t = {}
			local var2 = p3
			local var3 = p3 == nil
			local var4
			-- [0.000s] <RUNTIME-ERROR> : Error block 3 analysis at pc 0 (42)
		end
	}
end