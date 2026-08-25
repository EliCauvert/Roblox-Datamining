return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	assert(type(p0) == "string", "ClearUserGameVotes: universeId must be a string")
	
	return { universeId = p0 }
end)