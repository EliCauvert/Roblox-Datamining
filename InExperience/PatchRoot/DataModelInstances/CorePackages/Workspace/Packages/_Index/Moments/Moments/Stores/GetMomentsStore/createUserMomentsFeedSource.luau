local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local _ = require(moments.Components.Feed)
local recommendationSource = momentsCommonModule.Analytics.RecommendationSource
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local shouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local fFlagProfileMomentsOrderingAndReactions = require(parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)

return function(p0, p1) --[[ line: 34 | named "createUserMomentsFeedSource" ]]
	-- upvalues: momentsGetMomentsUserStoreModule (ref), recommendationSource (ref), fFlagProfileMomentsOrderingAndReactions (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), shouldShowMomentInFeedModule (ref)
	p1 = p1 or {}
	local var8 = if p1.userStore ~= nil then momentsGetMomentsUserStoreModule(false) else p1.userStore
	local initialIndex = p1.initialIndex
	
	return {
		id = `profile:{p0}`,
		recommendationSource = recommendationSource.Profile,
		fetchAsync = function(p2) --[[ line: 43 ]]
			-- upvalues: var8 (ref), p0 (ref), fFlagProfileMomentsOrderingAndReactions (copy), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), shouldShowMomentInFeedModule (copy), initialIndex (ref)
			local t = {}
			local var10 = p2
			local var11 = p2 == nil
			local var14
			-- [0.000s] <RUNTIME-ERROR> : Error block 3 analysis at pc 0 (21)
		end
	}
end