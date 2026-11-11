local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local ResetAppStateModule = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local MultiPageSignupContainer = require(CorePackages.Workspace.Packages.MultiPageSignup).Components.MultiPageSignupContainer

return function()
	-- upvalues: ReactModule (copy), MultiPageSignupContainer (copy), LaunchAppModule (copy), ResetAppStateModule (copy), LogoutModule (copy)
	return ReactModule.createElement(MultiPageSignupContainer, {
		monoDeps = {
			LaunchApp = LaunchAppModule,
			ResetAppState = ResetAppStateModule,
			Logout = LogoutModule
		}
	})
end