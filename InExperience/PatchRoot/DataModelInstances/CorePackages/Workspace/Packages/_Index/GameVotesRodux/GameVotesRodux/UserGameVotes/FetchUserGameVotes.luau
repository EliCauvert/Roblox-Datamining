local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local parent = gameVotesRodux.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local logging = require(parent.AppCommonLib).Logging
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local getUserGameVotesModule = require(gameVotesRodux.UserGameVotes.GetUserGameVotes)
local setUserGameVotesModule = require(gameVotesRodux.UserGameVotes.SetUserGameVotes)
local voteStatusModule = require(gameVotesRodux.Enums.VoteStatus)

local function _(p0) --[[ line: 11 | named "getUserVoteStatus" ]]
	-- upvalues: voteStatusModule (ref)
	return if p0 == true then voteStatusModule.VotedUp elseif p0 == false then voteStatusModule.VotedDown elseif p0 == nil then voteStatusModule.NotVoted else nil
end

local _ = function(p1) --[[ line: 24 | named "fetchKeymapper" ]]
	return "luaapp.gamesapi.user-game-votes" .. p1
end

return {
	Fetch = function(p2, p3) --[[ line: 28 ]]
		-- upvalues: performFetch (ref), getUserGameVotesModule (ref), voteStatusModule (ref), setUserGameVotesModule (ref), logging (ref), promiseModule (ref), setNetworkingErrorToast (ref)
		assert(type(p3) == "string", string.format("FetchUserGameVotes thunk expects universeId to be a string, was %s", type(p3)))
		
		return performFetch.Single("luaapp.gamesapi.user-game-votes" .. p3, function(p4) --[[ line: 34 ]]
			-- upvalues: getUserGameVotesModule (copy), p2 (ref), p3 (ref), voteStatusModule (copy), setUserGameVotesModule (copy), logging (copy), promiseModule (copy), setNetworkingErrorToast (copy)
			return getUserGameVotesModule(p2, p3):andThen(function(p5) --[[ line: 35 ]]
				-- upvalues: voteStatusModule (copy), p4 (ref), setUserGameVotesModule (copy), p3 (copy), logging (copy), promiseModule (copy)
				local responseBody = p5.responseBody
				
				if responseBody == nil or responseBody.canVote == nil or responseBody.reasonForNotVoteable == nil then
					logging.warn("Response from GetUserGameVotes is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local userVote = responseBody.userVote
				local var5 = if userVote == true then voteStatusModule.VotedUp elseif userVote == false then voteStatusModule.VotedDown elseif userVote == nil then voteStatusModule.NotVoted else nil
				
				if var5 then
					p4:dispatch(setUserGameVotesModule(p3, responseBody.canVote, var5, responseBody.reasonForNotVoteable))
				else
					logging.warn("Response from GetUserGameVotes is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				return promiseModule.resolve(p5)
			end, function(p6) --[[ line: 53 ]]
				-- upvalues: p4 (ref), setNetworkingErrorToast (copy), promiseModule (copy)
				p4:dispatch(setNetworkingErrorToast(p6))
				
				return promiseModule.reject(p6)
			end)
		end)
	end,
	GetFetchingStatus = function(p7, p8) --[[ line: 60 ]]
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p7, "luaapp.gamesapi.user-game-votes" .. p8)
	end
}