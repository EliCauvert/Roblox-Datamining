local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local GamePostFavoriteModule = require(Modules.LuaApp.Http.Requests.GamesApi.GamePostFavorite)
local SetGameFavoriteModule = require(Modules.LuaApp.Actions.Games.SetGameFavorite)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch

local function GamePostFavorite(p1, Text: string, GameFavorite: boolean)
	-- upvalues: PerformFetch (copy), GamePostFavoriteModule (copy), GamePostFavorite (copy), PromiseModule (copy), SetGameFavoriteModule (copy), SetNetworkingErrorToastModule (copy)
	if type(Text) ~= "string" then
		error("GamePostFavorite thunk expects universeId to be a string")
	end
	if type(GameFavorite) ~= "boolean" then
		error("GamePostFavorite thunk expects isFavorited to be a boolean")
	end
	return PerformFetch.Single("GamePostFavorite" .. Text, function(p2)
		-- upvalues: GamePostFavoriteModule (upval), p1 (copy), Text (copy), GameFavorite (copy), GamePostFavorite (upval), PromiseModule (upval), SetGameFavoriteModule (upval), SetNetworkingErrorToastModule (upval)
		return GamePostFavoriteModule(p1, Text, GameFavorite):andThen(function(Result)
			-- upvalues: p2 (copy), Text (upval), GameFavorite (upval), GamePostFavorite (upval), p1 (upval), PromiseModule (upval)
			local GameFavorite1 = p2:getState().GameFavorites[Text]
			
			return if GameFavorite1 == GameFavorite then PromiseModule.resolve(Result) else GamePostFavorite(p1, Text, GameFavorite1)
		end, function(p3)
			-- upvalues: p2 (copy), SetGameFavoriteModule (upval), Text (upval), GameFavorite (upval), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p2:dispatch(SetGameFavoriteModule(Text, not GameFavorite))
			p2:dispatch(SetNetworkingErrorToastModule(p3))
			
			return PromiseModule.reject(p3)
		end)
	end)
end

return GamePostFavorite