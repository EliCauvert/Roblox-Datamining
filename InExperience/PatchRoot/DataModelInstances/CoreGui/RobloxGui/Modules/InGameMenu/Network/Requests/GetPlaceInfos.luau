local urlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(p1, p2)
	-- upvalues: urlModule (ref)
	for i, v in ipairs(p2) do
		p2[i] = tostring(v)
	end
	return p1(string.format("%s/v1/games/multiget-place-details?%s", urlModule.GAME_URL, urlModule:makeQueryString({ placeIds = p2 })), "GET")
end