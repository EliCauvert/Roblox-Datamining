local GameVotesRodux = script:FindFirstAncestor("GameVotesRodux")
local Parent = GameVotesRodux.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch
local Logging = require(Parent.AppCommonLib).Logging
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local SetGameVotesModule = require(GameVotesRodux.GameVotes.SetGameVotes)
local GetGameVotesModule = require(GameVotesRodux.GameVotes.GetGameVotes)

local function _(Text): string --[[ Line: 12 | Named "fetchKeymapper" ]]
	return "luaapp.gamesapi.game-votes" .. Text
end

return {
	Fetch = function(p1, Text) --[[ Line: 16 ]]
		-- upvalues: PerformFetch (copy), GetGameVotesModule (copy), SetGameVotesModule (copy), PromiseModule (copy), Logging (copy), SetNetworkingErrorToastFunction (copy)
		assert(type(Text) == "string", string.format("FetchGameVotes thunk expects universeId to be a string, was %s", (type(Text))))
		
		return PerformFetch.Single("luaapp.gamesapi.game-votes" .. Text, function(p2) --[[ Line: 22 ]]
			-- upvalues: GetGameVotesModule (upval), p1 (copy), Text (copy), SetGameVotesModule (upval), PromiseModule (upval), Logging (upval), SetNetworkingErrorToastFunction (upval)
			return GetGameVotesModule(p1, Text):andThen(function(Result) --[[ Line: 23 ]]
				-- upvalues: p2 (copy), SetGameVotesModule (upval), Text (upval), PromiseModule (upval), Logging (upval)
				local ResponseBody = Result.responseBody
				
				if ResponseBody == nil or ResponseBody.upVotes == nil or ResponseBody.downVotes == nil then
					Logging.warn("Response from GetGameVotes is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				else
					p2:dispatch(SetGameVotesModule(Text, if ResponseBody.upVotes < 0 then 0 else ResponseBody.upVotes, if ResponseBody.downVotes < 0 then 0 else ResponseBody.downVotes))
					
					return PromiseModule.resolve(Result)
				end
			end, function(p3) --[[ Line: 39 ]]
				-- upvalues: p2 (copy), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
				p2:dispatch(SetNetworkingErrorToastFunction(p3))
				
				return PromiseModule.reject(p3)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text) --[[ Line: 46 ]]
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.gamesapi.game-votes" .. Text)
	end
}