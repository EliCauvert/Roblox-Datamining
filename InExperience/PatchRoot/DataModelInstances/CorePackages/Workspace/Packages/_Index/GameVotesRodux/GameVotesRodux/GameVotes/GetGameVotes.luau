local Url = require(script:FindFirstAncestor("GameVotesRodux").Parent.Http).Url

return function(Callback, p1) --[[ Line: 18 ]]
	-- upvalues: Url (copy)
	assert(type(p1) == "string", "GetGameVotes request expects universeId to be a string")
	
	return Callback(string.format("%sv1/games/%s/votes", Url.GAME_URL, p1), "GET")
end