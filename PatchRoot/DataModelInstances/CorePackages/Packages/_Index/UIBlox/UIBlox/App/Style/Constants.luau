-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local var0 = require(script.Parent.Parent.Parent.Parent.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting")
local t = {
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
t.DefaultThemeName = t.ThemeName.Light
t.DefaultFontName = t.FontName.Gotham
t.DefaultDeviceType = t.DeviceType.Desktop
t.DefaultSettings = {
	preferredTransparency = 1,
	reducedMotion = false,
	scale = 1,
	preferredTextSize = if var0 then Enum.PreferredTextSize.Medium else nil
}

return t