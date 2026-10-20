local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AuthDeeplinkEventReceiver = require(CorePackages.Workspace.Packages.AuthCommon).EventReceivers.AuthDeeplinkEventReceiver

return function()
	-- upvalues: ReactModule (copy), AuthDeeplinkEventReceiver (copy), LaunchAppModule (copy), ResetAppStateModule (copy)
	return ReactModule.createElement(AuthDeeplinkEventReceiver, {
		monoDeps = {
			LaunchApp = LaunchAppModule,
			ResetAppState = ResetAppStateModule
		}
	})
end