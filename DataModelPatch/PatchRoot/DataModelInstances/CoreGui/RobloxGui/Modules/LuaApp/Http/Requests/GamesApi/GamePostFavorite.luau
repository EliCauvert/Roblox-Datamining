local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1, IsFavorited)
	-- upvalues: UrlModule (copy), HttpService (copy)
	assert(type(p1) == "string", "GamePostFavorite request expects universeId to be a string")
	assert(type(IsFavorited) == "boolean", "GamePostFavorite request expects isFavorited to be a boolean")
	
	return Callback(string.format("%sv1/games/%s/favorites", UrlModule.GAME_URL, p1), "POST", {
		postBody = HttpService:JSONEncode({ isFavorited = IsFavorited })
	})
end