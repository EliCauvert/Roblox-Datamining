local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local AvatarMomentContainerModule = require(script.AvatarMomentContainer)
local _ = require(Moments.Components.Feed.FeedTypes)
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local FFlagMomentsRecommendationContentTypeModule = require(Moments.Flags.FFlagMomentsRecommendationContentType)

return {
	{
		kind = "avatarMoment",
		getKey = function(p1)
			local FeedItemId = p1.moment.recommendationMetadata.feedItemId
			
			return if FeedItemId == nil or FeedItemId == "" then p1.moment.momentId else FeedItemId
		end,
		getAttribution = function(p1)
			-- upvalues: FFlagMomentsRecommendationContentTypeModule (copy), MakeRecommendationAttributionModule (copy)
			local Moment = p1.moment
			
			if FFlagMomentsRecommendationContentTypeModule then
				return MakeRecommendationAttributionModule(Moment.recommendationMetadata, Moment, "Avatar")
			else
				local RecommendationMetadata = Moment.recommendationMetadata
				local FeedItemId = RecommendationMetadata.feedItemId
				
				return if FeedItemId == nil or FeedItemId == "" then nil else {
					itemId = FeedItemId,
					tracingId = RecommendationMetadata.tracingId
				}
			end
		end,
		render = function(Item, Index)
			-- upvalues: ReactModule (copy), AvatarMomentContainerModule (copy)
			return ReactModule.createElement(AvatarMomentContainerModule, { index = Index, item = Item })
		end
	}
}