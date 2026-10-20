local Parent = script:FindFirstAncestor("DataHydration").Parent

return {
	buildStatusesUrl = require(Parent.UrlBuilder).UrlBuilder.new({
		path = "game-transactions/v1/receipts",
		query = "playerId={playerId}&placeId={placeId}&status=pending&locationType=ExperienceDetailPage",
		base = require(Parent.Http).Url.APIS_URL
	})
}