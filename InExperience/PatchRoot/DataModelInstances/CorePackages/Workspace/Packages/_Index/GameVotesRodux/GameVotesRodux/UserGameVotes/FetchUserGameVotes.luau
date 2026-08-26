local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local parent = gameVotesRodux.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local logging = require(parent.AppCommonLib).Logging
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local getUserGameVotesModule = require(gameVotesRodux.UserGameVotes.GetUserGameVotes)
local setUserGameVotesModule = require(gameVotesRodux.UserGameVotes.SetUserGameVotes)
local voteStatusModule = require(gameVotesRodux.Enums.VoteStatus)

local function _(p1)
	-- upvalues: voteStatusModule (ref)
	return if p1 == true then voteStatusModule.VotedUp elseif p1 == false then voteStatusModule.VotedDown elseif p1 == nil then voteStatusModule.NotVoted else nil
end

local _ = function(p1)
	return "luaapp.gamesapi.user-game-votes" .. p1
end

return {
	Fetch = function(p1, p2)
		-- upvalues: performFetch (ref), getUserGameVotesModule (ref), voteStatusModule (ref), setUserGameVotesModule (ref), logging (ref), promiseModule (ref), setNetworkingErrorToast (ref)
		assert(type(p2) == "string", string.format("FetchUserGameVotes thunk expects universeId to be a string, was %s", type(p2)))
		
		return performFetch.Single("luaapp.gamesapi.user-game-votes" .. p3, function(p3)
			-- upvalues: getUserGameVotesModule (copy), p1 (ref), p2 (ref), voteStatusModule (copy), setUserGameVotesModule (copy), logging (copy), promiseModule (copy), setNetworkingErrorToast (copy)
			return getUserGameVotesModule(p1, p2):andThen(function(p4)
				-- upvalues: voteStatusModule (copy), p3 (ref), setUserGameVotesModule (copy), p2 (copy), logging (copy), promiseModule (copy)
				local responseBody = p4.responseBody
				
				if responseBody == nil or responseBody.canVote == nil or responseBody.reasonForNotVoteable == nil then
					logging.warn("Response from GetUserGameVotes is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local userVote = responseBody.userVote
				local var1 = if userVote == true then voteStatusModule.VotedUp elseif userVote == false then voteStatusModule.VotedDown elseif userVote == nil then voteStatusModule.NotVoted else nil
				
				if var1 then
					p3:dispatch(setUserGameVotesModule(p2, responseBody.canVote, var1, responseBody.reasonForNotVoteable))
				else
					logging.warn("Response from GetUserGameVotes is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				return promiseModule.resolve(p4)
			end, function(p4)
				-- upvalues: p3 (ref), setNetworkingErrorToast (copy), promiseModule (copy)
				p3:dispatch(setNetworkingErrorToast(p4))
				
				return promiseModule.reject(p4)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, p2)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p1, "luaapp.gamesapi.user-game-votes" .. p8)
	end
}