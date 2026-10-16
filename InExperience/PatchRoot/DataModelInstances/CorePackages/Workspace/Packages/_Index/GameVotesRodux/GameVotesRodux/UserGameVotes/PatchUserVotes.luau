local HttpService = game:GetService("HttpService")
local GameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local Parent = GameVotesRodux.Parent
local PromiseModule = require(Parent.Promise)
local StatusCodes = require(Parent.Http).StatusCodes
local ReasonForNotVoteableModule = require(GameVotesRodux.Enums.ReasonForNotVoteable)
local VoteStatusModule = require(GameVotesRodux.Enums.VoteStatus)
local SetUserGameVotesModule = require(GameVotesRodux.UserGameVotes.SetUserGameVotes)
local GamesPatchUserVotesModule = require(GameVotesRodux.UserGameVotes.GamesPatchUserVotes)
local ToastType = require(Parent.ToastRodux).Enums.ToastType
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local SetGameVotesModule = require(GameVotesRodux.GameVotes.SetGameVotes)
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local PerformFetch = require(Parent.Http).PerformFetch

local function getNewGameVotes(NewGameVotes, VotedDown, NotVoted) --[[ Line: 19 ]]
	-- upvalues: VoteStatusModule (copy)
	if VotedDown == NotVoted then
		return NewGameVotes
	end
	local UpVotes = NewGameVotes and NewGameVotes.upVotes
	local DownVotes = NewGameVotes and NewGameVotes.downVotes
	
	if NotVoted == VoteStatusModule.VotedUp then
		UpVotes += 1
		
		if VotedDown == VoteStatusModule.VotedDown then
			DownVotes -= 1
		end
	elseif NotVoted == VoteStatusModule.VotedDown then
		DownVotes += 1
		
		if VotedDown == VoteStatusModule.VotedUp then
			UpVotes -= 1
		end
	elseif NotVoted == VoteStatusModule.NotVoted then
		if VotedDown == VoteStatusModule.VotedUp then
			UpVotes -= 1
		elseif VotedDown == VoteStatusModule.VotedDown then
			DownVotes -= 1
		end
	end
	return { upVotes = UpVotes, downVotes = DownVotes }
end

local function _(p1): boolean --[[ Line: 50 | Named "isTooManyRequestsError" ]]
	-- upvalues: StatusCodes (copy)
	return p1 and (p1.HttpError == Enum.HttpError.OK and p1.StatusCode == StatusCodes.TOO_MANY_REQUESTS)
end

local function isPlayGameError(p1): boolean --[[ Line: 54 ]]
	-- upvalues: StatusCodes (copy), HttpService (copy)
	if p1 and p1.HttpError == Enum.HttpError.OK and p1.StatusCode == StatusCodes.FORBIDDEN then
		local Success, Result = pcall(function() --[[ Line: 56 ]]
			-- upvalues: HttpService (upval), p1 (copy)
			return HttpService:JSONDecode(p1.Body)
		end)
		
		if Success and Result and Result.errors then
			for _, _error in ipairs(Result.errors) do
				if _error.code == 6 then
					return true
				end
			end
		end
	end
	return false
end

local _ = function(Text): string --[[ Line: 70 | Named "fetchKeymapper" ]]
	return "luaapp.gamesapi.patch-user-votes" .. Text
end

return {
	getNewGameVotes = getNewGameVotes,
	Patch = function(p2, Text, p3, VotedDown) --[[ Line: 78 ]]
		-- upvalues: PromiseModule (copy), PerformFetch (copy), GamesPatchUserVotesModule (copy), getNewGameVotes (copy), SetGameVotesModule (copy), SetUserGameVotesModule (copy), StatusCodes (copy), ReasonForNotVoteableModule (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), isPlayGameError (copy), SetNetworkingErrorToastFunction (copy)
		assert(type(Text) == "string", string.format("PatchUserVotes thunk expects universeId to be a string, was %s", (type(Text))))
		assert(type(p3) == "string", string.format("PatchUserVotes thunk expects vote to be a string, was %s", (type(p3))))
		assert(type(VotedDown) == "string", string.format("PatchUserVotes thunk expects curVote to be a string, was %s", (type(VotedDown))))
		
		return if p3 == VotedDown then PromiseModule.resolve() else PerformFetch.Single("luaapp.gamesapi.patch-user-votes" .. Text, function(p4) --[[ Line: 97 ]]
			-- upvalues: GamesPatchUserVotesModule (upval), p2 (copy), Text (copy), p3 (copy), getNewGameVotes (upval), VotedDown (copy), SetGameVotesModule (upval), SetUserGameVotesModule (upval), PromiseModule (upval), StatusCodes (upval), ReasonForNotVoteableModule (upval), SetCurrentToastMessageFunction (upval), ToastType (upval), isPlayGameError (upval), SetNetworkingErrorToastFunction (upval)
			return GamesPatchUserVotesModule(p2, Text, p3):andThen(function(Result) --[[ Line: 98 ]]
				-- upvalues: p4 (copy), Text (upval), getNewGameVotes (upval), VotedDown (upval), p3 (upval), SetGameVotesModule (upval), SetUserGameVotesModule (upval), PromiseModule (upval)
				local NewGameVotes = getNewGameVotes(p4:getState().GameVotes[Text], VotedDown, p3)
				p4:dispatch(SetGameVotesModule(Text, NewGameVotes.upVotes, NewGameVotes.downVotes))
				p4:dispatch(SetUserGameVotesModule(Text, true, p3, ""))
				
				return PromiseModule.resolve(Result)
			end, function(p5) --[[ Line: 105 ]]
				-- upvalues: StatusCodes (upval), p4 (copy), SetUserGameVotesModule (upval), Text (upval), VotedDown (upval), ReasonForNotVoteableModule (upval), SetCurrentToastMessageFunction (upval), ToastType (upval), PromiseModule (upval), isPlayGameError (upval), SetNetworkingErrorToastFunction (upval)
				if p5 and (p5.HttpError == Enum.HttpError.OK and p5.StatusCode == StatusCodes.TOO_MANY_REQUESTS) then
					p4:dispatch(SetUserGameVotesModule(Text, false, VotedDown, ReasonForNotVoteableModule.FloodCheckThresholdMet))
					p4:dispatch(SetCurrentToastMessageFunction({
						toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet",
						toastType = ToastType.NetworkingError
					}))
					
					return PromiseModule.reject(p5)
				elseif isPlayGameError(p5) then
					p4:dispatch(SetUserGameVotesModule(Text, false, VotedDown, ReasonForNotVoteableModule.PlayGame))
					p4:dispatch(SetCurrentToastMessageFunction({
						toastMessage = "Feature.Toast.VoteError.PlayGame",
						toastType = ToastType.NetworkingError
					}))
					
					return PromiseModule.reject(p5)
				else
					p4:dispatch(SetNetworkingErrorToastFunction(p5))
					
					return PromiseModule.reject(p5)
				end
			end)
		end)
	end,
	GetPatchingStatus = function(p2, Text) --[[ Line: 129 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p2, "luaapp.gamesapi.patch-user-votes" .. Text)
	end
}