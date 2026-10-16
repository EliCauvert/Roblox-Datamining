return function() --[[ Line: 1 | Named "getUniverseId" ]]
	return if game.GameId > 0 then tostring(game.GameId) else nil
end