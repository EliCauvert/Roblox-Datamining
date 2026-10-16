local GameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local Immutable = require(GameVotesRodux.Parent.AppCommonLib).Immutable
local SetUserGameVotesModule = require(GameVotesRodux.UserGameVotes.SetUserGameVotes)
local ClearUserGameVotesModule = require(GameVotesRodux.UserGameVotes.ClearUserGameVotes)

return function(p1, p2) --[[ Line: 7 ]]
	-- upvalues: SetUserGameVotesModule (copy), Immutable (copy), ClearUserGameVotesModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetUserGameVotesModule.name then
		P0 = Immutable.Set(P0, p2.universeId, {
			canVote = p2.canVote,
			userVote = p2.userVote,
			reasonForNotVoteable = p2.reasonForNotVoteable
		})
		
		return P0
	end
	if p2.type == ClearUserGameVotesModule.name then
		P0 = Immutable.Set(P0, p2.universeId, nil)
	end
	return P0
end