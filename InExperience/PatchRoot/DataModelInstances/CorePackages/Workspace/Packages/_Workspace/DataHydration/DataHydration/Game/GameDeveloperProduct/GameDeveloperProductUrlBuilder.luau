local parent = script:FindFirstAncestor("DataHydration").Parent

return {
	buildStatusesUrl = require(parent.UrlBuilder).UrlBuilder.new({
		query = "playerId={playerId}&placeId={placeId}&status=pending&locationType=ExperienceDetailPage",
		base = require(parent.Http).Url.APIS_URL,
		path = if require(parent.SharedFlags).FFlagLuaAppUseGameTransactionsApiForReceipts then "game-transactions/v1/receipts" else "developer-products/v1/game-transactions"
	})
}