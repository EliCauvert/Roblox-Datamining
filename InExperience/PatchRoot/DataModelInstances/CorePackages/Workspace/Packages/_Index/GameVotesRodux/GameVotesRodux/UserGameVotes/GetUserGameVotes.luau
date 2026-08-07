local url = require(script:FindFirstAncestor("GameVotesRodux").Parent.Http).Url

return function(p0, p1) --[[ line: 19 ]]
	-- upvalues: url (ref)
	assert(type(p1) == "string", "GetUserGameVotes request expects universeId to be a string")
	
	return p0(string.format("%sv1/games/%s/votes/user", url.GAME_URL, p1), "GET")
end