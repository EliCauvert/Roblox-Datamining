local CorePackages = game:GetService("CorePackages")
local NextOrder = require(CorePackages.Packages.ReactUtils).createNextOrder()
local DeviceSettingsEnumModule = require(script.Parent.DeviceSettingsEnum)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagSystemTrayEnabledFunction = SharedFlagsModule.GetFFlagSystemTrayEnabled
local GetFFlagHideLaunchAtStartupMacFunction = SharedFlagsModule.GetFFlagHideLaunchAtStartupMac
local FFlagEnableRobloxPlusThemeSetting = SharedFlagsModule.FFlagEnableRobloxPlusThemeSetting
local config = {
	[DeviceSettingsEnumModule.SettingDescription] = NextOrder(),
	[DeviceSettingsEnumModule.MasterVolume] = NextOrder(),
	[DeviceSettingsEnumModule.PartyVoiceVolumeDivider] = NextOrder(),
	[DeviceSettingsEnumModule.PartyVoiceVolume] = NextOrder(),
	[DeviceSettingsEnumModule.DeviceLevelThemeDivider] = NextOrder(),
	[DeviceSettingsEnumModule.DeviceLevelTheme] = NextOrder()
}

if FFlagEnableRobloxPlusThemeSetting then
	config[DeviceSettingsEnumModule.RobloxPlusThemeDivider] = NextOrder()
	config[DeviceSettingsEnumModule.RobloxPlusTheme] = NextOrder()
end
config[DeviceSettingsEnumModule.PreferredTransparencyDivider] = NextOrder()
config[DeviceSettingsEnumModule.PreferredTransparency] = NextOrder()
config[DeviceSettingsEnumModule.HapticsDivider] = NextOrder()
config[DeviceSettingsEnumModule.Haptics] = NextOrder()
config[DeviceSettingsEnumModule.ReducedMotionDivider] = NextOrder()
config[DeviceSettingsEnumModule.ReducedMotion] = NextOrder()
config[DeviceSettingsEnumModule.PreferredTextSizeDivider] = NextOrder()
config[DeviceSettingsEnumModule.PreferredTextSize] = NextOrder()
config[DeviceSettingsEnumModule.UINavigationKeyBindDivider] = NextOrder()
config[DeviceSettingsEnumModule.UINavigationKeyBind] = NextOrder()
config[DeviceSettingsEnumModule.ReadAloudDivider] = NextOrder()
config[DeviceSettingsEnumModule.ReadAloud] = NextOrder()
config[DeviceSettingsEnumModule.VREnvironmentSettingDivider] = NextOrder()
config[DeviceSettingsEnumModule.VREnvironmentSetting] = NextOrder()
config[DeviceSettingsEnumModule.SkyStyleDivider] = NextOrder()
config[DeviceSettingsEnumModule.SkyStyle] = NextOrder()

if GetFFlagSystemTrayEnabledFunction() and not GetFFlagHideLaunchAtStartupMacFunction() then
	config[DeviceSettingsEnumModule.LaunchAtStartupDivider] = NextOrder()
	config[DeviceSettingsEnumModule.LaunchAtStartup] = NextOrder()
end
if GetFFlagSystemTrayEnabledFunction() then
	config[DeviceSettingsEnumModule.MinimizeToTrayDivider] = NextOrder()
	config[DeviceSettingsEnumModule.MinimizeToTray] = NextOrder()
end
return {
	CONTEXTUAL_SLIDER_BASE_WIDTH = 310,
	LAYOUT_ORDER = config,
	DeviceLevelThemeKey = { Dark = "dark", Light = "light", System = "system" }
}