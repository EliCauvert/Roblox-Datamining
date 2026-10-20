local Url = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Http).Url

return function(Callback, List)
	-- upvalues: Url (copy)
	assert(type(List) == "table", "GamesGetProductInfo request expects universeIds to be a table")
	assert(#List > 0, "GamesGetProductInfo request expects universeIds count to be greater than 0")
	assert(#List <= 100, "GamesGetProductInfo request expects universeIds count to not exceed " .. 100)
	
	return Callback(string.format("%sv1/games/games-product-info?universeIds=%s", Url.GAME_URL, (table.concat(List, ","))), "GET")
end