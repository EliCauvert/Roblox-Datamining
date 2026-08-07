-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:18 2026 Pacific Standard Time.

local iconModule = require(script.Parent.Parent.Icon)

return {
	[Enum.Platform.PS3] = iconModule.Playstation,
	[Enum.Platform.PS4] = iconModule.Playstation,
	[Enum.Platform.PS5] = iconModule.Playstation,
	[Enum.Platform.XBoxOne] = iconModule.Xbox,
	[Enum.Platform.XBox360] = iconModule.Xbox,
	[Enum.Platform.Android] = iconModule.Android,
	[Enum.Platform.IOS] = iconModule.Apple,
	[Enum.Platform.OSX] = iconModule.Apple,
	[Enum.Platform.Windows] = iconModule.Microsoft,
	[Enum.Platform.MetaOS] = iconModule.Meta
}