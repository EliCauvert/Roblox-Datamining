local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local _ = require(moments.Components.Feed.FeedTypes)
local momentItemModule = require(script.MomentItem)
local momentItemSkeletonModule = require(script.MomentItemSkeleton)
local _ = require(script.createMomentStore)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsTypesModule = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagMomentsRenderPostAssetsModule = require(parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local makeRecommendationAttributionModule = require(moments.Analytics.makeRecommendationAttribution)
local toMediaItemModule = require(moments.Components.Feed.Media.toMediaItem)
local commentsModule = require(moments.Components.Comments)
local momentMediaView = momentsCommonModule.Media.MomentMediaView

local function momentAttribution(p1)
	-- upvalues: makeRecommendationAttributionModule (ref)
	return if p1 == nil then nil else makeRecommendationAttributionModule(p1.recommendationMetadata)
end

local function createMediaSurface(p1)
	-- upvalues: toMediaItemModule (ref), reactModule (ref), momentMediaView (ref), getMomentsPreferencesStoreModule (ref)
	local var1 = toMediaItemModule({ kind = "moment", moment = p1 })
	
	return if var1 == nil then nil else reactModule.createElement(momentMediaView, {
		suppressTapToToggle = true,
		momentId = var1.momentId,
		posterContent = var1.posterContent,
		showLoadingSkeleton = var1.captureType == Enum.CaptureType.Video,
		getScaleType = getMomentsPreferencesStoreModule(false).getMediaScaleType
	})
end

return {
	{
		kind = "moment",
		getKey = function(p1)
			local moment = p1.moment
			local recommendationMetadata = moment.recommendationMetadata
			
			return if recommendationMetadata and recommendationMetadata.feedItemId and recommendationMetadata.feedItemId ~= "" then recommendationMetadata.feedItemId else moment.momentId
		end,
		getAttribution = function(p1)
			-- upvalues: momentAttribution (ref)
			return momentAttribution(p1.moment)
		end,
		render = function(p1, _)
			-- upvalues: getFFlagMomentsRenderPostAssetsModule (ref), toMediaItemModule (ref), reactModule (ref), momentMediaView (ref), getMomentsPreferencesStoreModule (ref), fFlagMomentsOptimisticProfilePending (ref), momentsTypesModule (ref), sharedFlagsModule (ref), commentsModule (ref), momentItemModule (ref), createMediaSurface (ref)
			local moment = p1.moment
			
			if moment == nil then
				return nil
			end
			local var1 = nil
			
			if not getFFlagMomentsRenderPostAssetsModule() then
				local var2 = toMediaItemModule(p1)
				
				if var2 ~= nil then
					var1 = reactModule.createElement(momentMediaView, {
						suppressTapToToggle = true,
						momentId = var2.momentId,
						posterContent = var2.posterContent,
						showLoadingSkeleton = var2.captureType == Enum.CaptureType.Video,
						getScaleType = getMomentsPreferencesStoreModule(false).getMediaScaleType
					})
				end
			end
			local recommendationMetadata = moment.recommendationMetadata
			
			return reactModule.createElement(momentItemModule, {
				data = {
					kind = "experience",
					creatorIsVerified = nil,
					momentId = moment.momentId,
					creatorId = moment.creatorId,
					placeId = moment.metadata.placeId or 0,
					universeId = moment.metadata.universeId or 0,
					isSponsored = moment.metadata.partnerUploadType == "influencer",
					description = moment.metadata.description,
					isModerated = moment.isModerated == true,
					isPending = fFlagMomentsOptimisticProfilePending and moment.status == momentsTypesModule.Enums.MomentStatus.Pending,
					commentCount = if sharedFlagsModule.FFlagMomentsComments then commentsModule.getSeededCommentCount(moment.comments) else nil,
					feedItemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId,
					feedSessionId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId
				},
				mediaSurface = var1,
				renderMediaSurface = if getFFlagMomentsRenderPostAssetsModule() then createMediaSurface else nil,
				moment = moment
			})
		end
	},
	{
		kind = "skeleton",
		getKey = function(_)
			return "__feed_skeleton__"
		end,
		getAttribution = function(_)
			return nil
		end,
		render = function(_, _)
			-- upvalues: reactModule (ref), momentItemSkeletonModule (ref)
			return reactModule.createElement(momentItemSkeletonModule)
		end
	}
}