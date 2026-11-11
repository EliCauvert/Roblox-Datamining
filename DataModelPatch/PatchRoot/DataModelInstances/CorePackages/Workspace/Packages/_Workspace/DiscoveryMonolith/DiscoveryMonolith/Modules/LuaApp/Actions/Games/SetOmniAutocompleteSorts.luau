return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(SortsTable)
	return { sortsTable = SortsTable }
end)