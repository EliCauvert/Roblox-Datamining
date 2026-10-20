local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	assert(type(p1) == "string", "GameGetIsFavorite request expects universeId to be a string")
	
	return Callback(string.format("%sv1/games/%s/favorites", UrlModule.GAME_URL, p1), "GET")
end