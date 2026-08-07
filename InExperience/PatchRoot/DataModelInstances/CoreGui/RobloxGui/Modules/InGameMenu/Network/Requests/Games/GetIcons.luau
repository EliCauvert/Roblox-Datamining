local urlModule = require(script.Parent.Parent.Parent.Parent.Network.Url)

return function(p0, p1) --[[ line: 20 ]]
	-- upvalues: urlModule (ref)
	return p0(string.format("%sv1/games/%d/icon", urlModule.GAME_URL, p1), "GET")
end