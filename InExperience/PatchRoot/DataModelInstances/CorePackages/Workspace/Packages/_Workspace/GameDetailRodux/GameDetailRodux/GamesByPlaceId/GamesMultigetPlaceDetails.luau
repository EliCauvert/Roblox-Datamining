local Url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(Callback, PlaceIds)
	-- upvalues: Url (copy)
	return Callback(string.format("%s/v1/games/multiget-place-details?%s", Url.GAME_URL, (Url:makeQueryString({ placeIds = PlaceIds }))), "GET")
end