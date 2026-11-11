return require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(GamesProductInfo)
	return { gamesProductInfo = GamesProductInfo }
end)