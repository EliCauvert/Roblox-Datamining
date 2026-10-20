local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactAnalyticsModule = require(script.Parent.RoactAnalytics)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local ButtonClickModule = require(Modules.LuaApp.Analytics.Events.buttonClick)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), ArgCheckModule (copy), ButtonClickModule (copy)
		local EventStream = RoactAnalyticsModule.get(p1).EventStream
		
		return {
			ButtonActivated = function(p2, p3)
				-- upvalues: ArgCheckModule (upval), ButtonClickModule (upval), EventStream (copy)
				ArgCheckModule.isType(p2, "string", "associatedPageType")
				ArgCheckModule.isType(p3, "string", "currentPage")
				ButtonClickModule(EventStream, "BottomBarButton", p2, p3)
			end
		}
	end
}