return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId) --[[ Line: 5 ]]
	assert(type(UniverseId) == "string", "ClearUserGameVotes: universeId must be a string")
	
	return { universeId = UniverseId }
end)