local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetGameBadgesModule = require(Modules.LuaApp.Actions.SetGameBadges)
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local BadgesGetBadgesModule = require(Modules.LuaApp.Http.Requests.BadgesGetBadges)

return function(p1, Text)
	-- upvalues: PerformFetch (copy), BadgesGetBadgesModule (copy), SetGameBadgesModule (copy), PromiseModule (copy)
	return PerformFetch.Single("ApiFetchGameBadges" .. Text, function(p2)
		-- upvalues: BadgesGetBadgesModule (upval), p1 (copy), Text (copy), SetGameBadgesModule (upval), PromiseModule (upval)
		return BadgesGetBadgesModule(p1, Text):andThen(function(Result)
			-- upvalues: p2 (copy), SetGameBadgesModule (upval), Text (upval), PromiseModule (upval)
			p2:dispatch(SetGameBadgesModule(Text, Result.responseBody.data))
			
			return PromiseModule.resolve(Result)
		end)
	end)
end