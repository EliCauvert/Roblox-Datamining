local EnablePreferredTextSizeSetting = require(script.Parent.Parent.Parent.Parent.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting")
local ConstantsModule = {
	ThemeName = { Dark = "Dark", Light = "Light" },
	FontName = { Gotham = "Gotham" },
	DeviceType = {
		Desktop = "Desktop",
		Tablet = "Tablet",
		Phone = "Phone",
		Console = "Console",
		VR = "VR",
		Unknown = "Unknown"
	},
	Layout = { ActionBar = { PositionOffset = 24 } }
}
ConstantsModule.DefaultThemeName = ConstantsModule.ThemeName.Light
ConstantsModule.DefaultFontName = ConstantsModule.FontName.Gotham
ConstantsModule.DefaultDeviceType = ConstantsModule.DeviceType.Desktop
ConstantsModule.DefaultSettings = {
	preferredTransparency = 1,
	reducedMotion = false,
	scale = 1,
	preferredTextSize = if EnablePreferredTextSizeSetting then Enum.PreferredTextSize.Medium else nil
}

return ConstantsModule