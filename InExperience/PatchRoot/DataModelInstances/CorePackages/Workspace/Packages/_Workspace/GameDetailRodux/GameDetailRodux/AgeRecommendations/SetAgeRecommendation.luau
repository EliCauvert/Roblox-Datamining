return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { universeId = p1, ageRecommendationDetails = p2 }
end)