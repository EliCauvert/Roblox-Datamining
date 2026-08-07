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