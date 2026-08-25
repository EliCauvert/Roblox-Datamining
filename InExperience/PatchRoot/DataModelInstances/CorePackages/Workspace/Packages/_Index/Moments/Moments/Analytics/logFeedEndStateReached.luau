local analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
local eventNames = analytics.EventNames

return function(p0)
	-- upvalues: analytics (ref), eventNames (ref)
	analytics.fireAnalyticsEvent(eventNames.FeedEndStateReached, {
		source = p0.source,
		recommendationSource = p0.recommendationSource,
		feedSourceId = p0.feedSourceId,
		itemPosition = tostring(p0.itemPosition)
	})
end