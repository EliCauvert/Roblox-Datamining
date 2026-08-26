return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { headerDisplayName = p1, headerDisplayNameShort = p2 }
end)