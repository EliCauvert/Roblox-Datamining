local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local NavigationEvents = require(CorePackages.Packages.RoactNavigation).NavigationEvents

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), RoactAnalyticsModule (copy), ReactModule (copy), NavigationEvents (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactAnalyticsModule)
	
	local function sendEventLog()
		-- upvalues: UseRoactServiceModuleResult (copy), p1 (copy)
		UseRoactServiceModuleResult.EventStream:sendEventDeferred(p1.eventContext, p1.eventName, p1.additionalArgs)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRoactServiceModuleResult (copy)
		if p1.when == "OnMount" then
			UseRoactServiceModuleResult.EventStream:sendEventDeferred(p1.eventContext, p1.eventName, p1.additionalArgs)
		end
	end, {})
	
	return if p1.when == "OnFocus" then ReactModule.createElement(NavigationEvents, { onDidFocus = sendEventLog }) else nil
end