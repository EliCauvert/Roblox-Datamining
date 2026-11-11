local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(game:GetService("CorePackages").Workspace.Packages.TenFootUiCommon)

return {
	LuaAppEvents = require(Modules.LuaApp.LuaAppEvents),
	RoactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics),
	RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking),
	buttonClick = require(Modules.LuaApp.Analytics.Events.buttonClick),
	globalNavConfig = require(script.Parent.globalNavConfig),
	useRoactService = require(Modules.LuaApp.Hooks.useRoactService),
	AppPage = require(Modules.LuaApp.AppPage),
	SetTopBarHeight = require(Modules.LuaApp.Actions.SetTopBarHeight),
	LoginStatus = require(Modules.LuaApp.Enum.LoginStatus),
	RootNavigator = require(Modules.LuaApp.Navigation.RootNavigator)
}