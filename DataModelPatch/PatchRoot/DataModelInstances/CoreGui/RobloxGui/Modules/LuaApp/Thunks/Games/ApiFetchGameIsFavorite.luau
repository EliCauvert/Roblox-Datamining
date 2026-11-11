local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local GameGetIsFavoriteModule = require(Modules.LuaApp.Http.Requests.GamesApi.GameGetIsFavorite)
local SetGameFavoriteModule = require(Modules.LuaApp.Actions.Games.SetGameFavorite)

return function(p1, p2: string)
	-- upvalues: GameGetIsFavoriteModule (copy), SetGameFavoriteModule (copy), Logging (copy), PromiseModule (copy)
	if type(p2) ~= "string" then
		error("ApiFetchGameIsFavorite thunk expects universeId to be a string")
	end
	return function(p3)
		-- upvalues: GameGetIsFavoriteModule (upval), p1 (copy), p2 (copy), SetGameFavoriteModule (upval), Logging (upval), PromiseModule (upval)
		return GameGetIsFavoriteModule(p1, p2):andThen(function(Result)
			-- upvalues: p3 (copy), SetGameFavoriteModule (upval), p2 (upval), Logging (upval), PromiseModule (upval)
			local ResponseBody = Result.responseBody
			
			if ResponseBody == nil or ResponseBody.isFavorited == nil then
				Logging.warn("Response from GameGetIsFavorite is malformed!")
				
				return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
			else
				p3:dispatch(SetGameFavoriteModule(p2, ResponseBody.isFavorited))
				
				return Result
			end
		end)
	end
end