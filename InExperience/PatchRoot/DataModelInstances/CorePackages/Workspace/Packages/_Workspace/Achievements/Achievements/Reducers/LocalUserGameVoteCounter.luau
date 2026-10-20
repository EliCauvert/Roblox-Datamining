local Parent = script:FindFirstAncestor("Achievements").Parent
local CryoModule = require(Parent.Cryo)
local Reducer = require(Parent.Rodux).createReducer({
	voteCountSinceAppStart = 0,
	lastUniverseId = -1,
	gameVoteStatus = {}
}, {
	SetUserGameVotes = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local UniverseId = p2.universeId
		local UserVote = p2.userVote
		local GameVoteStatus = p1.gameVoteStatus
		local VoteCountSinceAppStart = p1.voteCountSinceAppStart
		local LastUniverseId = p1.lastUniverseId
		
		if p2.canVote and GameVoteStatus[UniverseId] and GameVoteStatus[UniverseId] ~= UserVote and UserVote ~= "NotVoted" then
			VoteCountSinceAppStart += 1
			LastUniverseId = UniverseId
		end
		return CryoModule.Dictionary.join(p1, {
			gameVoteStatus = CryoModule.Dictionary.join(GameVoteStatus, { [UniverseId] = UserVote }),
			voteCountSinceAppStart = VoteCountSinceAppStart,
			lastUniverseId = LastUniverseId
		})
	end
})

return function(p1, p2)
	-- upvalues: Reducer (copy)
	return Reducer(p1, p2)
end