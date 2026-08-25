return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3)
	assert(type(p0) == "string", "SetUserGameVotes: universeId must be a string")
	assert(type(p1) == "boolean", "SetUserGameVotes: canVote must be a boolean")
	assert(type(p2) == "string", "SetUserGameVotes: userVote must be a string")
	assert(type(p3) == "string", "SetUserGameVotes: reasonForNotVoteable must be a string")
	
	return {
		universeId = p0,
		canVote = p1,
		userVote = p2,
		reasonForNotVoteable = p3
	}
end)