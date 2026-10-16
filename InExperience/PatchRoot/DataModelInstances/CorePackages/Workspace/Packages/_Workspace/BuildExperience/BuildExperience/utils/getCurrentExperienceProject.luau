return function() --[[ Line: 9 | Named "getCurrentExperienceProject" ]]
	local GameId = game.GameId
	local PlaceId = game.PlaceId
	
	return {
		universeId = if GameId == 0 then nil else GameId,
		placeId = if PlaceId == 0 then nil else PlaceId
	}
end