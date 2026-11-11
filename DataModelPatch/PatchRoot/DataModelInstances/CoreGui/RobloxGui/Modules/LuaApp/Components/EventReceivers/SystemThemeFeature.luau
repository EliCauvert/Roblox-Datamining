game:DefineFastFlag("SystemThemeLuaEnabled10", false)
local SystemThemeFeatureModule = {}

if game:GetFastFlag("SystemThemeLuaEnabled10") then
	local Utils = require(game:GetService("CorePackages").Workspace.Packages.SystemTheme).Utils
	SystemThemeFeatureModule.ClearThemeOverride = Utils.ClearThemeOverride
	SystemThemeFeatureModule.GetSystemThemeEnabled = Utils.GetSystemThemeEnabled
	SystemThemeFeatureModule.GetSystemThemeEnum = Utils.GetSystemThemeEnum
	SystemThemeFeatureModule.GetSystemThemeService = Utils.GetSystemThemeService
	SystemThemeFeatureModule.SetDarkThemeOverride = Utils.SetDarkThemeOverride
	SystemThemeFeatureModule.DeviceLevelThemeLocalStorageKey = "DeviceLevelTheme"
	
	return SystemThemeFeatureModule
else
	local MessageBusService = game:GetService("MessageBusService")
	local SystemThemeMessageId = MessageBusService:GetMessageId("SystemTheme", "systemThemeSetThemeOverride")
	local Modules = game:GetService("CoreGui").RobloxGui.Modules
	
	function SystemThemeFeatureModule.GetSystemThemeEnabled()
		return game:GetService("SystemThemeService") and game:GetService("SystemThemeService"):isSystemThemeAvailable()
	end
	
	function SystemThemeFeatureModule.GetSystemThemeService()
		return game:GetService("SystemThemeService") or nil
	end
	
	function SystemThemeFeatureModule.GetSystemThemeEnum()
		-- upvalues: Modules (copy)
		return game:GetService("SystemThemeService") and game:GetService("SystemThemeService"):isSystemThemeAvailable() and require(Modules.LuaApp.Components.EventReceivers.SystemThemeEnum) or nil
	end
	
	SystemThemeFeatureModule.DeviceLevelThemeLocalStorageKey = "DeviceLevelTheme"
	
	function SystemThemeFeatureModule.SetDarkThemeOverride()
		-- upvalues: SystemThemeFeatureModule (copy), MessageBusService (copy), SystemThemeMessageId (copy)
		if SystemThemeFeatureModule.GetSystemThemeEnabled() then
			MessageBusService:Publish(SystemThemeMessageId, { ThemeOverride = "dark" })
		end
	end
	
	function SystemThemeFeatureModule.ClearThemeOverride()
		-- upvalues: SystemThemeFeatureModule (copy), MessageBusService (copy), SystemThemeMessageId (copy)
		if SystemThemeFeatureModule.GetSystemThemeEnabled() then
			MessageBusService:Publish(SystemThemeMessageId, { ThemeOverride = nil })
		end
	end
	
	return SystemThemeFeatureModule
end