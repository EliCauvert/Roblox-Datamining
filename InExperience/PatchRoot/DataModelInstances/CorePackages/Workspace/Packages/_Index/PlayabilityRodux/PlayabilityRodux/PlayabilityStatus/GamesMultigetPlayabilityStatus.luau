local url = require(script:FindFirstAncestor("PlayabilityRodux").Parent.Http).Url

return function(p0, p1)
	-- upvalues: url (ref)
	assert(type(p1) == "table", "GamesMultigetPlayabilityStatus request expects universeId to be a table")
	
	return p0(string.format("%s/v1/games/multiget-playability-status?universeIds=%s", url.GAME_URL, table.concat(p1, ",")), "GET")
end