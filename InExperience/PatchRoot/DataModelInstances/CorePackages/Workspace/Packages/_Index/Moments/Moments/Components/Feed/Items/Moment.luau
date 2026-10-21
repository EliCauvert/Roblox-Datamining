local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local _ = require(Moments.Components.Feed.FeedTypes)
local MomentItemModule = require(script.MomentItem)
local MomentItemSkeletonModule = require(script.MomentItemSkeleton)
local _ = require(script.createMomentStore)
local MomentsTypesModule = require(Parent.MomentsTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMomentsServeEDPVideos = SharedFlagsModule.FFlagMomentsServeEDPVideos
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetFFlagMomentsRenderPostAssetsModule = require(Parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local FFlagMomentsAvatarLookTryOn = SharedFlagsModule.FFlagMomentsAvatarLookTryOn
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local ToMediaItemModule = require(Moments.Components.Feed.Media.toMediaItem)
local CommentsModule = require(Moments.Components.Comments)
local MomentMediaView = require(Parent.MomentsCommon).Media.MomentMediaView

local function momentAttribution(Moment)
	-- upvalues: MakeRecommendationAttributionModule (copy)
	return if Moment == nil then nil else MakeRecommendationAttributionModule(Moment.recommendationMetadata)
end

local function createMediaSurface(Moment)
	-- upvalues: ToMediaItemModule (copy), ReactModule (copy), MomentMediaView (copy), GetMomentsPreferencesStoreModule (copy)
	local MediaItemModule = ToMediaItemModule({ kind = "moment", moment = Moment })
	
	return if MediaItemModule == nil then nil else ReactModule.createElement(MomentMediaView, {
		suppressTapToToggle = true,
		momentId = MediaItemModule.momentId,
		posterContent = MediaItemModule.posterContent,
		showLoadingSkeleton = MediaItemModule.captureType == Enum.CaptureType.Video,
		getScaleType = GetMomentsPreferencesStoreModule(false).getMediaScaleType
	})
end

return {
	{
		kind = "moment",
		getKey = function(p1)
			local Moment = p1.moment
			local RecommendationMetadata = Moment.recommendationMetadata
			
			return if RecommendationMetadata and RecommendationMetadata.feedItemId and RecommendationMetadata.feedItemId ~= "" then RecommendationMetadata.feedItemId else Moment.momentId
		end,
		getAttribution = function(p1)
			-- upvalues: momentAttribution (copy)
			return momentAttribution(p1.moment)
		end,
		render = function(p1, _)
			-- upvalues: GetFFlagMomentsRenderPostAssetsModule (copy), ToMediaItemModule (copy), ReactModule (copy), MomentMediaView (copy), GetMomentsPreferencesStoreModule (copy), FFlagMomentsAvatarLookTryOn (copy), FFlagMomentsOptimisticProfilePending (copy), MomentsTypesModule (copy), SharedFlagsModule (copy), CommentsModule (copy), MomentItemModule (copy), createMediaSurface (copy), FFlagMomentsServeEDPVideos (copy), MomentItemSkeletonModule (copy)
			local Moment = p1.moment
			
			if Moment == nil then
				return nil
			end
			local Element = nil
			
			if not GetFFlagMomentsRenderPostAssetsModule() then
				local MediaItemModule = ToMediaItemModule(p1)
				
				if MediaItemModule ~= nil then
					Element = ReactModule.createElement(MomentMediaView, {
						suppressTapToToggle = true,
						momentId = MediaItemModule.momentId,
						posterContent = MediaItemModule.posterContent,
						showLoadingSkeleton = MediaItemModule.captureType == Enum.CaptureType.Video,
						getScaleType = GetMomentsPreferencesStoreModule(false).getMediaScaleType
					})
				end
			end
			local RecommendationMetadata = Moment.recommendationMetadata
			local Element1 = ReactModule.createElement(MomentItemModule, {
				data = {
					kind = "experience",
					momentId = Moment.momentId,
					creatorId = Moment.creatorId,
					placeId = Moment.metadata.placeId or 0,
					universeId = Moment.metadata.universeId or 0,
					outfitId = if FFlagMomentsAvatarLookTryOn then Moment.metadata.outfitId else nil,
					isSponsored = Moment.metadata.partnerUploadType == "influencer",
					description = Moment.metadata.description,
					isModerated = Moment.isModerated == true,
					isPending = FFlagMomentsOptimisticProfilePending and Moment.status == MomentsTypesModule.Enums.MomentStatus.Pending,
					commentCount = if SharedFlagsModule.FFlagMomentsComments then CommentsModule.getSeededCommentCount(Moment.comments) else nil,
					feedItemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId,
					feedSessionId = if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId
				},
				mediaSurface = Element,
				renderMediaSurface = if GetFFlagMomentsRenderPostAssetsModule() then createMediaSurface else nil,
				moment = Moment
			})
			
			return if FFlagMomentsServeEDPVideos and Moment.entityType == "edpVideo" then ReactModule.createElement(require(script.EdpVideoEligibility.EdpVideoEligibilityContainer), {
				momentId = Moment.momentId,
				universeId = Moment.metadata.universeId,
				content = Element1,
				loadingContent = ReactModule.createElement(MomentItemSkeletonModule)
			}) else Element1
		end
	},
	{
		kind = "skeleton",
		getKey = function(_): string
			return "__feed_skeleton__"
		end,
		getAttribution = function(_)
			return nil
		end,
		render = function(_, _)
			-- upvalues: ReactModule (copy), MomentItemSkeletonModule (copy)
			return ReactModule.createElement(MomentItemSkeletonModule)
		end
	}
}