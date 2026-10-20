return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, AgeRecommendationDetails)
	return {
		universeId = UniverseId,
		ageRecommendationDetails = AgeRecommendationDetails
	}
end)