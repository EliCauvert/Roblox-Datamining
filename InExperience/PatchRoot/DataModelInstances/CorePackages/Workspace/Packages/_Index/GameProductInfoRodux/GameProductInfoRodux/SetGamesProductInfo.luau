return require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { gamesProductInfo = p1 }
end)