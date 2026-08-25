local gameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local parent = gameVotesRodux.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local logging = require(parent.AppCommonLib).Logging
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local setGameVotesModule = require(gameVotesRodux.GameVotes.SetGameVotes)
local getGameVotesModule = require(gameVotesRodux.GameVotes.GetGameVotes)

local function _(p0)
	return "luaapp.gamesapi.game-votes" .. p0
end

return {
	Fetch = function(p1, p2)
		-- upvalues: performFetch (ref), getGameVotesModule (ref), setGameVotesModule (ref), promiseModule (ref), logging (ref), setNetworkingErrorToast (ref)
		assert(type(p2) == "string", string.format("FetchGameVotes thunk expects universeId to be a string, was %s", type(p2)))
		
		return performFetch.Single("luaapp.gamesapi.game-votes" .. p2, function(p3)
			-- upvalues: getGameVotesModule (copy), p1 (ref), p2 (ref), setGameVotesModule (copy), promiseModule (copy), logging (copy), setNetworkingErrorToast (copy)
			return getGameVotesModule(p1, p2):andThen(function(p4)
				-- upvalues: p3 (ref), setGameVotesModule (copy), p2 (copy), promiseModule (copy), logging (copy)
				local responseBody = p4.responseBody
				
				if responseBody == nil or responseBody.upVotes == nil or responseBody.downVotes == nil then
					logging.warn("Response from GetGameVotes is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				p3:dispatch(setGameVotesModule(p2, if responseBody.upVotes < 0 then 0 else responseBody.upVotes, if responseBody.downVotes < 0 then 0 else responseBody.downVotes))
				
				return promiseModule.resolve(p4)
			end, function(p5)
				-- upvalues: p3 (ref), setNetworkingErrorToast (copy), promiseModule (copy)
				p3:dispatch(setNetworkingErrorToast(p5))
				
				return promiseModule.reject(p5)
			end)
		end)
	end,
	GetFetchingStatus = function(p6, p7)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p6, "luaapp.gamesapi.game-votes" .. p7)
	end
}