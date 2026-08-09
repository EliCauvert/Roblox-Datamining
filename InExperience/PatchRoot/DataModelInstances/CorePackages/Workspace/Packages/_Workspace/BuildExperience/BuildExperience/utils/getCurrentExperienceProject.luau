return function() --[[ line: 10 | named "getCurrentExperienceProject" ]]
	local gameId = game.GameId
	local placeId = game.PlaceId
	
	return {
		universeId = if gameId == 0 then nil else gameId,
		placeId = if placeId == 0 then nil else placeId
	}
end