local httpService = game:GetService("HttpService")
local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local url = require(gameVotesRodux.Parent.Http).Url
local voteStatusModule = require(gameVotesRodux.Enums.VoteStatus)
local t = {
	[voteStatusModule.VotedUp] = true,
	[voteStatusModule.VotedDown] = false,
	[voteStatusModule.NotVoted] = "null"
}

return function(p0, p1, p2)
	-- upvalues: t (ref), url (ref), httpService (ref)
	assert(type(p1) == "string", "GamesPatchUserVotes request expects universeId to be a string")
	local var4 = t[p2]
	assert(var4 ~= nil, "GamesPatchUserVotes request expects a valid vote")
	
	return p0(string.format("%sv1/games/%s/user-votes", url.GAME_URL, p1), "PATCH", { postBody = httpService:JSONEncode({ vote = var4 }) })
end