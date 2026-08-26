local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local immutable = require(gameVotesRodux.Parent.AppCommonLib).Immutable
local setUserGameVotesModule = require(gameVotesRodux.UserGameVotes.SetUserGameVotes)
local clearUserGameVotesModule = require(gameVotesRodux.UserGameVotes.ClearUserGameVotes)

return function(p1, p2)
	-- upvalues: setUserGameVotesModule (ref), immutable (ref), clearUserGameVotesModule (ref)
	p1 = p1 or {}
	
	if p2.type == setUserGameVotesModule.name then
		p1 = immutable.Set(p1, p2.universeId, {
			canVote = p2.canVote,
			userVote = p2.userVote,
			reasonForNotVoteable = p2.reasonForNotVoteable
		})
		
		return p1
	elseif p2.type == clearUserGameVotesModule.name then
		p1 = immutable.Set(p1, p2.universeId, nil)
	end
	return p1
end