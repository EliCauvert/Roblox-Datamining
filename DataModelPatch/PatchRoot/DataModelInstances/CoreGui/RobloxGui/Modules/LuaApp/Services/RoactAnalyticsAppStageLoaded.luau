local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppStageLoadedModule = require(Modules.LuaApp.Analytics.Events.appStageLoaded)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), AppStageLoadedModule (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		return {
			reportAppReady = function(p2)
				-- upvalues: AppStageLoadedModule (upval), GetResult (copy)
				AppStageLoadedModule(GetResult.EventStream, p2, "appReady")
			end
		}
	end
}