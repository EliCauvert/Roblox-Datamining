local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local _ = require(Parent.DiscoveryTypes)

return require(Parent.Rodux).makeActionCreator(script.Name, function(AppPage, SecondaryKey, FeedItemPosition, FeedItem, ActualNumberOfRows)
	return {
		appPage = AppPage,
		secondaryKey = SecondaryKey,
		feedItemPosition = FeedItemPosition,
		feedItem = FeedItem,
		actualNumberOfRows = ActualNumberOfRows
	}
end)