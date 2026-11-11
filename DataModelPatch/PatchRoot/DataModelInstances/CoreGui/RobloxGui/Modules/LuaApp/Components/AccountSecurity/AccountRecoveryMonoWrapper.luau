local LaunchAppModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Authentication.LaunchApp)
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AccountRecoveryContainer = require(CorePackages.Workspace.Packages.AccountRecovery).Components.AccountRecoveryContainer

return function()
	-- upvalues: ReactModule (copy), AccountRecoveryContainer (copy), LaunchAppModule (copy)
	return ReactModule.createElement(AccountRecoveryContainer, { monoDeps = { LaunchApp = LaunchAppModule } })
end