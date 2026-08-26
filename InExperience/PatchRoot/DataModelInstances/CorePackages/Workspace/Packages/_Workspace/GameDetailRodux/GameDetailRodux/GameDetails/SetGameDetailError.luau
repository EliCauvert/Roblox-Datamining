return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, _)
	return { universeId = p1, errorType = p2 }
end)