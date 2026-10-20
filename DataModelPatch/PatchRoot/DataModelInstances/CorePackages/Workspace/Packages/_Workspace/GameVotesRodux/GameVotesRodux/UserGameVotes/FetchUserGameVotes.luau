local GameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local Parent = GameVotesRodux.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch
local Logging = require(Parent.AppCommonLib).Logging
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local GetUserGameVotesModule = require(GameVotesRodux.UserGameVotes.GetUserGameVotes)
local SetUserGameVotesModule = require(GameVotesRodux.UserGameVotes.SetUserGameVotes)
local VoteStatusModule = require(GameVotesRodux.Enums.VoteStatus)

local function _(Enabled)
	-- upvalues: VoteStatusModule (copy)
	return if Enabled == true then VoteStatusModule.VotedUp elseif Enabled == false then VoteStatusModule.VotedDown elseif Enabled == nil then VoteStatusModule.NotVoted else nil
end

local _ = function(Text): string
	return "luaapp.gamesapi.user-game-votes" .. Text
end

return {
	Fetch = function(p1, Text)
		-- upvalues: PerformFetch (copy), GetUserGameVotesModule (copy), VoteStatusModule (copy), SetUserGameVotesModule (copy), Logging (copy), PromiseModule (copy), SetNetworkingErrorToastFunction (copy)
		assert(type(Text) == "string", string.format("FetchUserGameVotes thunk expects universeId to be a string, was %s", (type(Text))))
		
		return PerformFetch.Single("luaapp.gamesapi.user-game-votes" .. Text, function(p2)
			-- upvalues: GetUserGameVotesModule (upval), p1 (copy), Text (copy), VoteStatusModule (upval), SetUserGameVotesModule (upval), Logging (upval), PromiseModule (upval), SetNetworkingErrorToastFunction (upval)
			return GetUserGameVotesModule(p1, Text):andThen(function(Result)
				-- upvalues: VoteStatusModule (upval), p2 (copy), SetUserGameVotesModule (upval), Text (upval), Logging (upval), PromiseModule (upval)
				local ResponseBody = Result.responseBody
				
				if ResponseBody == nil or ResponseBody.canVote == nil or ResponseBody.reasonForNotVoteable == nil then
					Logging.warn("Response from GetUserGameVotes is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local UserVote = ResponseBody.userVote
				local VotedUp = if UserVote == true then VoteStatusModule.VotedUp elseif UserVote == false then VoteStatusModule.VotedDown elseif UserVote == nil then VoteStatusModule.NotVoted else nil
				
				if not VotedUp then
					Logging.warn("Response from GetUserGameVotes is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				p2:dispatch(SetUserGameVotesModule(Text, ResponseBody.canVote, VotedUp, ResponseBody.reasonForNotVoteable))
				return PromiseModule.resolve(Result)
			end, function(p3)
				-- upvalues: p2 (copy), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
				p2:dispatch(SetNetworkingErrorToastFunction(p3))
				
				return PromiseModule.reject(p3)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.gamesapi.user-game-votes" .. Text)
	end
}