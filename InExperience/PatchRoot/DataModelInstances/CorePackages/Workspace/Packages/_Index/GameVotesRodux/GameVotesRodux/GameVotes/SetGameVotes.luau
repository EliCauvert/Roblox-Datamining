return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2) --[[ line: 11 ]]
	assert(type(p0) == "string", "SetGameVotes: universeId must be a string")
	assert(type(p1) == "number", "SetGameVotes: upVotes must be a number")
	assert(type(p2) == "number", "SetGameVotes: downVotes must be a number")
	
	return { universeId = p0, upVotes = p1, downVotes = p2 }
end)