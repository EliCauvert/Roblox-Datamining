return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator("UpdateGameMedia", function(UniverseId, Entries)
	return { universeId = UniverseId, entries = Entries }
end)