local Parent = script:FindFirstAncestor("DataHydration").Parent

return {
	buildGamePassesUrl = require(Parent.UrlBuilder).UrlBuilder.new({
		path = "game-passes/v1/universes/{universeId}/game-passes",
		query = "pageSize=50&passView=Full",
		base = require(Parent.Http).Url.APIS_URL
	})
}