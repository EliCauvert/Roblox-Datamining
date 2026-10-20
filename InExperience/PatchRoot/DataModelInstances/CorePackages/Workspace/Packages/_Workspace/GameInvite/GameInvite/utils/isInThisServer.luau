local _ = require(script:FindFirstAncestor("GameInvite").Parent.DataHydration)

return function(p1, GameId): boolean
	return p1 ~= nil and (GameId ~= "" and p1.gameId == GameId)
end