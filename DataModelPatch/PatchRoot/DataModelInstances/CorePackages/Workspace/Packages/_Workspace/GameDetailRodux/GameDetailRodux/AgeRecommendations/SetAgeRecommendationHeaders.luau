return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(HeaderDisplayName, HeaderDisplayNameShort)
	return {
		headerDisplayName = HeaderDisplayName,
		headerDisplayNameShort = HeaderDisplayNameShort
	}
end)