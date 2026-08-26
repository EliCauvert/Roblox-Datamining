local analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
local eventNames = analytics.EventNames

return function(p1)
	-- upvalues: analytics (ref), eventNames (ref)
	analytics.fireAnalyticsEvent(eventNames.FeedEndStateReached, {
		source = p1.source,
		recommendationSource = p1.recommendationSource,
		feedSourceId = p1.feedSourceId,
		itemPosition = tostring(p1.itemPosition)
	})
end