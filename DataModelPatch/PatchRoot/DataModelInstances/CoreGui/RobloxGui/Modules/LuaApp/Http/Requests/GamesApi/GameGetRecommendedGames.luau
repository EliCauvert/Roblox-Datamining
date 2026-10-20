local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1, p2)
	-- upvalues: UrlModule (copy)
	assert(type(p1) == "string", "GameGetRecommendedGames request expects universeId to be a string")
	
	return Callback(string.format("%sv1/games/recommendations/game/%s?%s", UrlModule.GAME_URL, p1, (UrlModule:makeQueryString(p2))), "GET")
end