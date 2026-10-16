return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(HeaderDisplayName, HeaderDisplayNameShort) --[[ Line: 6 ]]
	return {
		headerDisplayName = HeaderDisplayName,
		headerDisplayNameShort = HeaderDisplayNameShort
	}
end)