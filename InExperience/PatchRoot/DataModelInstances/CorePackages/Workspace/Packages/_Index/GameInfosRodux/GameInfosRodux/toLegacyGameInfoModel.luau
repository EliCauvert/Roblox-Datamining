local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local _ = require(parent.DataHydration)
local _ = require(parent.DiscoveryTypes)

return function(p1)
	local creator = p1.creator
	
	return {
		universeId = p1.universeId,
		placeId = p1.rootPlaceId,
		name = p1.name,
		playerCount = p1.playerCount,
		contentMaturity = p1.contentMaturity,
		minimumAge = p1.gameMinimumAge,
		ageRecommendationDisplayName = p1.gameAgeDisplayName,
		creatorId = if creator then creator.id else nil,
		creatorName = if creator then creator.name else nil
	}
end