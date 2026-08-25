return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { headerDisplayName = p0, headerDisplayNameShort = p1 }
end)