local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local LoginV2Container = require(CorePackages.Workspace.Packages.LoginV2.Components).LoginV2Container

return function()
	-- upvalues: ReactModule (copy), LoginV2Container (copy), LaunchAppModule (copy), ResetAppStateModule (copy), LogoutModule (copy)
	return ReactModule.createElement(LoginV2Container, {
		monoDeps = {
			LaunchApp = LaunchAppModule,
			ResetAppState = ResetAppStateModule,
			Logout = LogoutModule
		}
	})
end