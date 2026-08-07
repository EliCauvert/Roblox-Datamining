local parent = script:FindFirstAncestor("Achievements").Parent
local cryoModule = require(parent.Cryo)
local var1 = require(parent.Rodux).createReducer({
	voteCountSinceAppStart = 0,
	lastUniverseId = -1,
	gameVoteStatus = {}
}, {
	SetUserGameVotes = function(value, p0) --[[ line: 30 ]]
		-- upvalues: cryoModule (ref)
		local universeId = p0.universeId
		local userVote = p0.userVote
		local canVote = p0.canVote
		local gameVoteStatus = value.gameVoteStatus
		local voteCountSinceAppStart = value.voteCountSinceAppStart
		local lastUniverseId = value.lastUniverseId
		
		if canVote and gameVoteStatus[universeId] and (gameVoteStatus[universeId] ~= userVote and userVote ~= "NotVoted") then
			voteCountSinceAppStart += 1
			lastUniverseId = universeId
		end
		return cryoModule.Dictionary.join(value, {
			gameVoteStatus = cryoModule.Dictionary.join(gameVoteStatus, { [universeId] = userVote }),
			voteCountSinceAppStart = voteCountSinceAppStart,
			lastUniverseId = lastUniverseId
		})
	end
})

return function(p1, p2) --[[ line: 64 ]]
	-- upvalues: var1 (ref)
	return var1(p1, p2)
end