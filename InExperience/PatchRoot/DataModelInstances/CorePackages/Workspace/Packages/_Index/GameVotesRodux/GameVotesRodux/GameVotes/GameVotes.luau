local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local immutable = require(gameVotesRodux.Parent.AppCommonLib).Immutable
local setGameVotesModule = require(gameVotesRodux.GameVotes.SetGameVotes)

return function(p0, p1)
	-- upvalues: setGameVotesModule (ref), immutable (ref)
	p0 = p0 or {}
	assert(p0, "")
	
	if p1.type == setGameVotesModule.name then
		p0 = immutable.Set(p0, p1.universeId, { upVotes = p1.upVotes, downVotes = p1.downVotes })
	end
	return p0
end