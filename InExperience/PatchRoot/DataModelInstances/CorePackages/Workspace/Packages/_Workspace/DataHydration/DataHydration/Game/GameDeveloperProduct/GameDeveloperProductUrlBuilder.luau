local Parent = script:FindFirstAncestor("DataHydration").Parent

return {
	buildStatusesUrl = require(Parent.UrlBuilder).UrlBuilder.new({
		query = "playerId={playerId}&placeId={placeId}&status=pending&locationType=ExperienceDetailPage",
		base = require(Parent.Http).Url.APIS_URL,
		path = if require(Parent.SharedFlags).FFlagLuaAppUseGameTransactionsApiForReceipts then "game-transactions/v1/receipts" else "developer-products/v1/game-transactions"
	})
}