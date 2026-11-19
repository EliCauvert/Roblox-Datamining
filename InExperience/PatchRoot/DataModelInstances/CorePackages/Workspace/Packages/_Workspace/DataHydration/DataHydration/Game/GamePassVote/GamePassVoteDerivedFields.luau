local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.Signals)
local _ = require(script.Parent.GamePassVoteStoreTypes)
local VotesUtilsModule = require(DataHydration.Game.Votes.VotesUtils)

return {
	calculateDerivedField = function(p1, p2, _)
		-- upvalues: VotesUtilsModule (copy)
		return if p2 == nil then nil elseif p1 == "total_up_votes" then p2.totalUpVotes elseif p1 == "total_down_votes" then p2.totalDownVotes elseif p1 == "user_vote" then p2.userVote elseif p1 == "rating_text" then VotesUtilsModule.getRatingDisplayText({
			upVotes = p2.totalUpVotes,
			downVotes = p2.totalDownVotes,
			rating = VotesUtilsModule.calculateRating(p2.totalUpVotes, p2.totalDownVotes)
		}) else nil
	end
}