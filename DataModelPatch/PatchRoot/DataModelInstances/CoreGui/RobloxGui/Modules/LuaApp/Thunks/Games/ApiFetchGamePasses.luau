local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetGamePassesModule = require(Modules.LuaApp.Actions.Games.SetGamePasses)
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local ApiFetchPassesThumbnailsModule = require(Modules.LuaApp.Thunks.ApiFetchPassesThumbnails)
local GamePassesListByUniverseModule = require(Modules.LuaApp.Http.Requests.GamePassesHttpService.GamePassesListByUniverse)

return function(p1, Text)
	-- upvalues: PerformFetch (copy), GamePassesListByUniverseModule (copy), SetGamePassesModule (copy), ApiFetchPassesThumbnailsModule (copy), PromiseModule (copy)
	return PerformFetch.Single("ApiFetchGamePasses" .. Text, function(p2)
		-- upvalues: GamePassesListByUniverseModule (upval), p1 (copy), Text (copy), SetGamePassesModule (upval), ApiFetchPassesThumbnailsModule (upval), PromiseModule (upval)
		return GamePassesListByUniverseModule(p1, Text):andThen(function(Result)
			-- upvalues: p2 (copy), SetGamePassesModule (upval), Text (upval), ApiFetchPassesThumbnailsModule (upval), p1 (upval), PromiseModule (upval)
			local GamePasses = Result.responseBody.gamePasses
			p2:dispatch(SetGamePassesModule(Text, GamePasses))
			
			if #GamePasses > 0 then
				local Ids = {}
				
				for _, gamePass in ipairs(GamePasses) do
					table.insert(Ids, gamePass.id)
				end
				p2:dispatch(ApiFetchPassesThumbnailsModule(p1, Ids))
			end
			return PromiseModule.resolve(Result)
		end)
	end)
end