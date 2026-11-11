local UrlModule = require(script.Parent.Parent.Parent.Parent.Network.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sv1/games/%d/icon", UrlModule.GAME_URL, p1), "GET")
end