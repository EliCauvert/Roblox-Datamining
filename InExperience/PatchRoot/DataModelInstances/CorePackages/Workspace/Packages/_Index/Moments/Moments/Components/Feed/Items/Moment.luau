local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local _ = require(moments.Components.Feed.FeedTypes)
local momentItemModule = require(script.MomentItem)
local momentItemSkeletonModule = require(script.MomentItemSkeleton)
local _ = require(script.createMomentStore)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagMomentsPartnerContentLabelModule = require(moments.Flags.GetFFlagMomentsPartnerContentLabel)
local makeRecommendationAttributionModule = require(moments.Analytics.makeRecommendationAttribution)
local toMediaItemModule = require(moments.Components.Feed.Media.toMediaItem)
local momentMediaView = momentsCommonModule.Media.MomentMediaView

local function momentAttribution(p1)
	-- upvalues: makeRecommendationAttributionModule (ref)
	return if p1 == nil then nil else makeRecommendationAttributionModule(p1.recommendationMetadata)
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
			-- upvalues: toMediaItemModule (ref), reactModule (ref), momentMediaView (ref), getMomentsPreferencesStoreModule (ref), getFFlagMomentsPartnerContentLabelModule (ref), momentItemModule (ref)
			local moment = p1.moment
			
			if moment == nil then
				return nil
			end
			local var1 = nil
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
			local recommendationMetadata = moment.recommendationMetadata
			
			return reactModule.createElement(momentItemModule, {
				data = {
					kind = "experience",
					creatorIsVerified = nil,
					commentCount = nil,
					momentId = moment.momentId,
					creatorId = moment.creatorId,
					placeId = moment.metadata.placeId or 0,
					universeId = moment.metadata.universeId or 0,
					isSponsored = getFFlagMomentsPartnerContentLabelModule() and moment.metadata.partnerUploadType == "influencer",
					description = moment.metadata.description,
					isModerated = moment.isModerated == true,
					feedItemId = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId,
					feedSessionId = if recommendationMetadata ~= nil then nil else recommendationMetadata.tracingId
				},
				mediaSurface = var1,
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