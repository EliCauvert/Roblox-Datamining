local Analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames

return function(p1) --[[ Line: 23 | Named "logFeedEndStateReached" ]]
	-- upvalues: Analytics (copy), EventNames (copy)
	Analytics.fireAnalyticsEvent(EventNames.FeedEndStateReached, {
		source = p1.source,
		recommendationSource = p1.recommendationSource,
		feedSourceId = p1.feedSourceId,
		itemPosition = tostring(p1.itemPosition)
	})
end