local url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	assert(type(p2) == "table", "GamesMultigetDetails request expects universeIds to be a table")
	
	if #p2 == 0 or #p2 > 100 then
		error("GamesMultigetDetails request expects universeIds count between 1-100")
	end
	return p1(string.format("%sv1/games?universeIds=%s", url.GAME_URL, table.concat(p2, ",")), "GET")
end