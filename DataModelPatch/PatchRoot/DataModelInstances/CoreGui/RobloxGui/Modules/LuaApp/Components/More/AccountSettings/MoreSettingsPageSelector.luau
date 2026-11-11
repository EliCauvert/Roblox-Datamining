local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local VRSettingsModule = require(Modules.LuaApp.Components.More.VRSettings)
local SettingsPageModule = require(Modules.LuaApp.Components.More.AccountSettings.SettingsPage)

return function(p1)
	-- upvalues: UseIsSpatialFunction (copy), ReactModule (copy), VRSettingsModule (copy), SettingsPageModule (copy)
	return if UseIsSpatialFunction() then ReactModule.createElement(VRSettingsModule, p1) else ReactModule.createElement(SettingsPageModule, p1)
end