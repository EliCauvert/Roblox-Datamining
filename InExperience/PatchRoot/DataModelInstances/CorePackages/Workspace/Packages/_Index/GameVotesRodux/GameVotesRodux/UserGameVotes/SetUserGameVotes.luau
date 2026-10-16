return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, CanVote, UserVote, ReasonForNotVoteable) --[[ Line: 12 ]]
	assert(type(UniverseId) == "string", "SetUserGameVotes: universeId must be a string")
	assert(type(CanVote) == "boolean", "SetUserGameVotes: canVote must be a boolean")
	assert(type(UserVote) == "string", "SetUserGameVotes: userVote must be a string")
	assert(type(ReasonForNotVoteable) == "string", "SetUserGameVotes: reasonForNotVoteable must be a string")
	
	return {
		universeId = UniverseId,
		canVote = CanVote,
		userVote = UserVote,
		reasonForNotVoteable = ReasonForNotVoteable
	}
end)