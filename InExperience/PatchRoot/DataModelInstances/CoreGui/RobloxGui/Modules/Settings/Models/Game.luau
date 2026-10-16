local GameModule = {
	new = function() --[[ Line: 16 ]]
		return {}
	end
}

function GameModule.fromGameCache(p1) --[[ Line: 21 ]]
	-- upvalues: GameModule (copy)
	local NewGame = GameModule.new()
	NewGame.universeId = p1.UniverseId
	NewGame.placeId = p1.PlaceId
	NewGame.name = p1.Name
	NewGame.playerCount = p1.PlayerCount
	NewGame.imageToken = p1.ImageToken
	NewGame.totalUpVotes = p1.VoteData.UpVotes
	NewGame.totalDownVotes = p1.VoteData.DownVotes
	
	return NewGame
end

function GameModule.fromJsonData(p1) --[[ Line: 33 ]]
	-- upvalues: GameModule (copy)
	local NewGame = GameModule.new()
	NewGame.universeId = p1.universeId
	NewGame.placeId = p1.placeId
	NewGame.name = p1.name
	NewGame.playerCount = p1.playerCount
	NewGame.imageToken = p1.imageToken
	NewGame.totalUpVotes = p1.totalUpVotes
	NewGame.totalDownVotes = p1.totalDownVotes
	
	return NewGame
end

return GameModule