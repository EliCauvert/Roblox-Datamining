local Parent = script:FindFirstAncestor("DataHydration").Parent

return {
	buildStatusesUrl = require(Parent.UrlBuilder).UrlBuilder.new({
		path = "developer-products/v1/game-transactions",
		query = "playerId={playerId}&placeId={placeId}&status=pending&locationType=ExperienceDetailPage",
		base = require(Parent.Http).Url.APIS_URL
	})
}