return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "string", "ClearUserGameVotes: universeId must be a string")
	
	return { universeId = p1 }
end)