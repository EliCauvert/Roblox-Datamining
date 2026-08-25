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

return function(p0, p1)
	-- upvalues: momentsGetMomentsUserStoreModule (ref), recommendationSource (ref), fFlagProfileMomentsOrderingAndReactions (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), shouldShowMomentInFeedModule (ref), reportUnavailableFeedItemModule (ref)
	p1 = p1 or {}
	local var10 = if p1.userStore ~= nil then momentsGetMomentsUserStoreModule(false) else p1.userStore
	local initialIndex = p1.initialIndex
	
	return {
		id = `profile:{p0}`,
		recommendationSource = recommendationSource.Profile,
		fetchAsync = function(p2)
			-- upvalues: var10 (ref), p0 (ref), fFlagProfileMomentsOrderingAndReactions (copy), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), fFlagMomentsRemoveDeletedFromProfile (copy), getDeletedMomentsStoreModule (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), shouldShowMomentInFeedModule (copy), reportUnavailableFeedItemModule (copy), initialIndex (ref)
			local t = {}
			local var12 = p2
			local var13 = p2 == nil
			local var17
			-- [0.000s] <RUNTIME-ERROR> : Error block 3 analysis at pc 0 (42)
		end
	}
end