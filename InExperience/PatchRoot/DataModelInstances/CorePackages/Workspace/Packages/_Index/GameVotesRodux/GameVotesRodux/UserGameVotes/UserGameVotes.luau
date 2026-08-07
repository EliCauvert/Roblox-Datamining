local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local immutable = require(gameVotesRodux.Parent.AppCommonLib).Immutable
local setUserGameVotesModule = require(gameVotesRodux.UserGameVotes.SetUserGameVotes)
local clearUserGameVotesModule = require(gameVotesRodux.UserGameVotes.ClearUserGameVotes)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: setUserGameVotesModule (ref), immutable (ref), clearUserGameVotesModule (ref)
	p0 = p0 or {}
	
	if p1.type == setUserGameVotesModule.name then
		p0 = immutable.Set(p0, p1.universeId, {
			canVote = p1.canVote,
			userVote = p1.userVote,
			reasonForNotVoteable = p1.reasonForNotVoteable
		})
		
		return p0
	elseif p1.type == clearUserGameVotesModule.name then
		p0 = immutable.Set(p0, p1.universeId, nil)
	end
	return p0
end