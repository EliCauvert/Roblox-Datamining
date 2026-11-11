local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TelemetryService = game:GetService("TelemetryService")
local DeviceLevelThemeKey = require(script.Parent.DeviceSettingsPageContentConstants).DeviceLevelThemeKey
local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local SystemThemeService = SystemThemeFeatureModule.GetSystemThemeService()
local SystemThemeEnum = SystemThemeFeatureModule.GetSystemThemeEnum()
local DeviceLevelThemeAnalyticsModule = require(Modules.LuaApp.Components.EventReceivers.Analytics.DeviceLevelThemeAnalytics)
local Logger = require(game:GetService("CorePackages").Workspace.Packages.Loggers).Logger
local GetSystemThemeModule = require(Modules.LuaApp.Components.EventReceivers.GetSystemTheme)

return function(Dark, p1)
	-- upvalues: SystemThemeService (copy), SystemThemeEnum (copy), TelemetryService (copy), DeviceLevelThemeAnalyticsModule (copy), DeviceLevelThemeKey (copy), GetSystemThemeModule (copy), Logger (copy)
	local P1 = p1 or {}
	local SystemThemeService1 = P1.systemThemeService or SystemThemeService
	local SystemThemeEnum1 = P1.systemThemeEnum or SystemThemeEnum
	local TelemetryService1 = P1.telemetryService or TelemetryService
	local DeviceLevelThemeAnalyticsClass = P1.deviceLevelThemeAnalyticsClass or DeviceLevelThemeAnalyticsModule
	local SystemThemeModule = (if Dark == DeviceLevelThemeKey.System then SystemThemeService1 and GetSystemThemeModule(SystemThemeService1) elseif Dark == DeviceLevelThemeKey.Light then SystemThemeEnum1 and SystemThemeEnum1.Light else Dark == DeviceLevelThemeKey.Dark and (SystemThemeEnum1 and SystemThemeEnum1.Dark)) or nil
	Logger:info("The user selected theme: " .. Dark .. ". Setting theme to: " .. tostring(SystemThemeModule))
	
	if SystemThemeModule then
		DeviceLevelThemeAnalyticsClass.new(TelemetryService1):onThemeChanged(SystemThemeModule)
	end
	if SystemThemeService1 and SystemThemeModule then
		SystemThemeService1:setTheme(SystemThemeModule)
	end
end