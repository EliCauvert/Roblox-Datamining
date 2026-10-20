local GameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local Immutable = require(GameVotesRodux.Parent.AppCommonLib).Immutable
local SetGameVotesModule = require(GameVotesRodux.GameVotes.SetGameVotes)

return function(p1, p2)
	-- upvalues: SetGameVotesModule (copy), Immutable (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetGameVotesModule.name then
		P0 = Immutable.Set(P0, p2.universeId, { upVotes = p2.upVotes, downVotes = p2.downVotes })
	end
	return P0
end