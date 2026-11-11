return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, ErrorType, _)
	return { universeId = UniverseId, errorType = ErrorType }
end)