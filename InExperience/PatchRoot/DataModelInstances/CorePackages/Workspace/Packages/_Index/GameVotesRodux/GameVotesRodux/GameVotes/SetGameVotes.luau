return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, UpVotes, DownVotes) --[[ Line: 11 ]]
	assert(type(UniverseId) == "string", "SetGameVotes: universeId must be a string")
	assert(type(UpVotes) == "number", "SetGameVotes: upVotes must be a number")
	assert(type(DownVotes) == "number", "SetGameVotes: downVotes must be a number")
	
	return {
		universeId = UniverseId,
		upVotes = UpVotes,
		downVotes = DownVotes
	}
end)