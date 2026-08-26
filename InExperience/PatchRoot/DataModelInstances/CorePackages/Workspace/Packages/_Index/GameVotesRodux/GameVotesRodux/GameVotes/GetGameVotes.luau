local url = require(script:FindFirstAncestor("GameVotesRodux").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	assert(type(p2) == "string", "GetGameVotes request expects universeId to be a string")
	
	return p1(string.format("%sv1/games/%s/votes", url.GAME_URL, p2), "GET")
end