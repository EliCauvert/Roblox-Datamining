local HttpService = game:GetService("HttpService")
local GameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local Url = require(GameVotesRodux.Parent.Http).Url
local VoteStatusModule = require(GameVotesRodux.Enums.VoteStatus)
local config = {
	[VoteStatusModule.VotedUp] = true,
	[VoteStatusModule.VotedDown] = false,
	[VoteStatusModule.NotVoted] = "null"
}

return function(Callback, p1, p2)
	-- upvalues: config (copy), Url (copy), HttpService (copy)
	assert(type(p1) == "string", "GamesPatchUserVotes request expects universeId to be a string")
	local Entry = config[p2]
	assert(Entry ~= nil, "GamesPatchUserVotes request expects a valid vote")
	
	return Callback(string.format("%sv1/games/%s/user-votes", Url.GAME_URL, p1), "PATCH", { postBody = HttpService:JSONEncode({ vote = Entry }) })
end