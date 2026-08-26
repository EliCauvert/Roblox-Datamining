return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { gameDetails = p1 }
end)