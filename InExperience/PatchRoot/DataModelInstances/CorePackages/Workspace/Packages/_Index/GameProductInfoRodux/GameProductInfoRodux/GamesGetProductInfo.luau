local url = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Http).Url

return function(p0, p1)
	-- upvalues: url (ref)
	assert(type(p1) == "table", "GamesGetProductInfo request expects universeIds to be a table")
	assert(#p1 > 0, "GamesGetProductInfo request expects universeIds count to be greater than 0")
	assert(#p1 <= 100, "GamesGetProductInfo request expects universeIds count to not exceed " .. 100)
	
	return p0(string.format("%sv1/games/games-product-info?universeIds=%s", url.GAME_URL, table.concat(p1, ",")), "GET")
end