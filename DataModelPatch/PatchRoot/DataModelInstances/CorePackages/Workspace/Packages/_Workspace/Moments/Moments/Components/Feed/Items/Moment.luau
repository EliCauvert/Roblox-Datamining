local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local _ = require(Moments.Components.Feed.FeedTypes)
local MomentItemModule = require(script.MomentItem)
local MomentItemSkeletonModule = require(script.MomentItemSkeleton)
local _ = require(script.createMomentStore)
local _ = require(Parent.MomentsTypes)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetFFlagMomentsPartnerContentLabelModule = require(Moments.Flags.GetFFlagMomentsPartnerContentLabel)
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local ToMediaItemModule = require(Moments.Components.Feed.Media.toMediaItem)
local MomentMediaView = require(Parent.MomentsCommon).Media.MomentMediaView

local function momentAttribution(Moment)
	-- upvalues: MakeRecommendationAttributionModule (copy)
	return if Moment == nil then nil else MakeRecommendationAttributionModule(Moment.recommendationMetadata)
end

return {
	{
		kind = "moment",
		getKey = function(p1)
			local Moment = p1.moment
			local RecommendationMetadata = Moment.recommendationMetadata
			
			return if RecommendationMetadata and RecommendationMetadata.itemId and RecommendationMetadata.itemId ~= "" then RecommendationMetadata.itemId else Moment.momentId
		end,
		getAttribution = function(p1)
			-- upvalues: momentAttribution (copy)
			return momentAttribution(p1.moment)
		end,
		render = function(p1, _)
			-- upvalues: ToMediaItemModule (copy), ReactModule (copy), MomentMediaView (copy), GetMomentsPreferencesStoreModule (copy), GetFFlagMomentsPartnerContentLabelModule (copy), MomentItemModule (copy)
			local Moment = p1.moment
			
			if Moment == nil then
				return nil
			end
			local Element = nil
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
			local RecommendationMetadata = Moment.recommendationMetadata
			
			return ReactModule.createElement(MomentItemModule, {
				data = {
					kind = "experience",
					creatorIsVerified = nil,
					commentCount = nil,
					momentId = Moment.momentId,
					itemId = Moment.recommendationMetadata and Moment.recommendationMetadata.itemId,
					creatorId = Moment.creatorId,
					placeId = Moment.metadata.placeId or 0,
					universeId = Moment.metadata.universeId or 0,
					isSponsored = GetFFlagMomentsPartnerContentLabelModule() and Moment.metadata.partnerUploadType == "influencer",
					description = Moment.metadata.description,
					isModerated = Moment.isModerated == true,
					feedItemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.itemId,
					feedSessionId = if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId,
					feedItemIdRaw = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId
				},
				mediaSurface = Element,
				moment = Moment
			})
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