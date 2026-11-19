local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url
local NewUrlBuilder = UrlBuilder.new({
	path = "game-passes/v1/game-passes/{gamePassId}",
	base = Url.APIS_URL
})

return {
	REVOKE_OWNERSHIP_ENDPOINT = "game-passes/v1/game-passes/...:revokeOwnership",
	buildGamePassesUrl = UrlBuilder.new({
		path = "game-passes/v1/universes/{universeId}/game-passes",
		query = "pageSize=50&passView=Full",
		base = Url.APIS_URL
	}),
	buildRevokeOwnershipUrl = function(GamePassId): string
		-- upvalues: NewUrlBuilder (copy)
		return NewUrlBuilder({ gamePassId = GamePassId }) .. ":revokeOwnership"
	end
}