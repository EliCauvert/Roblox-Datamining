local CorePackages = game:GetService("CorePackages")
local PageHeartbeatFunction = require(CorePackages.Workspace.Packages.Analytics).Events.pageHeartbeat
local UserInteractionsFunction = require(CorePackages.Workspace.Packages.Analytics).Events.userInteractions
local RoactAnalyticsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactAnalytics)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), PageHeartbeatFunction (copy), UserInteractionsFunction (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		return {
			reportPageHeartbeat = function(p2, p3)
				-- upvalues: PageHeartbeatFunction (upval), GetResult (copy)
				PageHeartbeatFunction(GetResult.EventStream, p2, p3)
			end,
			reportPageChanged = function()
				-- upvalues: UserInteractionsFunction (upval), GetResult (copy)
				UserInteractionsFunction(GetResult.EventStream, "luaPage")
			end
		}
	end
}