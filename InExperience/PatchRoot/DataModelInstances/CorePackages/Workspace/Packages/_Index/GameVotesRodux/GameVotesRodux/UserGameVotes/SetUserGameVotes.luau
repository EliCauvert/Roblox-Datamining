return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	assert(type(p1) == "string", "SetUserGameVotes: universeId must be a string")
	assert(type(p2) == "boolean", "SetUserGameVotes: canVote must be a boolean")
	assert(type(p3) == "string", "SetUserGameVotes: userVote must be a string")
	assert(type(p4) == "string", "SetUserGameVotes: reasonForNotVoteable must be a string")
	
	return {
		universeId = p1,
		canVote = p2,
		userVote = p3,
		reasonForNotVoteable = p4
	}
end)