local urlModule = require(script.Parent.Parent.Parent.Parent.Network.Url)

return function(p1, p2)
	-- upvalues: urlModule (ref)
	return p1(string.format("%sv1/games/%d/icon", urlModule.GAME_URL, p2), "GET")
end