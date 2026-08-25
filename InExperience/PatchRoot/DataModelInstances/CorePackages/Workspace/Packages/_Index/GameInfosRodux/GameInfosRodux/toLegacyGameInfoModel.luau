local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local _ = require(parent.DataHydration)
local _ = require(parent.DiscoveryTypes)

return function(p0)
	local creator = p0.creator
	
	return {
		universeId = p0.universeId,
		placeId = p0.rootPlaceId,
		name = p0.name,
		playerCount = p0.playerCount,
		contentMaturity = p0.contentMaturity,
		minimumAge = p0.gameMinimumAge,
		ageRecommendationDisplayName = p0.gameAgeDisplayName,
		creatorId = if creator then creator.id else nil,
		creatorName = if creator then creator.name else nil
	}
end