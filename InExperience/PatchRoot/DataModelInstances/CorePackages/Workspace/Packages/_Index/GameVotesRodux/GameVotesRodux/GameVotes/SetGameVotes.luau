return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	assert(type(p1) == "string", "SetGameVotes: universeId must be a string")
	assert(type(p2) == "number", "SetGameVotes: upVotes must be a number")
	assert(type(p3) == "number", "SetGameVotes: downVotes must be a number")
	
	return { universeId = p1, upVotes = p2, downVotes = p3 }
end)