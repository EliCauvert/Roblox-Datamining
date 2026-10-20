local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return function(p1)
	if p1 == nil then
		return nil
	else
		local RecommendationMetadata = p1.recommendationMetadata
		local FeedItemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId
		
		return if FeedItemId == nil or FeedItemId == "" then nil elseif p1.momentId == FeedItemId then FeedItemId else nil
	end
end