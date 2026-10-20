return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(GameDetails)
	return { gameDetails = GameDetails }
end)