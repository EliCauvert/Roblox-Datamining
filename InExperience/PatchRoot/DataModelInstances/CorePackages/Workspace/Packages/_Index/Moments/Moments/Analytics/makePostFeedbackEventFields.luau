local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)

return function(p1)
	local PublishedMoment = p1.publishedMoment
	local FeedItemId = if PublishedMoment == nil then nil else PublishedMoment.recommendationMetadata.feedItemId
	
	return {
		creationSessionId = p1.creationSessionId,
		localId = p1.localId,
		captureType = if p1.captureType == nil then nil else p1.captureType.Name,
		momentId = if PublishedMoment == nil then nil else PublishedMoment.momentId,
		feedItemId = if FeedItemId == nil or FeedItemId == "" then nil else FeedItemId
	}
end