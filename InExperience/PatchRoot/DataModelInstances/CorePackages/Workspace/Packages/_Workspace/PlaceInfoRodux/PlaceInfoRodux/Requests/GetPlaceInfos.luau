local url = require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	return p1(string.format("%s/v1/games/multiget-place-details?%s", url.GAME_URL, url:makeQueryString({ placeIds = p2 })), "GET")
end