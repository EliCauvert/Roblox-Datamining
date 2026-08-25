return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { universeId = p0, ageRecommendationDetails = p1 }
end)