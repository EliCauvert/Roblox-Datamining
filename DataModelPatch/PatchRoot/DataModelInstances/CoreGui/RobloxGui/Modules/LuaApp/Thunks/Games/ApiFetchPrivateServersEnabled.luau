local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local GameGetPrivateServersEnabledModule = require(Modules.LuaApp.Http.Requests.GamesApi.GameGetPrivateServersEnabled)
local SetGamePrivateServersEnabledModule = require(Modules.LuaApp.Actions.Games.SetGamePrivateServersEnabled)

return function(p1, p2: string)
	-- upvalues: GameGetPrivateServersEnabledModule (copy), SetGamePrivateServersEnabledModule (copy), PromiseModule (copy), Logging (copy)
	if type(p2) ~= "string" then
		error("ApiFetchPrivateServersEnabled thunk expects universeId to be a string")
	end
	return function(p3)
		-- upvalues: GameGetPrivateServersEnabledModule (upval), p1 (copy), p2 (copy), SetGamePrivateServersEnabledModule (upval), PromiseModule (upval), Logging (upval)
		return GameGetPrivateServersEnabledModule(p1, p2):andThen(function(Result)
			-- upvalues: p3 (copy), SetGamePrivateServersEnabledModule (upval), p2 (upval), PromiseModule (upval), Logging (upval)
			local ResponseBody = Result.responseBody
			
			if ResponseBody == nil or ResponseBody.privateServersEnabled == nil then
				Logging.warn("Response from GameGetPrivateServersEnabled is malformed!")
				
				return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
			else
				p3:dispatch(SetGamePrivateServersEnabledModule(p2, ResponseBody.privateServersEnabled))
				
				return PromiseModule.resolve(Result)
			end
		end)
	end
end