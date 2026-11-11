local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local PageHeartbeatTimerModule = require(Modules.LuaApp.Components.Analytics.PageHeartbeatTimer)
local AppPageModule = require(Modules.LuaApp.AppPage)
local RoactAnalyticsAppRouterModule = require(Modules.LuaApp.Services.RoactAnalyticsAppRouter)
local RoactServices = require(game:GetService("CorePackages").Workspace.Packages.RoactServices).RoactServices
local RouterAnalyticsReporter = RoactModule.Component:extend("RouterAnalyticsReporter")

function RouterAnalyticsReporter.render(p1)
	-- upvalues: AppPageModule (copy), RoactModule (copy), PageHeartbeatTimerModule (copy)
	local CurrentPage = p1.props.currentPage
	
	return CurrentPage and (CurrentPage ~= AppPageModule.None and RoactModule.createElement(PageHeartbeatTimerModule, { currentPageGoal = CurrentPage }))
end

function RouterAnalyticsReporter.didUpdate(p1, p2)
	local CurrentPage = p1.props.currentPage
	local Analytics = p1.props.analytics
	
	if CurrentPage ~= p2.currentPage and Analytics then
		Analytics.reportPageChanged(CurrentPage)
	end
end

return RoactServices.connect({ analytics = RoactAnalyticsAppRouterModule })(RouterAnalyticsReporter)