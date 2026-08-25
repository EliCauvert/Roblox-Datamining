local parent = script:FindFirstAncestor("DataHydration").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return {
	buildFavoriteUrl = function(p0)
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "v1/games/{universeId}/favorites",
			base = url.GAME_URL
		})({ universeId = p0 })
	end,
	buildFavoriteUpdateUrl = function(p1)
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "v1/games/{universeId}/favorites",
			base = url.GAME_URL
		})({ universeId = p1 })
	end,
	FAVORITE_URL = urlBuilder.new({ path = "v1/games/favorites", base = url.GAME_URL }),
	FAVORITE_UPDATE_URL = urlBuilder.new({ path = "v1/games/favorites/update", base = url.GAME_URL })
}