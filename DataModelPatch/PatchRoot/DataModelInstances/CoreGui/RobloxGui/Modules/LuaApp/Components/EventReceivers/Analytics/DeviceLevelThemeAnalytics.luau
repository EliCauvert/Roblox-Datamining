local SystemThemeSnapshotTimeDiffMins = game:DefineFastInt("SystemThemeSnapshotTimeDiffMins", 1440)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SystemThemeEnumModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeEnum)
local GetFFlagEnableThemeUpdatedLoggingFixModule = require(Modules.LuaApp.Flags.GetFFlagEnableThemeUpdatedLoggingFix)
local AppStorageService = game:GetService("AppStorageService")
local LoggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
local DeviceLevelThemeAnalyticsModule = {}
DeviceLevelThemeAnalyticsModule.__index = DeviceLevelThemeAnalyticsModule
local DeviceLevelThemeAnalyticsHundredthsPercent = game:DefineFastInt("DeviceLevelThemeAnalyticsHundredthsPercent", 10000)
DeviceLevelThemeAnalyticsModule.EventName = {
	ThemeSnapshot = "DeviceThemeSnapshot",
	ThemeChanged = "DeviceThemeChanged",
	SystemThemeRequest = "SystemThemeRequestCounter",
	SystemThemeObtainedSuccess = "SystemThemeLuaObtainedSuccess",
	SystemThemeObtainedError = "SystemThemeLuaObtainedError",
	SystemThemeUpdated = "SystemThemeUpdated",
	SystemThemeChangeRequest = "SystemThemeAppChange"
}
DeviceLevelThemeAnalyticsModule.ThemeName = {
	ThemeSystemDark = "SystemDark",
	ThemeSystemLight = "SystemLight",
	ThemeSystem = "System",
	ThemeDark = "Dark",
	ThemeLight = "Light",
	ThemeError = "Error"
}

function DeviceLevelThemeAnalyticsModule:onThemeSnapshot(Dark)
	-- upvalues: AppStorageService (copy), SystemThemeSnapshotTimeDiffMins (copy), DeviceLevelThemeAnalyticsModule (copy), LoggingProtocolModule (copy), DeviceLevelThemeAnalyticsHundredthsPercent (copy), GetFFlagEnableThemeUpdatedLoggingFixModule (copy), SystemThemeEnumModule (copy)
	if not game:GetEngineFeature("SystemThemeSnapshotTimeKeyAvailble") then return end
	local UnixTimestamp = DateTime.now().UnixTimestamp
	local DeviceLevelThemeSnapshotTimestampItem = AppStorageService:GetItem("DeviceLevelThemeSnapshotTimestamp")
	
	if DeviceLevelThemeSnapshotTimestampItem == "" then
		AppStorageService:SetItem("DeviceLevelThemeSnapshotTimestamp", (tostring(UnixTimestamp)))
		AppStorageService:Flush()
		
		return
	end
	if SystemThemeSnapshotTimeDiffMins * 60 < (tonumber(UnixTimestamp) or 0) - (tonumber(DeviceLevelThemeSnapshotTimestampItem) or 0) then
		self.telemetryService:LogEvent({
			description = "Event sent once a day to show the current selected theme",
			links = "",
			eventName = DeviceLevelThemeAnalyticsModule.EventName.ThemeSnapshot,
			backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
			throttlingPercentage = DeviceLevelThemeAnalyticsHundredthsPercent,
			lastUpdated = { 2025, 5, 13 }
		}, {
			customFields = {
				selectedTheme = if GetFFlagEnableThemeUpdatedLoggingFixModule() then if Dark == SystemThemeEnumModule.Light then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeLight elseif Dark == SystemThemeEnumModule.Dark then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeDark elseif Dark == SystemThemeEnumModule.SystemLight then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeSystemLight elseif Dark == SystemThemeEnumModule.SystemDark then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeSystemDark else DeviceLevelThemeAnalyticsModule.ThemeName.ThemeError elseif Dark == SystemThemeEnumModule.Light then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeLight elseif Dark == SystemThemeEnumModule.Dark then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeDark else DeviceLevelThemeAnalyticsModule.ThemeName.ThemeSystem
			}
		})
		AppStorageService:SetItem("DeviceLevelThemeSnapshotTimestamp", (tostring(UnixTimestamp)))
		AppStorageService:Flush()
	end
