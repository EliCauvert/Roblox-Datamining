local httpService = game:GetService("HttpService")
local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local parent = gameVotesRodux.Parent
local promiseModule = require(parent.Promise)
local statusCodes = require(parent.Http).StatusCodes
local reasonForNotVoteableModule = require(gameVotesRodux.Enums.ReasonForNotVoteable)
local voteStatusModule = require(gameVotesRodux.Enums.VoteStatus)
local setUserGameVotesModule = require(gameVotesRodux.UserGameVotes.SetUserGameVotes)
local gamesPatchUserVotesModule = require(gameVotesRodux.UserGameVotes.GamesPatchUserVotes)
local toastType = require(parent.ToastRodux).Enums.ToastType
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local setGameVotesModule = require(gameVotesRodux.GameVotes.SetGameVotes)
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local performFetch = require(parent.Http).PerformFetch

local function getNewGameVotes(p1, p2, p3)
	-- upvalues: voteStatusModule (ref)
	if p2 == p3 then
		return p1
	end
	local upVotes = p1 and p1.upVotes
	local downVotes = p1 and p1.downVotes
	
	if p3 == voteStatusModule.VotedUp then
		upVotes += 1
		
		if p2 == voteStatusModule.VotedDown then
			downVotes -= 1
		end
	elseif p3 == voteStatusModule.VotedDown then
		downVotes += 1
		
		if p2 == voteStatusModule.VotedUp then
			upVotes -= 1
		end
	elseif p3 == voteStatusModule.NotVoted then
		if p2 == voteStatusModule.VotedUp then
			upVotes -= 1
		elseif p2 == voteStatusModule.VotedDown then
			downVotes -= 1
		end
	end
	return { upVotes = upVotes, downVotes = downVotes }
end

local function _(p1)
	-- upvalues: statusCodes (ref)
	return p1 and (p1.HttpError == Enum.HttpError.OK and p1.StatusCode == statusCodes.TOO_MANY_REQUESTS)
end

local function isPlayGameError(p1)
	-- upvalues: statusCodes (ref), httpService (ref)
	if p1 and p1.HttpError == Enum.HttpError.OK and p1.StatusCode == statusCodes.FORBIDDEN then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p1 (ref)
			return httpService:JSONDecode(p1.Body)
		end)
		
		if ok and status and status.errors then
			for i, v in ipairs(status.errors) do
				if v.code == 6 then
					return true
				end
			end
		end
	end
	return false
end

local _ = function(p2)
	return "luaapp.gamesapi.patch-user-votes" .. p5
end

return {
	getNewGameVotes = getNewGameVotes,
	Patch = function(p2, p3, p4, p5)
		-- upvalues: promiseModule (ref), performFetch (ref), gamesPatchUserVotesModule (ref), getNewGameVotes (ref), setGameVotesModule (ref), setUserGameVotesModule (ref), statusCodes (ref), reasonForNotVoteableModule (ref), setCurrentToastMessage (ref), toastType (ref), isPlayGameError (ref), setNetworkingErrorToast (ref)
		assert(type(p3) == "string", string.format("PatchUserVotes thunk expects universeId to be a string, was %s", type(p3)))
		assert(type(p4) == "string", string.format("PatchUserVotes thunk expects vote to be a string, was %s", type(p4)))
		assert(type(p5) == "string", string.format("PatchUserVotes thunk expects curVote to be a string, was %s", type(p5)))
		
		return if p4 == p5 then promiseModule.resolve() else performFetch.Single("luaapp.gamesapi.patch-user-votes" .. p7, function(p6)
			-- upvalues: gamesPatchUserVotesModule (copy), p2 (ref), p3 (ref), p4 (ref), getNewGameVotes (copy), p5 (ref), setGameVotesModule (copy), setUserGameVotesModule (copy), promiseModule (copy), statusCodes (copy), reasonForNotVoteableModule (copy), setCurrentToastMessage (copy), toastType (copy), isPlayGameError (copy), setNetworkingErrorToast (copy)
			return gamesPatchUserVotesModule(p2, p3, p4):andThen(function(p7)
				-- upvalues: p6 (ref), p3 (copy), getNewGameVotes (copy), p5 (copy), p4 (copy), setGameVotesModule (copy), setUserGameVotesModule (copy), promiseModule (copy)
				local var1 = getNewGameVotes(p6:getState().GameVotes[p3], p5, p4)
				p6:dispatch(setGameVotesModule(p3, var1.upVotes, var1.downVotes))
				p6:dispatch(setUserGameVotesModule(p3, true, p4, ""))
				
				return promiseModule.resolve(p7)
			end, function(p7)
				-- upvalues: statusCodes (copy), p6 (ref), setUserGameVotesModule (copy), p3 (copy), p5 (copy), reasonForNotVoteableModule (copy), setCurrentToastMessage (copy), toastType (copy), promiseModule (copy), isPlayGameError (copy), setNetworkingErrorToast (copy)
				if p7 and (p7.HttpError == Enum.HttpError.OK and p7.StatusCode == statusCodes.TOO_MANY_REQUESTS) then
					p6:dispatch(setUserGameVotesModule(p3, false, p5, reasonForNotVoteableModule.FloodCheckThresholdMet))
					p6:dispatch(setCurrentToastMessage({
						toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet",
						toastType = toastType.NetworkingError
					}))
					
					return promiseModule.reject(p7)
				elseif isPlayGameError(p7) then
					p6:dispatch(setUserGameVotesModule(p3, false, p5, reasonForNotVoteableModule.PlayGame))
					p6:dispatch(setCurrentToastMessage({
						toastMessage = "Feature.Toast.VoteError.PlayGame",
						toastType = toastType.NetworkingError
					}))
					
					return promiseModule.reject(p7)
				end
				p6:dispatch(setNetworkingErrorToast(p7))
				
				return promiseModule.reject(p7)
			end)
		end)
	end,
	GetPatchingStatus = function(p2, p3)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p2, "luaapp.gamesapi.patch-user-votes" .. p14)
	end
}