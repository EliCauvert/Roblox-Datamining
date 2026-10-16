local Parent = script:FindFirstAncestor("GameInfosRodux").Parent
local _ = require(Parent.DataHydration)
local _ = require(Parent.DiscoveryTypes)

return function(p1) --[[ Line: 16 | Named "toLegacyGameInfoModel" ]]
	local Creator = p1.creator
	
	return {
		universeId = p1.universeId,
		placeId = p1.rootPlaceId,
		name = p1.name,
		playerCount = p1.playerCount,
		contentMaturity = p1.contentMaturity,
		minimumAge = p1.gameMinimumAge,
		ageRecommendationDisplayName = p1.gameAgeDisplayName,
		creatorId = if Creator then Creator.id else nil,
		creatorName = if Creator then Creator.name else nil
	}
end