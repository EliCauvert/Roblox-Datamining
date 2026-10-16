local Url = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url

return function(Callback, List) --[[ Line: 18 ]]
	-- upvalues: Url (copy)
	assert(type(List) == "table", "GamesMultigetDetails request expects universeIds to be a table")
	
	if #List == 0 or #List > 100 then
		error("GamesMultigetDetails request expects universeIds count between 1-100")
	end
	return Callback(string.format("%sv1/games?universeIds=%s", Url.GAME_URL, (table.concat(List, ","))), "GET")
end