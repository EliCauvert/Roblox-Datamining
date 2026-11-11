local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local GetRobuxBadgeModule = require(Modules.LuaApp.Http.Requests.GetRobuxBadge)
local PromiseModule = require(Modules.LuaApp.Promise)

return function(p1)
	-- upvalues: PerformFetch (copy), GetRobuxBadgeModule (copy), PromiseModule (copy)
	return PerformFetch.Single("FetchRobuxBadge", function(_)
		-- upvalues: GetRobuxBadgeModule (upval), p1 (copy), PromiseModule (upval)
		return GetRobuxBadgeModule(p1):andThen(function(Entry)
			-- upvalues: PromiseModule (upval)
			return if Entry then PromiseModule.resolve(Entry[1]) else PromiseModule.resolve()
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end)
end