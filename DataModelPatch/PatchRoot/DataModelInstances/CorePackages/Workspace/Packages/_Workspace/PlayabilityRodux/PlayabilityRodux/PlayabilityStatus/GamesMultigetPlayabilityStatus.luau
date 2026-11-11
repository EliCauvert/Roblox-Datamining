local Url = require(script:FindFirstAncestor("PlayabilityRodux").Parent.Http).Url

return function(Callback, List)
	-- upvalues: Url (copy)
	assert(type(List) == "table", "GamesMultigetPlayabilityStatus request expects universeId to be a table")
	
	return Callback(string.format("%s/v1/games/multiget-playability-status?universeIds=%s", Url.GAME_URL, (table.concat(List, ","))), "GET")
end