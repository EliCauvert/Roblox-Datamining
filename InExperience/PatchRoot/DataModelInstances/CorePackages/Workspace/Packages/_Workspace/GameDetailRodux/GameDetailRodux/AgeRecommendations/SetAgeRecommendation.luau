return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, AgeRecommendationDetails) --[[ Line: 6 ]]
	return {
		universeId = UniverseId,
		ageRecommendationDetails = AgeRecommendationDetails
	}
end)