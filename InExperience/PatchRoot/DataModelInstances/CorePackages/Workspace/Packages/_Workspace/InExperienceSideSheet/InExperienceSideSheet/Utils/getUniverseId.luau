return function() --[[ line: 1 | named "getUniverseId" ]]
	return if game.GameId > 0 then tostring(game.GameId) else nil
end