local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local immutable = require(gameVotesRodux.Parent.AppCommonLib).Immutable
local setGameVotesModule = require(gameVotesRodux.GameVotes.SetGameVotes)

return function(p1, p2)
	-- upvalues: setGameVotesModule (ref), immutable (ref)
	p1 = p1 or {}
	assert(p1, "")
	
	if p2.type == setGameVotesModule.name then
		p1 = immutable.Set(p1, p2.universeId, { upVotes = p2.upVotes, downVotes = p2.downVotes })
	end
	return p1
end