local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sv1/games/%d/social-links/list", UrlModule.GAME_URL, p1), "GET")
end