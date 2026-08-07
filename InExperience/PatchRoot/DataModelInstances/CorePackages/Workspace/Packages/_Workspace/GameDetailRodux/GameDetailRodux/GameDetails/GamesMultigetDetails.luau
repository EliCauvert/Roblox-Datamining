local url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(p0, p1) --[[ line: 18 ]]
	-- upvalues: url (ref)
	assert(type(p1) == "table", "GamesMultigetDetails request expects universeIds to be a table")
	
	if #p1 == 0 or #p1 > 100 then
		error("GamesMultigetDetails request expects universeIds count between 1-100")
	end
	return p0(string.format("%sv1/games?universeIds=%s", url.GAME_URL, table.concat(p1, ",")), "GET")
end