end

function DeviceLevelThemeAnalyticsModule:onThemeChanged(Dark)
	-- upvalues: DeviceLevelThemeAnalyticsModule (copy), LoggingProtocolModule (copy), DeviceLevelThemeAnalyticsHundredthsPercent (copy), SystemThemeEnumModule (copy)
	self.telemetryService:LogEvent({
		description = "Event sent when the selected theme has been changed",
		links = "",
		eventName = DeviceLevelThemeAnalyticsModule.EventName.ThemeChanged,
		backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = DeviceLevelThemeAnalyticsHundredthsPercent,
		lastUpdated = { 2025, 5, 13 }
	}, {
		customFields = {
			selectedTheme = if Dark == SystemThemeEnumModule.Light then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeLight elseif Dark == SystemThemeEnumModule.Dark then DeviceLevelThemeAnalyticsModule.ThemeName.ThemeDark else DeviceLevelThemeAnalyticsModule.ThemeName.ThemeSystem
		}
	})
end

function DeviceLevelThemeAnalyticsModule:onReceivedSystemThemeUpdated()
	-- upvalues: DeviceLevelThemeAnalyticsModule (copy)
	self.telemetryService:LogCounter({
		description = "Counter to be updated when lua receives a notification from the native layer that the system theme is updated",
		eventName = DeviceLevelThemeAnalyticsModule.EventName.SystemThemeUpdated,
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2025, 5, 13 }
	})
end

function DeviceLevelThemeAnalyticsModule:onRequestSystemTheme()
	-- upvalues: DeviceLevelThemeAnalyticsModule (copy)
	self.telemetryService:LogCounter({
		description = "Counter to be updated when lua requests the system theme from the native layer",
		eventName = DeviceLevelThemeAnalyticsModule.EventName.SystemThemeRequest,
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2025, 5, 13 }
	})
end

function DeviceLevelThemeAnalyticsModule:onGetSystemTheme(Error)
	-- upvalues: SystemThemeEnumModule (copy), DeviceLevelThemeAnalyticsModule (copy)
	if Error == SystemThemeEnumModule.Error then
		self.telemetryService:LogCounter({
			description = "Counter to be updated when lua receives an error for system theme value from the native layer",
			eventName = DeviceLevelThemeAnalyticsModule.EventName.SystemThemeObtainedError,
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2025, 5, 13 }
		})
		
		return
	else
		self.telemetryService:LogCounter({
			description = "Counter to be updated when lua receives the system theme value from the native layer",
			eventName = DeviceLevelThemeAnalyticsModule.EventName.SystemThemeObtainedSuccess,
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2025, 5, 13 }
		})
	end
end

function DeviceLevelThemeAnalyticsModule:onSetNativeTheme()
	-- upvalues: DeviceLevelThemeAnalyticsModule (copy)
	self.telemetryService:LogCounter({
		description = "Counter to be updated when lua send the native layer a set theme",
		eventName = DeviceLevelThemeAnalyticsModule.EventName.SystemThemeChangeRequest,
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2025, 5, 13 }
	})
end

function DeviceLevelThemeAnalyticsModule.new(TelemetryService)
	-- upvalues: DeviceLevelThemeAnalyticsModule (copy)
	local config = { telemetryService = TelemetryService }
	setmetatable(config, DeviceLevelThemeAnalyticsModule)
	
	return config
end

return DeviceLevelThemeAnalyticsModule