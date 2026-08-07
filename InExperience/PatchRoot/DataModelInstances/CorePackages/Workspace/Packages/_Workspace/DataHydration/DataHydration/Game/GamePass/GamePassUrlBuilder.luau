local parent = script:FindFirstAncestor("DataHydration").Parent

return {
	buildGamePassesUrl = require(parent.UrlBuilder).UrlBuilder.new({
		path = "game-passes/v1/universes/{universeId}/game-passes",
		query = "pageSize=50&passView=Full",
		base = require(parent.Http).Url.APIS_URL
	})
}