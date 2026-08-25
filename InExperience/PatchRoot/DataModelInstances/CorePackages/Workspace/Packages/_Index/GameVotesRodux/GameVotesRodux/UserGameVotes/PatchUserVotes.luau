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

local function getNewGameVotes(p0, p1, p2)
	-- upvalues: voteStatusModule (ref)
	if p1 == p2 then
		return p0
	end
	local upVotes = p0 and p0.upVotes
	local downVotes = p0 and p0.downVotes
	
	if p2 == voteStatusModule.VotedUp then
		upVotes += 1
		
		if p1 == voteStatusModule.VotedDown then
			downVotes -= 1
		end
	elseif p2 == voteStatusModule.VotedDown then
		downVotes += 1
		
		if p1 == voteStatusModule.VotedUp then
			upVotes -= 1
		end
	elseif p2 == voteStatusModule.NotVoted then
		if p1 == voteStatusModule.VotedUp then
			upVotes -= 1
		elseif p1 == voteStatusModule.VotedDown then
			downVotes -= 1
		end
	end
	return { upVotes = upVotes, downVotes = downVotes }
end

local function _(p3)
	-- upvalues: statusCodes (ref)
	return p3 and (p3.HttpError == Enum.HttpError.OK and p3.StatusCode == statusCodes.TOO_MANY_REQUESTS)
end

local function isPlayGameError(p4)
	-- upvalues: statusCodes (ref), httpService (ref)
	if p4 and p4.HttpError == Enum.HttpError.OK and p4.StatusCode == statusCodes.FORBIDDEN then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p4 (ref)
			return httpService:JSONDecode(p4.Body)
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

local _ = function(p5)
	return "luaapp.gamesapi.patch-user-votes" .. p5
end

return {
	getNewGameVotes = getNewGameVotes,
	Patch = function(p6, p7, p8, p9)
		-- upvalues: promiseModule (ref), performFetch (ref), gamesPatchUserVotesModule (ref), getNewGameVotes (ref), setGameVotesModule (ref), setUserGameVotesModule (ref), statusCodes (ref), reasonForNotVoteableModule (ref), setCurrentToastMessage (ref), toastType (ref), isPlayGameError (ref), setNetworkingErrorToast (ref)
		assert(type(p7) == "string", string.format("PatchUserVotes thunk expects universeId to be a string, was %s", type(p7)))
		assert(type(p8) == "string", string.format("PatchUserVotes thunk expects vote to be a string, was %s", type(p8)))
		assert(type(p9) == "string", string.format("PatchUserVotes thunk expects curVote to be a string, was %s", type(p9)))
		
		return if p8 == p9 then promiseModule.resolve() else performFetch.Single("luaapp.gamesapi.patch-user-votes" .. p7, function(p10)
			-- upvalues: gamesPatchUserVotesModule (copy), p6 (ref), p7 (ref), p8 (ref), getNewGameVotes (copy), p9 (ref), setGameVotesModule (copy), setUserGameVotesModule (copy), promiseModule (copy), statusCodes (copy), reasonForNotVoteableModule (copy), setCurrentToastMessage (copy), toastType (copy), isPlayGameError (copy), setNetworkingErrorToast (copy)
			return gamesPatchUserVotesModule(p6, p7, p8):andThen(function(p11)
				-- upvalues: p10 (ref), p7 (copy), getNewGameVotes (copy), p9 (copy), p8 (copy), setGameVotesModule (copy), setUserGameVotesModule (copy), promiseModule (copy)
				local var12 = getNewGameVotes(p10:getState().GameVotes[p7], p9, p8)
				p10:dispatch(setGameVotesModule(p7, var12.upVotes, var12.downVotes))
				p10:dispatch(setUserGameVotesModule(p7, true, p8, ""))
				
				return promiseModule.resolve(p11)
			end, function(p12)
				-- upvalues: statusCodes (copy), p10 (ref), setUserGameVotesModule (copy), p7 (copy), p9 (copy), reasonForNotVoteableModule (copy), setCurrentToastMessage (copy), toastType (copy), promiseModule (copy), isPlayGameError (copy), setNetworkingErrorToast (copy)
				if p12 and (p12.HttpError == Enum.HttpError.OK and p12.StatusCode == statusCodes.TOO_MANY_REQUESTS) then
					p10:dispatch(setUserGameVotesModule(p7, false, p9, reasonForNotVoteableModule.FloodCheckThresholdMet))
					p10:dispatch(setCurrentToastMessage({
						toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet",
						toastType = toastType.NetworkingError
					}))
					
					return promiseModule.reject(p12)
				elseif isPlayGameError(p12) then
					p10:dispatch(setUserGameVotesModule(p7, false, p9, reasonForNotVoteableModule.PlayGame))
					p10:dispatch(setCurrentToastMessage({
						toastMessage = "Feature.Toast.VoteError.PlayGame",
						toastType = toastType.NetworkingError
					}))
					
					return promiseModule.reject(p12)
				end
				p10:dispatch(setNetworkingErrorToast(p12))
				
				return promiseModule.reject(p12)
			end)
		end)
	end,
	GetPatchingStatus = function(p13, p14)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p13, "luaapp.gamesapi.patch-user-votes" .. p14)
	end
}