return require(script:FindFirstAncestor("GameDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, ErrorType, _) --[[ Line: 13 ]]
	return { universeId = UniverseId, errorType = ErrorType }
end)