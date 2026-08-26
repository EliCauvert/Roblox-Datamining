local url = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	assert(type(p2) == "table", "GamesGetProductInfo request expects universeIds to be a table")
	assert(#p2 > 0, "GamesGetProductInfo request expects universeIds count to be greater than 0")
	assert(#p2 <= 100, "GamesGetProductInfo request expects universeIds count to not exceed " .. 100)
	
	return p1(string.format("%sv1/games/games-product-info?universeIds=%s", url.GAME_URL, table.concat(p2, ",")), "GET")
end