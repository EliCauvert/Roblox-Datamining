local httpService = game:GetService("HttpService")
local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local url = require(gameVotesRodux.Parent.Http).Url
local voteStatusModule = require(gameVotesRodux.Enums.VoteStatus)
local t = {
	[voteStatusModule.VotedUp] = true,
	[voteStatusModule.VotedDown] = false,
	[voteStatusModule.NotVoted] = "null"
}

return function(p1, p2, p3)
	-- upvalues: t (ref), url (ref), httpService (ref)
	assert(type(p2) == "string", "GamesPatchUserVotes request expects universeId to be a string")
	local var1 = t[p3]
	assert(var1 ~= nil, "GamesPatchUserVotes request expects a valid vote")
	
	return p1(string.format("%sv1/games/%s/user-votes", url.GAME_URL, p2), "PATCH", { postBody = httpService:JSONEncode({ vote = var1 }) })
end