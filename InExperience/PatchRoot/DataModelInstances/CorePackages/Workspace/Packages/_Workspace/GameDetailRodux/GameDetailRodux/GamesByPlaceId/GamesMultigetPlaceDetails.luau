local url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(p0, p1)
	-- upvalues: url (ref)
	return p0(string.format("%s/v1/games/multiget-place-details?%s", url.GAME_URL, url:makeQueryString({ placeIds = p1 })), "GET")
end