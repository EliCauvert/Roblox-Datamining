local parent = script:FindFirstAncestor("DataHydration").Parent

return {
	buildStatusesUrl = require(parent.UrlBuilder).UrlBuilder.new({
		path = "developer-products/v1/game-transactions",
		query = "playerId={playerId}&placeId={placeId}&status=pending&locationType=ExperienceDetailPage",
		base = require(parent.Http).Url.APIS_URL
	})
}