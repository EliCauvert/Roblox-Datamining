local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return {
	buildFavoriteUrl = function(UniverseId)
		-- upvalues: UrlBuilder (copy), Url (copy)
		return UrlBuilder.new({
			path = "v1/games/{universeId}/favorites",
			base = Url.GAME_URL
		})({ universeId = UniverseId })
	end,
	buildFavoriteUpdateUrl = function(UniverseId)
		-- upvalues: UrlBuilder (copy), Url (copy)
		return UrlBuilder.new({
			path = "v1/games/{universeId}/favorites",
			base = Url.GAME_URL
		})({ universeId = UniverseId })
	end,
	FAVORITE_URL = UrlBuilder.new({ path = "v1/games/favorites", base = Url.GAME_URL }),
	FAVORITE_UPDATE_URL = UrlBuilder.new({ path = "v1/games/favorites/update", base = Url.GAME_URL })
}