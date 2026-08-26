local url = require(script:FindFirstAncestor("PlayabilityRodux").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	assert(type(p2) == "table", "GamesMultigetPlayabilityStatus request expects universeId to be a table")
	
	return p1(string.format("%s/v1/games/multiget-playability-status?universeIds=%s", url.GAME_URL, table.concat(p2, ",")), "GET")
end